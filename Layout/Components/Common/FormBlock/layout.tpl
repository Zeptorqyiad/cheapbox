<?php
/** @var $data array */

?>

<section class="form-block">
    <div class="form-block__container container">
        <div class="form-block__content">
            <div class="form-block__block">
                <div class="form-block__text">
                    <?php if ($data['title']): ?>
                        <h2 class="form-block__title">
                            <?= $data['title'] ?>
                        </h2>
                    <?php endif; ?>

                    <?php if ($data['desc']): ?>
                        <div class="form-block__desc">
                            <?= $data['desc'] ?>
                        </div>
                    <?php endif; ?>
                </div>

                <?php App\Layout\Components\UI\Core\Form\Layout::draw(); ?>
            </div>
        </div>

        <img class="form-block__image" src="<?= $data['image'] ?>" alt="image">
    </div>
</section>