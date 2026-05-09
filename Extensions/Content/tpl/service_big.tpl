<?php
/** @var array $content */

use App\Extensions\Services\Model\ServiceBig;
use App\Extensions\Addresses\Model\Addresses;

$addresses = Addresses::findAdv()->where(['is_active' => 1])->all();

$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\Layouts\ServiceBig\ServiceFs\Layout::draw([
        'title' => $this->service->fs_title,
        'desc' => $this->service->fs_desc,
        'image' => '/uf/images/source/' . $this->service->fs_image,
        'price' => $this->service->fs_price,
        'time' => $this->service->fs_time,
    ]);

    if($this->service->about_title) {
        App\Layout\Components\Layouts\ServiceBig\ServiceAbout\Layout::draw([
            'title' => $this->service->about_title,
            'desc' => $this->service->about_desc,
            'subtitle-left' => $this->service->about_sub_left,
            'desc-left' => $this->service->about_desc_left,
            'bullits' => $this->service->about_bullits,
            'accent-text' => $this->service->about_accent_text,
            'items' => $this->service->about_items,
            'image' => '/uf/images/source/' . $this->service->about_image,
            'offer-title' => $this->service->about_offer_title,
            'offer-desc' => $this->service->about_offer_desc,
            'offer-price' => $this->service->about_offer_price,
            'offer-time' => $this->service->about_offer_time,
            'offer-text' => $this->service->about_offer_text,
        ]);
    }

    if($this->service->service_benefit_title){
        App\Layout\Components\Common\Benefit\Layout::draw([
            'title' => $this->service->service_benefit_title,
            'desc' => $this->service->service_benefit_desc,
            'serv-cards' => $this->service->service_benefit_cards,
        ]);
    }

    if($this->service->consist_title){
        App\Layout\Components\Common\Consist\Layout::draw([
            'title' => $this->service->consist_title,
            'desc' => $this->service->consist_desc,
            'badges' => $this->service->consist_badges
        ]);
    }

    if($this->service->types_title){
        App\Layout\Components\Common\Types\Layout::draw([
            'title' => $this->service->types_title,
            'desc' => $this->service->types_desc,
            'badge' => $this->service->types_badge,
            'image' => $this->service->types_image,
            'image-t' => $this->service->types_image_t,
            'image-guarantee' => $this->service->types_image_guarantee,
            'card-text' => $this->service->types_card_text,
            'card-image' => '/uf/images/source/' . $this->service->types_card_icon,
            'card-desc' => $this->service->types_card_desc
        ]);
    }

    if($this->service->other_service_title){
        App\Layout\Components\Layouts\ServiceBig\ServiceAbout\Layout::draw([
            'title' => $this->service->other_service_title,
            'desc' => $this->service->other_service_desc,
            'subtitle-left' => $this->service->other_service_sub_left,
            'desc-left' => $this->service->other_service_desc_left,
            'accent-text' => $this->service->other_service_acc_text,
            'callback-title' => $this->service->other_service_cc_title,
            'callback-desc' => $this->service->other_service_cc_desc
        ]);
    }

    if($this->service->stages_title){
        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $this->service->stages_title,
            'desc' => $this->service->stages_desc,
            'cards' => $this->service->stages_cards,
            'image' => '/uf/images/source/' . $this->service->stages_image,
            'offer-title' => $this->service->stages_off_title,
            'offer-desc' => $this->service->stages_off_desc,
            'offer-text' => $this->service->stages_off_text,
            'offer-price' => $this->service->stages_off_price,
            'offer-time' => $this->service->stages_off_time
        ]);
    }
    if($this->service->another_stages_title){
        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $this->service->another_stages_title,
            'desc' => $this->service->another_stages_desc,
            'cards' => $this->service->another_stages_cards,
        ]);
    }

    if($this->service->risks_title){
        App\Layout\Components\Common\Risks\Layout::draw([
            'title' => $this->service->risks_title,
            'desc' => $this->service->risks_desc,
            'text' => $this->service->risks_text,
            'callback-title' => $this->service->risks_callback_title,
            'callback-desc' => $this->service->risks_callback_desc,
        ]);
    }

    if($this->service->tables_title){
        App\Layout\Components\Common\TablesBlock\Layout::draw([
            'title' => $this->service->tables_title,
            'desc' => $this->service->tables_desc,
            'table-title' => $this->service->tables_table_title,
            'table-second-title' => $this->service->tables_table_second_title,
            'body' => $this->service->tables_table_second_city,
            'content-title' => $this->service->tables_content_title,
            'desc-content' => $this->service->tables_desc_content,
            'accent-descr' => $this->service->tables_accent_descr,
        ]);
    }

    if($this->service->options_title){
        App\Layout\Components\Common\Options\Layout::draw([
            'title' => $this->service->options_title,
            'desc' => $this->service->options_desc,
            'items' => $this->service->options_items,
        ]);
    }

    if($this->service->route_map_title){
        App\Layout\Components\Common\RouteMap\Layout::draw([
            'title' => $this->service->route_map_title,
            'desc' => $this->service->route_map_desc,
            'image-map' => '/uf/images/source/' . $index['params']['index_map_image'],
            'items' => $this->service->route_map_items,
            'callback-title' => $this->service->route_map_callback_title,
            'callback-desc' => $this->service->route_map_callback_desc,
        ]);
    }

    if($this->service->another_about_title){
        App\Layout\Components\Layouts\ServiceBig\ServiceAbout\Layout::draw([
            'title' => $this->service->another_about_title,
            'desc' => $this->service->another_about_desc,
            'subtitle-left' => $this->service->another_about_sub_left,
            'desc-left' => $this->service->another_about_desc_left,
            'subtitle-right' => $this->service->another_about_sub_right,
            'desc-right' => $this->service->another_about_desc_right,
        ]);
    }

    App\Layout\Components\Common\Categories\Layout::draw([
        'title' => $index['params']['categories_title'],
        'desc' => $index['params']['categories_desc'],
        'cards' => self::getTableFrom('categories_cards', $index),
        'callback-title' => $index['params']['categories_callback-card_title'],
        'callback-desc' => $index['params']['categories_callback-card_desc']
    ]);

    if($this->service->other_serv_title){
        App\Layout\Components\Common\OtherServices\Layout::draw([
            'title' => $this->service->other_serv_title,
            'desc' => $this->service->other_serv_desc,
            'services' => $this->service->other_serv_links
        ]);
    }

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

    App\Layout\Components\Common\SliderSections\ReviewsSlider\Layout::draw([
        'title' => $index['params']['reviews-title'],
        'link' => '/reviews/',
    ]);

    App\Layout\Components\Common\Benefit\Layout::draw([
        'title' => $index['params']['benefit_title'] ,
        'desc' => $index['params']['benefit_desc'],
        'cards' => self::getTableFrom('benefit_cards', $index),
    ]);

    App\Layout\Components\Common\Certificate\Layout::draw([
        'title' => $index['params']['certificate-title'],
        'desc' => $index['params']['certificate-desc'],
        'cards-plus' => self::getTableFrom('certificate-cards', $index),
        'cards-doc' => self::getTableFrom('certificate-doc', $index),
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

    if($this->service->faq_title){
        App\Layout\Components\Common\Faq\Layout::draw([
            'title' => $this->service->faq_title,
            'desc' => $this->service->faq_desc,
            'faq' => $this->service->faq_items
        ]);
    }

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
        'seo-title' => $this->service->seo_title,
        'seo-desc' => $this->service->seo_desc,
        'seo2-title' => $this->service->seo2_title,
        'seo2-desc' => $this->service->seo2_desc,
    ]);
?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>