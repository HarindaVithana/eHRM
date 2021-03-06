<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class Basemenuitem extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_hr_sm_mnuitem');
        $this->hasColumn('sm_mnuitem_id', 'integer', 50, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '50',
             ));
        $this->hasColumn('sm_mnuitem_name', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('sm_mnuitem_name_si', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('sm_mnuitem_name_ta', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('sm_mnuitem_parent', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('sm_mnuitem_level', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('sm_mnuitem_webpage_url', 'string', 300, array(
             'type' => 'string',
             'length' => '300',
             ));
        $this->hasColumn('sm_mnuitem_position', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('mod_id', 'string', 36, array(
             'type' => 'string',
             'length' => '36',
             ));
    }

    public function setUp()
    {
        $this->hasOne('Module', array(
             'local' => 'mod_id',
             'foreign' => 'mod_id'));

        $this->hasOne('mnucapability', array(
             'local' => 'sm_mnuitem_id',
             'foreign' => 'sm_mnuitem_id'));
    }
}