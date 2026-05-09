<?php

namespace App\Layout\Components\Cards\AboutCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawAboutCard(
        string $className = '',
        string $title = '',
        string $subtitle = '',
        string $desc = '',
        array  $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'subtitle',
                'desc',
                'attributes'
            )
        );
    }
}