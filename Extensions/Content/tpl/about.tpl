<?php
/** @var array $content */

$index = $content->loadFrom('/');

use App\Extensions\Addresses\Model\Addresses;
$addresses = Addresses::findAdv()->where(['is_active' => 1])->all();

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Layouts\AboutUs\AboutFs\Layout::draw([
        'title' => $content['params']['about_fs-title'],
        'subtitle' => $content['params']['about_fs-subtitle'],
        'text' => $content['params']['about_fs-text'],
        'image' => '/uf/images/source/' . $content['params']['about_fs-image'],
    ]);

    App\Layout\Components\Common\AboutUs\Layout::draw([
        'title' =>  $index['params']['index_about_title'],
        'image' => '/uf/images/source/'. $index['params']['index_about_image'],
        'text' => $index['params']['index_about_text'],
        'task' => $index['params']['index_about_task'],
        'facts' => self::getTableFrom('index_about_facts', $index),
        'services' => true,
    ]);

    App\Layout\Components\Layouts\AboutUs\AboutHistory\Layout::draw([
        'title' => $content['params']['about_history-title'],
        'desc' => $content['params']['about_history-desc'],
        'image' => $content['params']['about_history-image'],
        'callback-title' => $content['params']['about_history_callback-title'],
        'callback-desc' => $content['params']['about_history_callback-desc']
    ]);

    App\Layout\Components\Layouts\AboutUs\AboutNaming\Layout::draw([
        'title' => $content['params']['about_naming-title'],
        'desc' => $content['params']['about_naming-desc'],
        'image' => $content['params']['about_naming-image'],
        'cards' => self::getTableFrom('about_naming-cards', $content),
    ]);

    App\Layout\Components\Layouts\AboutUs\AboutTeam\Layout::draw([
        'title' => $content['params']['about_team-title'],
        'desc' => $content['params']['about_team-desc'],
        'cards' => self::getTableFrom('about_team-cards', $content),
    ]);

    App\Layout\Components\Common\Map\Layout::draw([
        'main-title' => $index['params']['index_map_title'],
        'main-desc' => $index['params']['index_map_desc'],
        'city-title' => $index['params']['index_map_cities_title'],
        'city-badge' => self::getTableFrom('index_map_cities', $index),
        'country-title' => $index['params']['index_map_countries_title'],
        'country-badge' => self::getTableFrom('index_map_countries', $index),
        'image' => '/uf/images/source/' . $index['params']['index_map_image'],
        'image-t' => '/uf/images/source/' . $index['params']['index_map_image_tablet'],
        'addresses-title' => $index['params']['index_map_adresses_title-mob'],
        'addresses' => $addresses,
        'card-title' => $index['params']['index_map_callback-card_title'],
        'card-desc' => $index['params']['index_map_callback-card_desc'],
    ]);

    App\Layout\Components\Common\Stages\Layout::draw([
        'title' => $index['params']['index_stages-title'],
        'desc' => $index['params']['index_stages-desc'],
        'cards' => $index['params']['index_stages-cards'],
    ]);

    App\Layout\Components\Common\Categories\Layout::draw([
        'title' => $index['params']['categories_title'],
        'desc' => $index['params']['categories_desc'],
        'cards' => self::getTableFrom('categories_cards', $index),
        'callback-title' => $index['params']['categories_callback-card_title'],
        'callback-desc' => $index['params']['categories_callback-card_desc']
    ]);

    App\Layout\Components\Common\Certificate\Layout::draw([
        'title' => $index['params']['certificate-title'],
        'desc' => $index['params']['certificate-desc'],
        'cards-plus' => self::getTableFrom('certificate-cards', $index),
        'cards-doc' => self::getTableFrom('certificate-doc', $index),
    ]);

    App\Layout\Components\Common\SliderSections\ReviewsSlider\Layout::draw([
        'title' => $index['params']['reviews-title'],
        'link' => '/reviews/'
    ]);

    App\Layout\Components\Common\Info\Layout::draw([
        'title' => $index['params']['info_title'],
        'desc' => $index['params']['info_desc'],
        'cards' => self::getTableFrom('info_cards', $index),
    ]);

    App\Layout\Components\Common\Partners\Layout::draw([
        'title' => $index['params']['partners_title'],
        'desc' => $index['params']['partners_desc'],
        'items' => self::getTableFrom('partners_items', $index),
    ]);

    App\Layout\Components\Common\SliderSections\CasesSlider\Layout::draw([
        'title' => 'Наши кейсы',
        'link' => '/cases/',
    ]);

    App\Layout\Components\Common\Faq\Layout::draw([
        'title' => $content['params']['faq-title'],
        'desc' => $content['params']['faq-desc'],
        'faq' => $content['params']['faq-faq'],
    ]);

    App\Layout\Components\Common\SliderSections\BlogSlider\Layout::draw([
        'title' => 'Новости и статьи',
        'link' => '/blog/',
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