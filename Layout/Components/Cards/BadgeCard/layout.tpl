<?php
/** @var $data array */

?>

<div class="badge-card">
    <?php
        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
            className: 'badge-card__badge',
            text: $data['text'],
            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::PrimaryLight,
            size: App\Layout\Components\UI\Core\Badge\BadgeSize::ExtraLarge,
            icon: $data['icon'] ?? '',
            image: $data['image'] ?? ''
        );
    ?>

    <?php if ($data['desc']): ?>
        <div class="badge-card__desc">
            <?= $data['desc'] ?>
        </div>
    <?php endif; ?>
</div>
