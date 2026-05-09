<?php

namespace App\Extensions\Site\Model;

use Simflex\Core\ModelBase;

/**
 * @property int category_id
 * @property int is_active
 * @property int npp
 * @property string name
 * @property text subtitle
 */

class ServiceCategory extends ModelBase
{
    protected static $table = 'service_category';
    protected static $primaryKeyName = 'category_id';
}