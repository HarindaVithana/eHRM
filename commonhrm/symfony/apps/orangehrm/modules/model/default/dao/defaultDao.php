<?php
/**
 * -------------------------------------------------------------------------------------------------------
 *  Author    - Roshan Wijesena
 *  On (Date) - 26 July 2011
 *  Comments  - Disciplinary Module Data Access CRUD operation
 *  Version   - Version 1.0
 * -------------------------------------------------------------------------------------------------------
 * */


class DefaultDao extends BaseDao {
   function get_breadcrumb($node, $culture="") {
       

        $q = Doctrine_Query::create()
                        ->from('menuitem m')
                        ->where("m.sm_mnuitem_id = ?", $node);
       

        $row = $q->fetchArray();
        //die(print_r($row));
    
        $path = array();

        
        if ($row[0]['sm_mnuitem_parent'] != 0) {
           
            if ($culture == "si") {
                $title1 = $row[0]['sm_mnuitem_name_si'];
                if($title1==""){
                $path[] = $row[0]['sm_mnuitem_name'];
            }else{
                $path[] = $row[0]['sm_mnuitem_name_si'];
            }

               
            } elseif ($culture == "ta") {
                 
                $title2 = $row[0]['sm_mnuitem_name_ta'];
                if($title2==""){
                $path[] = $row[0]['sm_mnuitem_name'];
            }
            else{
                $path[] = $row[0]['sm_mnuitem_name_ta'];
            }
            } else {
                                 
                $path[] = $row[0]['sm_mnuitem_name'];

            }


            $path = array_merge($this->get_breadcrumb($row[0]['sm_mnuitem_parent'], $culture), $path);
           
        }else{
           if ($culture == "si") {
                $title1 = $row[0]['sm_mnuitem_name_si'];
                if($title1==""){
                $path[] = $row[0]['sm_mnuitem_name'];
            }else{
                $path[] = $row[0]['sm_mnuitem_name_si'];
            }

               
            } elseif ($culture == "ta") {
                 
                $title2 = $row[0]['sm_mnuitem_name_ta'];
                if($title2==""){
                $path[] = $row[0]['sm_mnuitem_name'];
            }
            else{
                $path[] = $row[0]['sm_mnuitem_name_ta'];
            }
            } else {
                                 
                $path[] = $row[0]['sm_mnuitem_name'];

            }
             //$path = array_merge($this->get_breadcrumb($row[0]['sm_mnuitem_parent'], $culture), $path);
        }

       
        return $path;
    }

}

?>
