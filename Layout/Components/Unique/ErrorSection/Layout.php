<?php

namespace App\Layout\Components\Unique\ErrorSection;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawErrorSection(
        string $className = '',
        string $img = '',
        string $title = '',
        string $description = '',

    ): void
    {
        static::draw(compact(
                'className',
                'img',
                'title',
                'description',
            )
        );
    }
}