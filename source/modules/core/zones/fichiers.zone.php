<?php

class fichiersZone extends jZone {

   protected $_tplname='fichiers';

   protected function _prepareTpl(){
       $db = jDb::getConnection();
       $ids = implode(",", $this->param('ids'));
       
       if (empty($ids))
       {
           $ids = -1;
       }

       $query = $db->query("
            SELECT id, nom, img
            FROM core.fichier
            WHERE id IN (" . $ids . ")
            ORDER BY repertoire DESC, nom
        ");
       
       $fichiers = array();
       while ($record = $query->fetch()) {
           $fichiers[] = array('id' => $record->id, 'nom' => $record->nom, 'img' => $record->img);
       }

       $this->_tpl->assign('fichiers', $fichiers);
   }
}