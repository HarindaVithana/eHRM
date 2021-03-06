<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class Basereportmnuitem extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_hr_sm_rpt_mnuitem');
        $this->hasColumn('sm_rpt_mnuitem_id', 'integer', 20, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '20',
             ));
        $this->hasColumn('sm_rpt_mnuitem_name', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('sm_rpt_mnuitem_name_si', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('sm_rpt_mnuitem_name_ta', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('sm_rpt_mnuitem_parent', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('sm_rpt_mnuitem_url', 'string', 300, array(
             'type' => 'string',
             'length' => '300',
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

        $this->hasMany('reportcapability', array(
             'local' => 'sm_rpt_mnuitem_id',
             'foreign' => 'sm_rpt_mnuitem_id'));
    }
}