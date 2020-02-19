<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BaseEmployeeDefLevel extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_hr_emp_level');
        $this->hasColumn('emp_number', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '4',
             ));
        $this->hasColumn('hie_code_1', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_2', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_3', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_4', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_5', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_6', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_7', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_8', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_9', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
        $this->hasColumn('hie_code_10', 'integer', 20, array(
             'type' => 'integer',
             'length' => '20',
             ));
    }

    public function setUp()
    {
        $this->hasOne('Employee', array(
             'local' => 'emp_number',
             'foreign' => 'emp_number'));
    }
}