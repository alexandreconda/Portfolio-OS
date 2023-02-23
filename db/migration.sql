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

COMMIT ;
