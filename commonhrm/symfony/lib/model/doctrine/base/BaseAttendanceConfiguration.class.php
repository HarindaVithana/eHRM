<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BaseAttendanceConfiguration extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_hr_atn_fieldformat');
        $this->hasColumn('aff_id', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '4',
             ));
        $this->hasColumn('aff_fieldname', 'string', 200, array(
             'type' => 'string',
             'length' => '200',
             ));
        $this->hasColumn('aff_fieldstartposition', 'string', 3, array(
             'type' => 'string',
             'length' => '3',
             ));
        $this->hasColumn('aff_fieldendposition', 'string', 3, array(
             'type' => 'string',
             'length' => '3',
             ));
        $this->hasColumn('aff_fielddatatype', 'string', 20, array(
             'type' => 'string',
             'length' => '20',
             ));
        $this->hasColumn('aff_fieldformat', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
    }

}