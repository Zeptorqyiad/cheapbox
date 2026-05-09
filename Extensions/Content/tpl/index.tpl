<?php
/** @var array $content */

use App\Extensions\Addresses\Model\Addresses;

$addresses = Addresses::findAdv()->where(['is_active' => 1])->all();

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $content['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\Common\FirstscreenMain\Layout::draw([
        'title-accent' => $content['params']['index_fs_accent-title'],
        'title' => $content['params']['index_fs_title'],
        'subtitle' => $content['params']['index_fs_desc'],
        'card-title' => $content['params']['index_fs-card-title'],
        'card-subtitle' => $content['params']['index_fs-card-subtitle'],
        'image' => '/uf/images/source/'. $content['params']['index_fs_image'],
        'cards' => self::getTableFrom('index_fs_links', $content),
        'offer-title' => $content['params']['index_fs_offer-title'],
        'offer-price' => $content['params']['index_fs_offer-price'],
        'offer-time' => $content['params']['index_fs_offer-time'],
        'offer-list' => self::getTableFrom('index_fs_offer-list', $content),
    ]);

    App\Layout\Components\Common\AboutUs\Layout::draw([
        'title' =>  $content['params']['index_about_title'],
        'image' => '/uf/images/source/'. $content['params']['index_about_image'],
        'text' => $content['params']['index_about_text'],
        'task' => $content['params']['index_about_task'],
        'facts' => self::getTableFrom('index_about_facts', $content),
        'callback-title' => $content['params']['index_about_c_title'],
        'callback-desc' => $content['params']['index_about_c_desc'],
        'services' => true,
        'about_us' => true
    ]);

    App\Layout\Components\Common\Benefit\Layout::draw([
        'title' => $content['params']['benefit_title'],
        'desc' => $content['params']['benefit_desc'],
        'cards' => self::getTableFrom('benefit_cards', $content),
    ]);

    App\Layout\Components\Common\Map\Layout::draw([
        'main-title' => $content['params']['index_map_title'],
        'main-desc' => $content['params']['index_map_desc'],
        'city-title' => $content['params']['index_map_cities_title'],
        'city-badge' => self::getTableFrom('index_map_cities', $content),
        'country-title' => $content['params']['index_map_countries_title'],
        'country-badge' => self::getTableFrom('index_map_countries', $content),
        'image' => '/uf/images/source/' . $content['params']['index_map_image'],
        'image-t' => '/uf/images/source/' . $content['params']['index_map_image_tablet'],
        'addresses-title' => $content['params']['index_map_adresses_title-mob'],
        'addresses' => $addresses,
        'card-title' => $content['params']['index_map_callback-card_title'],
        'card-desc' => $content['params']['index_map_callback-card_desc'],
    ]);

    App\Layout\Components\Common\Categories\Layout::draw([
        'title' => $content['params']['categories_title'],
        'desc' => $content['params']['categories_desc'],
        'cards' => self::getTableFrom('categories_cards', $content),
        'callback-title' => $content['params']['categories_callback-card_title'],
        'callback-desc' => $content['params']['categories_callback-card_desc']
    ]);

    App\Layout\Components\Common\SliderSections\CasesSlider\Layout::draw([
        'title' => 'Наши кейсы',
        'link' => '/cases/',
    ]);

    App\Layout\Components\Common\Stages\Layout::draw([
        'title' => $content['params']['index_stages-title'],
        'desc' => $content['params']['index_stages-desc'],
        'cards' => $content['params']['index_stages-cards'],
    ]);

    App\Layout\Components\Common\Certificate\Layout::draw([
        'title' => $content['params']['certificate-title'],
        'desc' => $content['params']['certificate-desc'],
        'cards-plus' => self::getTableFrom('certificate-cards', $content),
        'cards-doc' => self::getTableFrom('certificate-doc', $content),
    ]);

    App\Layout\Components\Common\SliderSections\ReviewsSlider\Layout::draw([
        'title' => $content['params']['reviews-title'],
        'link' => '/reviews/'
    ]);

    App\Layout\Components\Common\SliderSections\BlogSlider\Layout::draw([
        'title' => 'Новости и статьи',
        'link' => '/blog/',
    ]);

    App\Layout\Components\Common\Info\Layout::draw([
        'title' => $content['params']['info_title'],
        'desc' => $content['params']['info_desc'],
        'cards' => self::getTableFrom('info_cards', $content),
    ]);

    App\Layout\Components\Common\Partners\Layout::draw([
        'title' => $content['params']['partners_title'],
        'desc' => $content['params']['partners_desc'],
        'items' => self::getTableFrom('partners_items', $content),
    ]);

    App\Layout\Components\Common\Contacts\Layout::draw([
        'title' => $content['params']['contacts_title'],
        'desc' => $content['params']['contacts_desc'],
    ]);

    App\Layout\Components\Common\FormBlock\Layout::draw([
        'title' => $content['params']['form_block-title'],
        'desc' => $content['params']['form_block-desc'],
        'image' => '/uf/images/source/' . $content['params']['form_block-image'],
    ]);

    App\Layout\Components\Common\Seo\Layout::draw([
        'seo-title' => $content['params']['seo_title_1'],
        'seo-desc' => $content['params']['seo_text_1'],
        'seo2-title' => $content['params']['seo_title_2'],
        'seo2-desc' => $content['params']['seo_text_2'],
    ]);
    ?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>
