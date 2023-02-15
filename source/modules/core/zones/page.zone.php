<?php

class pageZone extends jZone {

   protected $_tplname='page';

   protected function _prepareTpl(){
       $this->_tpl->assignZone('WINDOW','core~window');
       $this->_tpl->assignZone('TASKBAR','core~taskbar');
   }
}