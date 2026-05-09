<?php
/** @var $data array */
?>

<div class="team-card">
    <img class="team-card__image" src="<?= $data['img'] ?>" alt="image"/>

    <?php if ($data['name'] || $data['job']): ?>
        <div class="team-card__info">
            <h5 class="team-card__info-name"><?= $data['name']?></h5>
            <p class="team-card__info-job"><?= $data['job'] ?></p>
        </div>
    <?php endif; ?>
</div>