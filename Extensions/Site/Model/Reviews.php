<?php

namespace App\Extensions\Site\Model;

use Simflex\Core\ModelBase;

/**
 * @property int reviews_id
 * @property int npp
 * @property string title
 * @property string image
 * @property string groupImages
 * @property boolean is_active
 */

class Reviews extends ModelBase
{
    protected static $table = 'reviews';

    protected static $primaryKeyName = 'reviews_id';
}