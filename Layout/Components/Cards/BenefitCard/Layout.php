<?php

namespace App\Layout\Components\Cards\BenefitCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawBenefitCard(
        string           $className = '',
        string           $title = '',
        string           $text = '',
        string           $img = '',
        string           $link = '',
        BenefitCardColor $color = BenefitCardColor::Main,
        array            $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'text',
                'img',
                'link',
                'attributes'
            ) + [
                'color' => $color->value
            ]
        );
    }
}