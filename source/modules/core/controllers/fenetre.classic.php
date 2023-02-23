<?php
/**
* @package   source
* @subpackage core
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/

class fenetreCtrl extends jController {
    /**
    *
    */
    function index() {
        $rep = $this->getResponse('html');
        
        return $rep;
    }
    
    function ouvrirFenetre() {
        $rep = $this->getResponse('htmlfragment');
        $fid = $this->intParam('id_fichier');
        
        $db = jDb::getConnection();
        $query = $db->query("
            SELECT nom, repertoire, contenu, ids_enfants
            FROM core.fichier
            WHERE id = $fid
        ");
        while ($record = $query->fetch()) {
            $fichier = array('nom' => $record->nom, 'repertoire' => $record->repertoire, 'contenu' => $record->contenu, 'ids_enfants' => $record->ids_enfants);
        }
        

        $rep->tplname = 'core~fenetre';
        
        $rep->tpl->assign('titre', $fichier['nom']);
        
        if ($fichier['repertoire'] == 'f')
        {
            $rep->tpl->assign('contenu', $fichier['contenu']);
        }
        else if ($fichier['repertoire'] == 't')
        {
            // On convertit un tableau Postgre de la forme {n1,n2,n3} sous la forme d'un tableau PHP de la forme array(n1,n2,n3)
            $php_ids = explode(",", (trim($fichier['ids_enfants'], "{}")));
            
            jLog::log($php_ids);
            $rep->tpl->assignZone('contenu','core~fichiers', array('ids' => $php_ids));
        }
        else {
            throw new Exception('Type de fichier indéfini');
        }
        
        return $rep;
    }
    
    
}

