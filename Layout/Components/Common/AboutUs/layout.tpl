<?php
/** @var array $data */

$wt = Simflex\Core\Core::siteParam('whats_app');
$tg = Simflex\Core\Core::siteParam('tg');
?>

<section class="about-us">
    <div class="about-us__container container">
        <?php
        App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
            title: $data['title'] ?? '',
        );
        ?>

        <div class="about-us__wrap">
            <div class="about-us__content">
                <div class="about-us__left">
                    <div class="about-us__left-info">
                        <img class="about-us__left-info_image" src="<?= $data['image'] ?>" alt="image">

                        <div class="about-us__left-info_text">
                            <?= $data['text'] ?>
                        </div>
                    </div>

                    <?php if ($data['services'] === true): ?>
                        <div class="about-us__left-buttons">
                            <?php
                                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                                    className: 'about-us__left-button about-us__left-button_services',
                                    text: 'Наши услуги',
                                    link: '/services/'
                                );
                            ?>

                            <?php if ($wt || $tg): ?>
                                <div class="about-us__left-buttons_social">
                                    <?php
                                        if ($wt) {
                                            App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                                className: 'about-us__left-button_social',
                                                link: $wt,
                                                type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp
                                            );
                                        }

                                        if ($tg) {
                                            App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                                className: 'about-us__left-button_social',
                                                link: $tg
                                            );
                                        }
                                    ?>
                                </div>
                            <?php endif; ?>

                            <?php if ($data['about_us'] === true): ?>
                                <?php
                                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                                        className: 'about-us__left-button about-us__left-button_about ',
                                        text: 'Подробнее о компании',
                                        link: '/about/',
                                        style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline
                                    );
                                ?>
                            <?php endif; ?>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="about-us__right">
                    <div class="about-us__right-facts">
                        <?php foreach ($data['facts'] as $fact): ?>
                            <?php
                            App\Layout\Components\Cards\AboutCard\Layout::drawAboutCard(
                                className: 'about-us__about-card',
                                title: $fact['title'],
                                subtitle: $fact['subtitle'],
                                desc: $fact['desc']
                            );
                            ?>
                        <?php endforeach; ?>
                    </div>

                    <?php
                    App\Layout\Components\Cards\AccentCard\Layout::drawAccentCard(
                        desc: $data['task'] ?? ''
                    );
                    ?>
                </div>
            </div>

            <?php if ($data['callback-title'] || $data['callback-desc']) {
                App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'about-us__separator'
                );
                App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
                    title: $data['callback-title'],
                    desc: $data['callback-desc']
                );
            } ?>
        </div>
    </div>
</section>