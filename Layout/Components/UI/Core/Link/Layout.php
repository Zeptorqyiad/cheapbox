<?php

namespace App\Layout\Components\UI\Core\Link;

use App\Layout\Components\UI\Core\Link\LinkSize;
use App\Layout\Components\UI\Core\Link\LinkStyle;
use App\Layout\Components\UI\Core\Link\LinkTheme;
use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawLink(
        string     $className = '',
        string     $text = '',
        string     $link = '',
        string     $iconLeft = '',
        string     $iconRight = '',
        LinkStyle   $style = LinkStyle::Flat,
        LinkSize    $size = LinkSize::Medium,
        LinkTheme   $theme = LinkTheme::Light,
        array      $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'text',
                'link',
                'iconLeft',
                'iconRight',
                'attributes'
            ) + [
                'style' => $style->value,
                'size' => $size->value,
                'theme' => $theme->value,
            ]
        );
    }
}