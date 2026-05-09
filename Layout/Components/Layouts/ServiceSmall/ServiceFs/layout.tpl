<?php
/** @var array $data */

$list = json_decode($data['offer-list'], true)['v'] ?? [];
?>

<section class="service-fs">
    <div class="service-fs__container container">
        <?php
        App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

        App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();
        ?>

        <div class="service-fs__wrap">
            <div class="service-fs__headline">
                <h1 class="service-fs__headline-title">
                    <?= $data['title'] ?>
                </h1>
                <div class="service-fs__headline-desc">
                    <?= $data['desc'] ?>
                </div>
            </div>

            <?php
                App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Dark
                );
            ?>

            <div class="service-fs__content">
                <img src="/uf/images/source/<?= $data['image'] ?>" class="service-fs__image" alt="">

                <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'service-fs__content-separator',
                        theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Dark
                    );
                ?>

                <?php if ($list): ?>
                    <div class="offer-card__wrap-bullits">
                        <?php
                            App\Layout\Components\Cards\BullitsCard\Layout::drawBullitsCard(
                                bullits: $list
                            );
                        ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>
