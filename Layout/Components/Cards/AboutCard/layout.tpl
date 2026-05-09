<?php
/** @var array $data */

?>

<div class="about-card <?= $data['className'] ?>">
    <div class="about-card__wrap">
        <?php if ($data['title']): ?>
            <h1 class="about-card__title">
                <?= $data['title'] ?>
            </h1>
        <?php endif; ?>
        <?php if ($data['subtitle']): ?>
            <div class="about-card__subtitle">
                <?= $data['subtitle'] ?>
            </div>
        <?php endif; ?>
    </div>
    <?php if ($data['desc']): ?>
        <div class="about-card__desc">
            <?= $data['desc'] ?>
        </div>
    <?php endif; ?>
</div>
