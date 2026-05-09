<?php

namespace App\Layout\Components\Cards\TeamCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawTeamCard(
        string $className = '',
        string $name = '',
        string $job = '',
        string $img = '',
        array  $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'name',
                'job',
                'img',
                'attributes'
            )
        );
    }
}