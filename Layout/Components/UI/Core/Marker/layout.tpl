<?php
/** @var array $data */

$markerClasses = [
    'marker',
    "marker-size_{$data['size']}",
    $data['className'] ?? ''
];
?>

<?php if ($data['icon']) :?>
    <div class="<?= implode(' ', $markerClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
        <?= renderIcon($data['icon'], 'marker__icon') ?>
    </div>
<?php elseif ($data['img']):?>
    <div class="<?= implode(' ', $markerClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
        <img class="marker__image" src="<?= $data['img']?>" alt="" draggable="false">
    </div>
<?php   elseif ($data['number']):?>
    <div class="<?= implode(' ', $markerClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
        <h5 class="marker__number"><?= $data['number'] ?></h5>
    </div>
<?php endif; ?>