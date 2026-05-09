<?php
/** @var array $data */

?>

<section class="<?= $data['className'] ?> fs-main">
    <div class="fs-main__container container">
        <?php
        App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

        App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();
        ?>
        <div class="fs-main__image-block">
            <div class="fs-main__text">
                <?php if ($data['title-accent']): ?>
                    <h1 class="fs-main__text-title-accent">
                        <?= $data['title-accent'] ?>
                    </h1>
                <?php endif; ?>

                <?php if ($data['title']): ?>
                    <h1 class="fs-main__text-title">
                        <?= $data['title'] ?>
                    </h1>
                <?php endif; ?>

                <?php if ($data['subtitle']): ?>
                    <div class="fs-main__text-subtitle">
                        <?= $data['subtitle'] ?>
                    </div>
                <?php endif; ?>
            </div>
            <div class="fs-main__card">
                <?php if ($data['card-title']): ?>
                    <h6 class="fs-main__card-title">
                        <?= $data['card-title'] ?>
                    </h6>
                <?php endif; ?>

                <?php if ($data['card-subtitle']): ?>
                    <div class="fs-main__card-subtitle">
                        <?= $data['card-subtitle'] ?>
                    </div>
                <?php endif; ?>

                <?php
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'fs-main__card-link',
                        text: 'Проверить',
                        link: 'https://customs.gov.ru/registers/customs-representatives',
                        iconRight: 'chevron-right',
                        style: App\Layout\Components\UI\Core\Tab\TabStyle::Flat,
                        size: App\Layout\Components\UI\Core\Tab\TabSize::ExtraSmall,
                        attributes: [
                            'target' => '_blank'
                        ]
                    );
                ?>
            </div>

            <div class="fs-main__image">
                <div class="fs-main__image--circle"></div>

                <img src="<?= $data['image']?>"
                     alt="image"
                     draggable="false"
                >
            </div>
        </div>

        <?php if ($data['cards']): ?>
            <div class="fs-main__services">
                <?php foreach ($data['cards'] as $i): ?>
                    <?php
                        App\Layout\Components\Cards\ServiceCard\Layout::drawServiceCard(
                            title: $i['title'],
                            desc: $i['desc'],
                            link: $i['link'],
                            border: App\Layout\Components\Cards\ServiceCard\ServiceCardBorder::tryFrom($i['border']) ?? App\Layout\Components\Cards\ServiceCard\ServiceCardBorder::Clear
                        );
                    ?>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>

        <?php if ($data['offer-list']): ?>
            <div class="fs-main__padding">
                <?php
                    App\Layout\Components\Cards\OfferCard\Layout::drawOfferCard(
                        title: $data['offer-title'],
                        price: $data['offer-price'],
                        time: $data['offer-time'],
                        bullits: $data['offer-list'],
                    );
                ?>
            </div>
        <?php endif; ?>
    </div>
</section>
