<?php
/** @var array $data */

$items = json_decode($data['items'] ?? '{}')->v ?? [];

?>

<section class="route-map">
    <div class="route-map__container container">
        <?php if ($data['title'] || $data['desc']): ?>
            <?php
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
                separator: $data['desc'] ? true : false
            );
            ?>
        <?php endif; ?>

        <div class="route-map__list">
            <?php if ($data['items']): ?>
                <?php foreach ($items as $i): ?>
                    <?php
                    App\Layout\Components\Cards\AccordionCard\Layout::drawAccordionCard(
                        title: $i->title,
                        image: $i->image,
                        provider: $i->provider,
                        city: $i->city,
                        city2: $i->city2,
                        city3: $i->city3,
                        city4: $i->city4,
                        transportation: $i->transportation,
                        transportation2: $i->transportation2,
                        transportation3: $i->transportation3,
                        transportation4: $i->transportation4,
                    );
                    ?>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

        <div class="route-map__images">
            <img class="route-map__image" src="<?= $data['image-map'] ?>" alt="map">

            <?php foreach ($items as $i): ?>
                <img class="route-map__image-route"
                     src="<?= $i->imageRoute ?>"
                     alt="map"
                     id="air-china-russia"
                >
            <?php endforeach; ?>
        </div>

        <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
            className: 'route-map__separator',
        );
        ?>

        <?php if ($data['callback-title'] || $data['callback-desc']): ?>
            <?php
            App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
                title: $data['callback-title'] ?? '',
                desc: $data['callback-desc'] ?? '',
            );
            ?>
        <?php endif; ?>
    </div>
</section>
