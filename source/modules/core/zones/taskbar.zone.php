<?php

class taskbarZone extends jZone {

   protected $_tplname='taskbar';

   protected function _prepareTpl(){
       $this->_tpl->assignZone('DEMARRER','core~demarrer');
   }
}