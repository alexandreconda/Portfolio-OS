BEGIN ;

CREATE SCHEMA IF NOT EXISTS core;

CREATE TABLE core.fichier
(
	id serial PRIMARY KEY,
	nom TEXT NOT NULL,
	id_parent INTEGER,
	repertoire BOOL,
	contenu TEXT,
	ids_enfants INTEGER[],
    	CONSTRAINT nom_ukey UNIQUE (nom, id_parent),
    	CONSTRAINT chk_contenu CHECK (contenu IS NULL OR repertoire IS FALSE),
    	CONSTRAINT chk_ids_enfants CHECK (ids_enfants IS NULL OR repertoire IS TRUE)
);


-- Seul le repertoire racine n'a pas de parent
CREATE UNIQUE INDEX i_fichier ON core.fichier ((id_parent IS NULL)) WHERE id_parent IS NULL;
INSERT INTO core.fichier(nom, repertoire) VALUES ('racine', TRUE);

-- On évite la recursivité dans l'arborescence des fichiers
ALTER TABLE core.fichier
ADD CONSTRAINT check_not_recursive CHECK (NOT(id_parent = ANY (ids_enfants::int[])))

-- On évite les cycles dans l'arborescence des fichiers
CREATE OR REPLACE FUNCTION detecter_cycle()
  RETURNS TRIGGER
  LANGUAGE plpgsql AS
$func$
BEGIN
  IF EXISTS (
      WITH RECURSIVE liste_parents(parent) AS (
         -- On récupère les ascendants du nouveau fichier pour voir si l'un d'entre eux
         -- n'est pas le fichier en question
         SELECT f.id_parent
         FROM core.fichier AS f
         WHERE f.id = NEW.id_parent
       UNION ALL
         SELECT f.id_parent
         FROM core.fichier AS f,  liste_parents as lp
         WHERE f.id = lp.parent
       ) SELECT * FROM liste_parents WHERE liste_parents.parent = NEW.id LIMIT 1
  )
  THEN
    RAISE EXCEPTION 'Boucle détectée';
  ELSE
    RETURN NEW;
  END IF;
END
$func$;

DROP TRIGGER IF EXISTS detecter_cycle_arborescence ON core.fichier;

CREATE CONSTRAINT TRIGGER detecter_cycle_arborescence
AFTER INSERT OR UPDATE ON core.fichier
FOR EACH ROW EXECUTE PROCEDURE detecter_cycle();

COMMIT ;
