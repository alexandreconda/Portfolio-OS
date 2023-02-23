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
            SELECT id, nom
            FROM core.fichier
            WHERE id IN (" . $ids . ")
            ORDER BY nom
        ");
       
       $fichiers = array();
       while ($record = $query->fetch()) {
           $fichiers[] = array('id' => $record->id, 'nom' => $record->nom, 'img' => 'computer.svg');
       }

       $this->_tpl->assign('fichiers', $fichiers);
   }
}