<?php
/** @var $data array */

$bullits = json_decode($data['bullits'] ?? '{}')->v ?? [];
$items = json_decode($data['items'] ?? '{}')->v ?? [];
?>

<section class="service-about">
    <div class="service-about__container container">
        <?php
            if ($data['title']) {
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'] ?? '',
                    desc: $data['desc'] ?? '',
                    separator: true,
                );
            }
        ?>

        <div class="service-about__wrap">
            <div class="service-about__left">
                <?php if ($data['subtitle-left']): ?>
                    <div class="service-about__left-subtitle">
                        <?= $data['subtitle-left'] ?>
                    </div>
                <?php endif; ?>

                <?php if ($data['desc-left']): ?>
                    <div class="service-about__left-desc content">
                        <?= $data['desc-left'] ?>
                    </div>
                <?php endif; ?>
            </div>

            <div class="service-about__right">
                <?php if ($data['subtitle-right'] && $data['desc-right']): ?>
                    <div class="service-about__right-text">
                        <div class="service-about__right-subtitle">
                            <?= $data['subtitle-right'] ?>
                        </div>

                        <div class="service-about__right-desc content">
                            <?= $data['desc-right'] ?>
                        </div>
                    </div>
                <?php endif; ?>

                <?php
                    if ($bullits) {
                        App\Layout\Components\Cards\BullitsCard\Layout::drawBullitsCard(
                            text: $bullits,
                        );
                    }
                ?>
                <?php if ($data['accent-text']): ?>
                    <?php
                        App\Layout\Components\Cards\AccentCard\Layout::drawAccentCard(
                            desc: $data['accent-text'],
                        );
                    ?>
                <?php endif; ?>
            </div>
        </div>
        <?php if ($items && $data['image']): ?>
            <?php
                App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'service-about__separator'
                );
            ?>

            <div class="service-about__plus">
                <?php foreach ($items as $i) {
                    App\Layout\Components\Cards\PlusCard\Layout::drawPlusCard(
                        text: $i->text,
                        icon: $i->img,
                    );
                } ?>
            </div>

            <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'service-about__separator'
            );
            ?>

            <div class="service-about__banner">
                <img src="<?= $data['image'] ?>" alt="image" class="service-about__banner-image">

                <?php
                    App\Layout\Components\Cards\OfferCard\Layout::drawOfferCard(
                        title: $data['offer-title'] ?? '',
                        desc: $data['offer-desc'] ?? '',
                        price: $data['offer-price'] ?? '',
                        time: $data['offer-time'] ?? '',
                        text: $data['offer-text'] ?? '',
                    );
                ?>
            </div>
        <?php endif; ?>

        <?php if ($data['callback-title'] || $data['callback-desc']): ?>
            <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'service-about__separator'
            );
            ?>

            <?php
                App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
                    className: 'service-about__callback',
                    title: $data['callback-title'] ?? '',
                    desc: $data['callback-desc'] ?? ''
                );
            ?>
        <?php endif; ?>
    </div>
</section>
