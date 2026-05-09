<?php

namespace App\Layout\Components\Layouts\Post\PostFs;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawPostFs(
        string $className = '',
        string $title = '',
        string $description = '',
        string $img = '',

    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'description',
                'img',
            )
        );
    }
}