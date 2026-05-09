<?php
/** @var array $content */

$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\Common\FirstscreenMain\Layout::draw([
        'className' => 'services__fs-main',
        'title' => $content['params']['services_fs_title'],
        'subtitle' => $content['params']['services_fs_desc'],
        'image' => '/uf/images/source/'. $content['params']['services_fs_image'],
        'card-title' => $index['params']['index_fs-card-title'],
        'card-subtitle' => $index['params']['index_fs-card-subtitle'],
        'offer-title' => $index['params']['index_fs_offer-title'],
        'offer-price' => $index['params']['index_fs_offer-price'],
        'offer-time' => $index['params']['index_fs_offer-time'],
        'offer-list' => self::getTableFrom('index_fs_offer-list', $index),
    ]);

    App\Layout\Components\Common\Services\Layout::draw([
        'title' => $content['params']['services_steps-title'],
        'description' => $content['params']['services_steps-desc'],
        'express-title' => $content['params']['services_express-title'],
        'express-text' => $content['params']['services_express-text'],
        'express-icon' => '/uf/images/source/' . $content['params']['services_express-icon'],
    ]);

    App\Layout\Components\Common\AboutUs\Layout::draw([
        'title' =>  $index['params']['index_about_title'],
        'image' => '/uf/images/source/'. $index['params']['index_about_image'],
        'text' => $index['params']['index_about_text'],
        'task' => $index['params']['index_about_task'],
        'facts' => self::getTableFrom('index_about_facts', $index),
        'callback-title' => $index['params']['index_about_c_title'],
        'callback-desc' => $index['params']['index_about_c_desc'],
        'services' => true,
        'about_us' => true
    ]);

    App\Layout\Components\Common\Benefit\Layout::draw([
        'title' => $index['params']['benefit_title'],
        'desc' => $index['params']['benefit_desc'],
        'cards' => self::getTableFrom('benefit_cards', $index),
    ]);

    App\Layout\Components\Common\Stages\Layout::draw([
        'title' => $index['params']['index_stages-title'],
        'desc' => $index['params']['index_stages-desc'],
        'cards' => $index['params']['index_stages-cards'],
    ]);

    App\Layout\Components\Common\Certificate\Layout::draw([
        'title' => $index['params']['certificate-title'],
        'desc' => $index['params']['certificate-desc'],
        'cards-plus' => self::getTableFrom('certificate-cards', $index),
        'cards-doc' => self::getTableFrom('certificate-doc', $index),
    ]);

    App\Layout\Components\Common\SliderSections\BlogSlider\Layout::draw([
        'title' => 'Новости и статьи',
        'link' => '/blog/',
    ]);

    App\Layout\Components\Common\Partners\Layout::draw([
        'title' => $index['params']['partners_title'],
        'desc' => $index['params']['partners_desc'],
        'items' => self::getTableFrom('partners_items', $index),
    ]);

    App\Layout\Components\Common\Contacts\Layout::draw([
        'title' => $index['params']['contacts_title'],
        'desc' => $index['params']['contacts_desc'],
    ]);

    App\Layout\Components\Common\FormBlock\Layout::draw([
        'title' => $index['params']['form_block-title'],
        'desc' => $index['params']['form_block-desc'],
        'image' => '/uf/images/source/' . $index['params']['form_block-image'],
    ]);

    App\Layout\Components\Common\Seo\Layout::draw([
        'seo-title' => $index['params']['seo_title_1'],
        'seo-desc' => $index['params']['seo_text_1'],
        'seo2-title' => $index['params']['seo_title_2'],
        'seo2-desc' => $index['params']['seo_text_2'],
    ]);
    ?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>