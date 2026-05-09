<?php
/** @var array $data */

?>

<section class="service-fs">
    <div class="service-fs__container container">
        <?php
        App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

        App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();
        ?>

        <div class="service-fs__wrap">
            <?php if($data['image']):?>
                <div class="service-fs__image">
                    <img src="<?= $data['image'] ?>" alt="<?= $data['title'] ?>">
                </div>
            <?php endif; ?>
            <div class="service-fs__content">
                <div class="service-fs__text">
                    <?php if($data['title']):?>
                        <h1 class="service-fs__text-title">
                            <?= $data['title'] ?>
                        </h1>
                    <?php endif; ?>
                    <?php if($data['desc']):?>
                        <div class="service-fs__text-desc">
                            <?= $data['desc'] ?>
                        </div>
                    <?php endif; ?>
                </div>

                <?php if ($data['price'] && $data['time']): ?>
                    <div class="service-fs__parameters">
                        <div class="service-fs__parameter">
                            <div class="service-fs__parameter-icon">
                                <?= renderIcon('uniq-coins') ?>
                            </div>

                            <h4 class="service-fs__parameter-text"><?= $data['price'] ?></h4>
                        </div>

                        <?php
                        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                            className: 'service-fs__parameter-separator',
                            orientation: App\Layout\Components\UI\Core\Separator\SeparatorOrientation::Vertical
                        );
                        ?>

                        <div class="service-fs__parameter">
                            <div class="service-fs__parameter-icon">
                                <?= renderIcon('uniq-clock-fast') ?>
                            </div>

                            <h4 class="service-fs__parameter-text"><?= $data['time'] ?></h4>
                        </div>
                    </div>
                <?php endif; ?>

                <div class="service-fs__buttons">
                    <?php
                        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'service-fs__button',
                            text: 'Получить расчёт',
                            attributes: [
                                'onclick' => 'modalManager.open("callback-modal")',
                            ],
                        );

                        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'service-fs__button',
                            text: 'Бесплатная консультация',
                            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
                            attributes: [
                                'onclick' => 'modalManager.open("callback-modal")',
                            ]
                        );
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>
