<?php

namespace App\Layout\Components\Cards\BlogCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawBlogCard(
        string             $className = '',
        string             $link = '',
        string             $title = '',
        string             $desc = '',
        string             $image = '',
        string             $date = '',
        string             $category = '',
        string             $video = '',
        string             $video_h = '',
        string             $video_v = '',
        array              $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'link',
                'title',
                'desc',
                'image',
                'date',
                'category',
                'video',
                'video_h',
                'video_v',
                'attributes'
            )
        );
    }
}