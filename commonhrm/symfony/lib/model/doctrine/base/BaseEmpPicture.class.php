<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BaseEmpPicture extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_hr_emp_picture');
        $this->hasColumn('emp_number', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '4',
             ));
        $this->hasColumn('epic_picture as picture', 'blob', 2147483647, array(
             'type' => 'blob',
             'length' => '2147483647',
             ));
        $this->hasColumn('epic_filename as filename', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
        $this->hasColumn('epic_type as file_type', 'string', 50, array(
             'type' => 'string',
             'length' => '50',
             ));
        $this->hasColumn('epic_file_size as size', 'string', 20, array(
             'type' => 'string',
             'length' => '20',
             ));
    }

    public function setUp()
    {
        $this->hasOne('Employee', array(
             'local' => 'emp_number',
             'foreign' => 'emp_number'));

        $this->hasMany('EmployeeMaster', array(
             'local' => 'emp_number',
             'foreign' => 'emp_number'));
    }
}