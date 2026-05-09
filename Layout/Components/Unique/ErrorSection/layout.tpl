<?php
/** @var array $data */

?>

<section class="error-section <?= $data['className'] ?>">
    <div class="error-section__container container">
        <img class="error-section__image" src="<?= $data['img']?>" draggable="false" alt="image"/>
        <h2 class="error-section__title"><?= $data['title'] ?? 'Произошла ошибка' ?></h2>
        <p class="error-section__desc">
            <?= $data['description'] ?>
        </p>
        <div class="error-section__buttons">
            <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'error-section__button-home',
                text: 'На главную',
                link: '/',
                style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
            );

            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'error-section__button-catalog',
                text: 'Услуги',
                link: '/services/'
            );
            ?>
        </div>
    </div>
</section>