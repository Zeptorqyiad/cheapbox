<?php

namespace App\Extensions\Site\Model;

use Simflex\Core\ModelBase;

/**
 * @property int p2c_c_id
 * @property int category_id
 * @property int sb_id
 */

class ServiceBigCategory extends ModelBase
{
    protected static $table = 'service_p2c_big';
    protected static $primaryKeyName = 'p2c_с_id';
}