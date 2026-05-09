<?php

namespace App\Layout\Components\UI\Other\VideoPlayer;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function generateVideoId($src, $link): string
    {
        return ($link) ?
            'ext_' . md5($link) :
            'local_' . md5($src);
    }
}