<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BaseDistrict extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_hr_district');
        $this->hasColumn('district_id', 'integer', 20, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'length' => '20',
             ));
        $this->hasColumn('district_name', 'integer', 7, array(
             'type' => 'integer',
             'length' => '7',
             ));
        $this->hasColumn('district_name_si', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('district_name_ta', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
    }

    public function setUp()
    {
        $this->hasMany('ServiceHistory', array(
             'local' => 'district_id',
             'foreign' => 'esh_district'));
    }
}