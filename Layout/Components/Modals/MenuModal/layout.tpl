<?php
/** @var array $data */

$email = Simflex\Core\Core::siteParam('email');
$phone = Simflex\Core\Core::siteParam('phone');
$tg = Simflex\Core\Core::siteParam('tg');
$wt = Simflex\Core\Core::siteParam('whats_app');

$vedOptions = getServiceOptions('Консультация ВЭД');
$customsOptions = getServiceOptions('Таможенное оформление');
$interOptions = getServiceOptions('Международные перевозки');
$finOptions = getServiceOptions('Финансовая логистика');
?>

<div id="menu-modal" class="modal menu-modal" role="dialog" aria-modal="true">
    <div class="menu-modal__container">
        <div class="menu-modal__top">
            <?php App\Layout\Components\UI\Other\LogoButton\Layout::draw(); ?>

            <?php App\Layout\Components\UI\Core\Buttons\ButtonClose\Layout::drawButtonClose(
                className: 'menu-modal__button-close',
                attributes: [
                    'onclick' => 'modalManager.close("menu-modal")',
                ]
            ); ?>
        </div>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'callback-modal__separator',
            );
        ?>

        <div class="menu-modal__body">
            <div class="menu-modal__list">
                <?php
                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: 'menu-modal__link',
                    text: 'Услуги',
                    link: '/services/',
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Small
                );

                if (!empty($vedOptions)) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'menu-modal__link',
                        text: $vedOptions[0]['text'],
                        link: '/services' . $vedOptions[0]['link'],
                        size: App\Layout\Components\UI\Core\Tab\TabSize::Small
                    );
                }

                if (!empty($customsOptions)) {
                    App\Layout\Components\UI\Core\Collapsible\Layout::drawCollapsible(
                        className: 'menu-model__collapsible',
                        text: $customsOptions[0]['text'],
                        options: $customsOptions,
                    );
                }

                if (!empty($interOptions)) {
                    App\Layout\Components\UI\Core\Collapsible\Layout::drawCollapsible(
                        className: 'menu-model__collapsible',
                        text: $interOptions[0]['text'],
                        options: $interOptions,
                    );
                }

                if (!empty($finOptions)) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'menu-modal__link',
                        text: $finOptions[0]['text'],
                        link: '/services' . $finOptions[0]['link'],
                        size: App\Layout\Components\UI\Core\Tab\TabSize::Small
                    );
                }

                App\Layout\Components\UI\Core\Collapsible\Layout::drawCollapsible(
                    className: 'menu-model__collapsible',
                    text: 'О нас',
                    options: [
                        ['text' => 'О компании', 'link' => '/about/'],
                        ['text' => 'Наши кейсы', 'link' => '/cases/'],
                        ['text' => 'Медиацентр', 'link' => '/blog/'],
                        ['text' => 'Отзывы', 'link' => '/reviews/'],
                        ['text' => 'Контакты', 'link' => '/contacts/'],
                    ],
                    serviceRoute: false,
                );

                App\Layout\Components\UI\Core\Collapsible\Layout::drawCollapsible(
                    className: 'menu-model__collapsible',
                    text: 'Для клиентов',
                    options: [
                        ['text' => 'Частые вопросы', 'link' => '/faq/'],
                        ['text' => 'Гарантии', 'link' => '/guarantees/'],
                        ['text' => 'Глоссарий', 'link' => '/glossary/'],
                    ],
                    serviceRoute: false,
                );
                ?>
            </div>

            <div class="menu-modal__wrap">
                <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'callback-modal__separator',
                    );
                ?>

                <div class="menu-modal__info">
                    <?php
                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        className: 'menu-modal__button',
                        text: 'Связаться',
                        attributes: [
                            'onclick' => 'modalManager.open("callback-modal")'
                        ]
                    );
                    ?>

                    <div class="menu-modal__contacts">
                        <?php
                        if ($phone) {
                            App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                                className: 'menu-modal__button-contact',
                                text: '{phone}',
                                link: '{phone}',
                                style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Monochrome,
                                size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                                type: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactType::Tel,
                            );
                        }

                        if ($email) {
                            App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                                className: 'menu-modal__button-contact',
                                text: '{email}',
                                link: '{email}',
                                style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Monochrome,
                                size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::ExtraSmall,
                                type: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactType::Mail,
                            );
                        }
                        ?>
                    </div>

                    <div class="menu-modal__socials">
                        <?php
                        if ($wt) {
                            App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                className: 'header-nav__button-social',
                                link: $wt,
                                type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp,
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
