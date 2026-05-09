<?php
/** @var array $data */

$tg = Simflex\Core\Core::siteParam('tg');
$wt = Simflex\Core\Core::siteParam('whats_app');

use App\Extensions\Site\Model\ServiceCategory;

$vedOptions = getServiceOptions('Консультация ВЭД');
$customsOptions = getServiceOptions('Таможенное оформление');
$interOptions = getServiceOptions('Международные перевозки');
$finOptions = getServiceOptions('Финансовая логистика');

$catInter = ServiceCategory::findAdv()->where(['name' => 'Международные перевозки'])->all();
$catCustom = ServiceCategory::findAdv()->where(['name' => 'Таможенное оформление'])->all();

?>

<div class="header-nav">
    <div class="header-nav__container">
        <div class="header-nav__nav-list">
            <?php
                // ========== Заголовок дроутаба (Консультация ВЭД) ========== //
                if (!empty($vedOptions)) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'header-nav__link',
                        text: $vedOptions[0]['text'],
                        link: '/services' . $vedOptions[0]['link'],
                        size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                    );
                }

                if (!empty($customsOptions)) {
                    App\Layout\Components\UI\Core\DropdownTab\Layout::drawDropdownTab(
                        className: 'header-nav__dropdown',
                        text: $catCustom[0]['name'],
                        link: '/services/tamozennoe-oformlenie/',
                        size: App\Layout\Components\UI\Core\DropdownTab\DropdownTabSize::Small,
                        options: $customsOptions
                    );
                }

                // ========== Заголовок дроутаба (Международные перевозки) ========== //
                if (!empty($interOptions)) {
                     App\Layout\Components\UI\Core\DropdownTab\Layout::drawDropdownTab(
                        className: 'header-nav__dropdown',
                        text: $catInter[0]['name'],
                        link: '/services/mezdunarodnye-perevozki/',
                        size: App\Layout\Components\UI\Core\DropdownTab\DropdownTabSize::Small,
                        options: $interOptions,
                    );
                }

                // ========== Заголовок дроутаба (Финансовая логистка) ========== //
                if (!empty($finOptions)) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'header-nav__link',
                        text: $finOptions[0]['text'],
                        link: '/services' . $finOptions[0]['link'],
                        size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                    );
                }

                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: 'header-nav__link',
                    text: 'Услуги',
                    link: '/services/',
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                );

                App\Layout\Components\UI\Core\DropdownTab\Layout::drawDropdownTab(
                    className: 'header-nav__dropdown',
                    text: 'О нас',
                    size: App\Layout\Components\UI\Core\DropdownTab\DropdownTabSize::Small,
                    options: [
                        ['text' => 'О компании', 'link' => '/about/'],
                        ['text' => 'Наши кейсы', 'link' => '/cases/'],
                        ['text' => 'Медиацентр', 'link' => '/blog/'],
                        ['text' => 'Отзывы', 'link' => '/reviews/'],
                        ['text' => 'Контакты', 'link' => '/contacts/'],
                    ],
                    serviceRoute: false,
                );
            ?>
        </div>

        <div class="header-nav__buttons">
            <div class="header-nav__socials">
                <?php
                if ($wt) {
                    App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                        className: 'header-nav__button-social',
                        link: $wt,
                        type: \App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp,
                        size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small
                    );
                }

                if ($tg) {
                    App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                        className: 'header-nav__button-social',
                        link: $tg,
                        size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small
                    );
                }
                ?>

                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        className: 'header-nav__button-catalog',
                        text: 'Связаться',
                        size: \App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                        attributes: [
                            'onclick' => 'modalManager.open("callback-modal");'
                        ]
                    );
                ?>
            </div>
        </div>
    </div>
</div>
