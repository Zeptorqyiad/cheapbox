<?php
/** @var array $data */

?>

<section class="about-fs">
    <div class="about-fs__container container">
        <div class="about-fs__headline">
            <div class="about-fs__headline-titles">
                <?php if ($data['title']): ?>
                    <h1 class="about-fs__headline-titles-title">
                        <?= $data['title'] ?>
                    </h1>
                <?php endif; ?>

                <?php if ($data['subtitle']): ?>
                    <h3 class="about-fs__headline-titles-subtitle">
                        <?= $data['subtitle'] ?>
                    </h3>
                <?php endif; ?>
            </div>

            <div class="about-fs__desc">
                <?php if ($data['text']): ?>
                    <div class="about-fs__desc-text">
                        <?= $data['text'] ?>
                    </div>
                <?php endif; ?>

                <div class="about-fs__desc-buttons">
                    <?php
                        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'about-fs__button',
                            text: 'Получить консультацию',
                            attributes: [
                                'onclick' => 'modalManager.open("callback-modal");'
                            ]
                        );
                        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'about-fs__button',
                            text: 'Наши услуги',
                            link: '/services/',
                            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline
                        );
                    ?>
                </div>
            </div>
        </div>

        <?php if ($data['image']): ?>
            <img class="about-fs__image"
                 src="<?= $data['image'] ?>"
                 alt="image"
            >
        <?php endif; ?>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'about-fs__separator'
            );
        ?>
    </div>
</section>