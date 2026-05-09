<?php
/** @var array $data */

$email = Simflex\Core\Core::siteParam('email');
$phone = Simflex\Core\Core::siteParam('phone');
?>

<header class="header">
    <div class="header__container container">
        <div class="header__top">
            <div class="header__top-logo-anim">
                <?php
                App\Layout\Components\UI\Other\LogoButton\Layout::draw([
                    'className' => 'header__logo',
                ]);

                App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'header__separator',
                    orientation: App\Layout\Components\UI\Core\Separator\SeparatorOrientation::Vertical,
                );
                ?>

                <p class="header__subtitle">
                    <?= $data['subtitle'] ?>
                </p>
            </div>
            <div class="header__top-contacts">
                <?php
                if ($email) {
                    App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                        className: 'header__button-contact',
                        text: '{email}',
                        link: '{email}',
                        style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Monochrome,
                        size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::ExtraSmall,
                        type: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactType::Mail,
                    );
                }

                if ($phone) {
                    App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                        className: 'header__button-contact',
                        text: '{phone}',
                        link: '{phone}',
                        style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Monochrome,
                        size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                        type: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactType::Tel,
                    );
                }
                ?>
            </div>

            <?php
                App\Layout\Components\UI\Core\Buttons\ButtonMenu\Layout::drawButtonMenu(
                    className: 'header__button-menu',
                    icon: 'menu-3-line',
                    style: App\Layout\Components\UI\Core\Buttons\ButtonMenu\ButtonMenuStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Buttons\ButtonMenu\ButtonMenuSize::Small,
                    attributes: [
                        'onclick' => 'modalManager.open("menu-modal")'
                    ]
                );
            ?>
        </div>
        <div class="header__line">
            <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
            ?>
        </div>
        <div class="header__bottom">
            <?php App\Layout\Components\Common\HeaderNav\Layout::draw(); ?>
        </div>
    </div>
</header>

<div class="modal-overlay" id="modal-overlay" aria-hidden="true"></div>

<?php
App\Layout\Components\Modals\CookieModal\Layout::draw();
App\Layout\Components\Modals\CallbackModal\Layout::draw();
App\Layout\Components\Modals\CategoriesModal\Layout::draw();
App\Layout\Components\Modals\MenuModal\Layout::draw();
App\Layout\Components\Modals\ErrorModal\Layout::draw();
App\Layout\Components\Modals\SuccessModal\Layout::draw();
App\Layout\Components\UI\Other\TabBar\Layout::draw();
?>