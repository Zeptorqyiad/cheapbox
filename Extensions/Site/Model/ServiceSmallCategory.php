<?php

namespace App\Extensions\Site\Model;

use Simflex\Core\ModelBase;

/**
 * @property int p2c_sm_id
 * @property int category_id
 * @property int service_small_id
 */

class ServiceSmallCategory extends ModelBase
{
    protected static $table = 'service_p2c_small';
    protected static $primaryKeyName = 'p2c_sm_id';
}