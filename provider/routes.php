<?php

return [
    '/' => \App\Extensions\Content\Content::class,
    '/blog' => \App\Extensions\Blog\Component\Blog::class,
    '/cases' => \App\Extensions\Cases\Component\Cases::class,
    '/services' => \App\Extensions\Services\Component\Service::class,
    '/form' => \App\Extensions\Form\Component\AjaxForm::class
];