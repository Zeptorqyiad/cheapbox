<?php

namespace App\Layout\Components\UI\Core\Marker;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawMarker(
        string     $className = '',
        string     $icon = '',
        string     $img = '',
        string     $number = '',
        MarkerSize $size = MarkerSize::Medium,
        array      $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'icon',
                'img',
                'number',
                'attributes'
            ) + [
                'size' => $size->value,
            ]
        );
    }
}