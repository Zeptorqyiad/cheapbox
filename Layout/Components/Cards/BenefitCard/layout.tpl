<?php
/** @var $data array */

$benefitCardClasses = [
    'benefit-card',
    "benefit-card-color_{$data['color']}",
    $data['className'] ?? ''
];
?>

<div class="<?= implode(' ', $benefitCardClasses) ?>">
    <?php
        App\Layout\Components\UI\Core\Marker\Layout::drawMarker(
            className: 'benefit-card__marker',
            img: $data['img']?? ''
        );
    ?>

    <div class="benefit-card__info">
        <?php if ($data['title']): ?>
            <h5 class="benefit-card__title">
                <?= $data['title'] ?>
            </h5>
        <?php endif; ?>

        <?php if ($data['text']): ?>
            <div class="benefit-card__desc">
                <?= $data['text'] ?>
            </div>
        <?php endif; ?>

        <?php if ($data['link']) {
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                text: 'Оставить заявку',
                link: $data['link'],
            );
        } ?>
    </div>
</div>