<?php
/** @var array $data */
$legalCardClasses = [
    'legal-card',
    $data['className'] ?? ''
];
?>

<a href="<?= $data['link'] ?>" class="<?= implode(' ', $legalCardClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <?php
        App\Layout\Components\UI\Core\Marker\Layout::drawMarker(
            className: 'legal-card__marker',
            icon: 'file',
        );
    ?>

    <div class="legal-card__title"><?= $data['title'] ?></div>

    <span class="legal-card__icon">
        <?= renderIcon('arrow-up-right') ?>
    </span>
</a>
