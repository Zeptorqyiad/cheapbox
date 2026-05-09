<?php
/** @var array $data */

?>

<section class="addresses-section">
    <div class="addresses-section__container container">
        <?php
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'],
            );
        ?>
        <ul class="addresses-section__list">
            <?php foreach ($data['addresses'] as $i): ?>
                <li class="addresses-section__item">
                    <h5 class="addresses-section__item--title">
                        <?= $i->title ?>
                    </h5>

                    <?php
                        App\Layout\Components\Cards\CategoryCard\Layout::drawCategoryCard(
                            title: $i->address,
                            icon: 'marker',
                            style: App\Layout\Components\Cards\CategoryCard\CategoryCardStyle::Secondary
                        );

                        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
                    ?>
                </li>
            <?php endforeach; ?>
        </ul>
    </div>
</section>