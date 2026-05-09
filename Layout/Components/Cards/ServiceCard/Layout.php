<?php

namespace App\Layout\Components\Cards\ServiceCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawServiceCard(
        string           $className = '',
        string           $title = '',
        string           $desc = '',
        string           $link = '',
        ServiceCardBorder $border = ServiceCardBorder::Main,
        array            $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'desc',
                'link',
                'attributes'
            )+ [
                'border' => $border->value,
            ]
        );
    }
}