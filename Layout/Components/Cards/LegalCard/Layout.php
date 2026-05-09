<?php

namespace App\Layout\Components\Cards\LegalCard;

use App\Layout\LayoutBase;

class
Layout extends LayoutBase
{
    public static function drawLegalCard(
        string $className = '',
        string $title = '',
        string $link = '',
    ): void
    {
        static::draw(compact(
            'className',
            'title',
            'link'
            )
        );
    }
}