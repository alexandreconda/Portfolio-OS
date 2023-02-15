<?php

class windowZone extends jZone {

   protected $_tplname='window';

   protected function _prepareTpl(){
       $icons = array(
           array('name' => 'Postes de travail', 'img' => 'computer.svg'),
           array('name' => 'Etudes', 'img' => 'computer.svg'),
           array('name' => 'Alexandre', 'img' => 'computer.svg'),
           // add more icons here
       );

       $this->_tpl->assign('icons', $icons);
   }
}