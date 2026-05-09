<?php
/** @var $data array */

$serviceCardClasses = [
    'service-card',
    "service-card-border_{$data['border']}",
    $data['className'] ?? ''
];
?>

<a href="<?= $data['link'] ?>" class="<?= implode(' ', $serviceCardClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <div class="service-card__wrap">
        <?php if ($data['title']): ?>
            <h5 class="service-card__title">
                <?= $data['title']?>
            </h5>
        <?php endif; ?>

        <svg class="service-card__arrow" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M7.05025 16.9498L16.9497 7.05033M16.9497 7.05033H7.05025M16.9497 7.05033V16.9498" stroke="currentColor" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </div>

    <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
            className: 'service-card__separator',
            theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Dark
        );
    ?>

    <?php if ($data['desc']): ?>
        <div class="service-card__desc">
            <?= $data['desc'] ?>
        </div>
    <?php endif; ?>
</a>
