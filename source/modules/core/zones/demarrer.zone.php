<?php

class demarrerZone extends jZone {

   protected $_tplname='demarrer';

   protected function _prepareTpl(){
       $db = jDb::getConnection();
       $query = $db->query("
            SELECT id, img
            FROM core.fichier
            WHERE id_parent = 1 AND nom = 'aPropos'
        ");

       while ($record = $query->fetch()) {
           $id_aPropos = $record->id;
           $icone = $record->img;
       }

       $this->_tpl->assignZone('aPropos', 'core~fichier', array('id_fichier' => $id_aPropos));
       $this->_tpl->assign('icone', $icone);
   }
}