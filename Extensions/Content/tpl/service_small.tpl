<?php
/** @var array $content */
/** @var \App\Extensions\Services\Model\ServiceSmall $service */

$index = $content->loadFrom('/');

$service = $this->service;

$s = App\Extensions\Services\Model\ServiceSmall::findAdv()->where(['is_active' => 1])->all();

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\Layouts\ServiceSmall\ServiceFs\Layout::draw([
        'title' => $this->service->fs_title,
        'desc' => $this->service->fs_desc,
        'image' => $this->service->fs_image,
        'offer-list' => $this->service->fs_offer_list,
    ]);

    if($this->service->stages_title){
        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $this->service->stages_title,
            'desc' => $this->service->stages_desc,
            'cards' => $this->service->stages_cards,
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

    App\Layout\Components\Common\Categories\Layout::draw([
        'title' => $index['params']['categories_title'],
        'desc' => $index['params']['categories_desc'],
        'cards' => self::getTableFrom('categories_cards', $index),
        'callback-title' => $index['params']['categories_callback-card_title'],
        'callback-desc' => $index['params']['categories_callback-card_desc']
    ]);

    if($this->service->other_services_title){
        App\Layout\Components\Common\OtherServices\Layout::draw([
            'title' => $this->service->other_services_title,
            'desc' => $this->service->other_services_desc,
            'services' => $this->service->other_services_services,
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

    App\Layout\Components\Common\SliderSections\ReviewsSlider\Layout::draw([
        'title' => $index['params']['reviews-title'],
        'link' => '/reviews/'
    ]);

    App\Layout\Components\Common\Benefit\Layout::draw([
        'title' => $index['params']['benefit_title'],
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
            'faq' => $this->service->faq_faq,
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