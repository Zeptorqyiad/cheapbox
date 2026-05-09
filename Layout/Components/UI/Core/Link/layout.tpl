<?php
/** @var array $data */

$linkClasses = [
    'link',
    "link-{$data['style']}",
    "link-size_{$data['size']}",
    "link-theme_{$data['theme']}",
    $data['className'] ?? ''
];
?>

<?php if ($data['link']): ?>
    <a href="<?= $data['link'] ?>" class="<?= implode(' ', $linkClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
        <?php if ($data['iconLeft']): ?>
            <?= renderIcon($data['iconLeft'], 'link__icon-left') ?>
        <?php endif; ?>

        <span class="link__text"><?= $data['text'] ?></span>

        <?php if ($data['iconRight']): ?>
            <?= renderIcon($data['iconRight'], 'link__icon-right') ?>
        <?php endif; ?>
    </a>
<?php endif; ?>

