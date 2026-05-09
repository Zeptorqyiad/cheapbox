<?php
/** @var array $data */

?>

<section class="certificate">
    <h2 class="certificate__title">
        <?= $data['title'] ?>
    </h2>

    <div class="certificate__left">
        <p class="certificate__text">
            <?= $data['desc'] ?>
        </p>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'certificate__left-separator',
            );
        ?>

        <div class="certificate__plus">
            <?php foreach ($data['cards-plus'] as $i) {
                App\Layout\Components\Cards\PlusCard\Layout::drawPlusCard(
                    text: $i['text'],
                    icon: $i['icon'],
                );
            } ?>
        </div>
    </div>

    <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'certificate__separator',
        );
    ?>

    <div class="certificate__slider-wrap">
        <div class="certificate__slider">
            <div class="swiper-wrapper">
                <?php foreach ($data['cards-doc'] as $i) {
                    App\Layout\Components\Cards\DocCard\Layout::drawDocCard(
                        className: 'swiper-slide',
                        title: $i['title'] ?? '',
                        image: $i['image'] ?? '',
                        groupImages: 'cert-images'
                    );
                } ?>
            </div>
        </div>
    </div>
</section>