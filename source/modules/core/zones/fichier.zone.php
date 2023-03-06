<?php

class fichierZone extends jZone {

    protected function _createContent(){
       $rep = null;
       $fid = $this->param('id_fichier');
       $fid = ((int)$fid ? (int)$fid : -1) ;
       
       $db = jDb::getConnection();
       $query = $db->query("
            SELECT nom, repertoire, contenu, ids_enfants
            FROM core.fichier
            WHERE id = $fid
        ");
       while ($record = $query->fetch()) {
           $fichier = array('nom' => $record->nom, 'repertoire' => $record->repertoire, 'contenu' => $record->contenu, 'ids_enfants' => $record->ids_enfants);
       }
       
       if (!$fichier)
       {
           return null;
       }
       
       if ($fichier['repertoire'] == 'f')
       {
           $rep = nl2br($fichier['contenu']);
       }
       else if ($fichier['repertoire'] == 't')
       {
           // On convertit un tableau Postgre de la forme {n1,n2,n3} sous la forme d'un tableau PHP de la forme array(n1,n2,n3)
           $php_ids = explode(",", (trim($fichier['ids_enfants'], "{}")));
           $rep = jZone::get('core~fichiers', array('ids' => $php_ids));
       }
       else 
       {
           throw new Exception('Type de fichier indéfini');
       }
       
       return $rep;
   }
}