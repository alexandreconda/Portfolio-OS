<?php

class windowZone extends jZone {

   protected $_tplname='window';

   protected function _prepareTpl(){
       $db = jDb::getConnection();
       
       $query = $db->query("
            SELECT id
            FROM core.fichier
            WHERE id_parent = (SELECT id FROM core.fichier WHERE nom = 'racine' AND id_parent IS NULL)
        ");        
       
       $ids = array();
       while ($record = $query->fetch()) {
           $ids[] = $record->id;
       }
       
       $this->_tpl->assignZone('FICHIERS','core~fichiers', array('ids' => $ids));
   }
}