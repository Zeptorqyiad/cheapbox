<?php
/** @var array $data */

?>

<?php if ($data['image']): ?>
    <div class="blog-card <?= $data['className'] ?>" title="<?= $data['title'] ?>">
        <a class="blog-card__link"
           href="<?= $data['link'] ?>"
           draggable="false"
           aria-label="<?= $data['title'] ?>"
        ></a>
        <div class="blog-card__container">
            <div class="blog-card__wrap">
                <div class="blog-card__badges">
                    <?php if ($data['date']): ?>
                        <?php
                        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'blog-card__badge-date',
                            text: $data['date'],
                            style: \App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                            size: \App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                        );
                        ?>
                    <?php endif; ?>
                    <?php if ($data['category']): ?>
                        <?php
                        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'blog-card__badge-category',
                            text: $data['category'],
                            style: \App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                            size: \App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                            icon: 'uniq-hashtag-slim'
                        );
                        ?>
                    <?php endif; ?>
                </div>

                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'blog-card__button',
                    text: 'Читать',
                    link: $data['link'],
                    icon: 'arrow-right',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                    iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                    attributes: [
                        'draggable' => 'false'
                    ]
                ); ?>
            </div>

            <img class="blog-card__image"
                 src="/uf/images/source/<?= $data['image'] ?>"
                 alt=""
                 draggable="false"
                 loading="lazy"
            >
        </div>

        <div class="blog-card__text">
            <h3 class="blog-card__title">
                <?= $data['title'] ?>
            </h3>
            <p class="blog-card__desc">
                <?= $data['desc'] ?>
            </p>
        </div>
    </div>
<?php elseif ($data['video_v'] || $data['video_h'] || $data['video']): ?>
    <div class="blog-card <?= $data['className'] ?>">
        <a class="blog-card__link"
           href="<?= $data['link'] ?>"
           draggable="false"
           aria-label="<?= $data['title'] ?>"
        ></a>
        <div class="blog-card__container <?= $data['video_v'] ? 'bg' : '' ?>">
            <div class="blog-card__wrap">
                <div class="blog-card__badges">
                    <?php if ($data['date']): ?>
                        <?php
                        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'blog-card__badge-date',
                            text: $data['date'],
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                        );
                        ?>
                    <?php endif; ?>
                    <?php if ($data['category']): ?>
                        <?php
                        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'blog-card__badge-category',
                            text: $data['category'],
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                            icon: 'uniq-hashtag-slim'
                        );
                        ?>
                    <?php endif; ?>
                </div>

                <?php if ($data['video_h']): ?>
                    <div class="blog-card__video h-video">
                        <iframe src="<?= $data['video_h'] ?>"
                                allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                                frameborder="0"
                                allowfullscreen>
                        </iframe>
                    </div>
                <?php endif; ?>
                <?php if ($data['video_v']): ?>
                    <div class="blog-card__video v-video">
                        <iframe src="<?= $data['video_v'] ?>"
                                allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                                frameborder="0"
                                allowfullscreen>
                        </iframe>
                    </div>
                <?php elseif ($data['video']): ?>
                    <video class="blog-card__video video"
                           autoplay
                           playsinline
                           muted
                           loop
                           preload="metadata"
                    >
                        <source src="/uf/files/<?= $data['video'] ?>" type="video/<?= pathinfo($data['video'], PATHINFO_EXTENSION) ?>">
                        Ваш браузер не поддерживает видео.
                    </video>
                <?php endif; ?>

                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'blog-card__button',
                    text: 'Читать',
                    link: $data['link'],
                    icon: 'arrow-right',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                    iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                    attributes: [
                        'draggable' => 'false'
                    ]
                ); ?>
            </div>
        </div>

        <div class="blog-card__text">
            <h3 class="blog-card__title">
                <?= $data['title'] ?>
            </h3>
            <p class="blog-card__desc">
                <?= $data['desc'] ?>
            </p>
        </div>
    </div>
<?php else: ?>
    <div class="blog-card-text <?= $data['className'] ?>" title="<?= $data['title'] ?>">
        <a class="blog-card__link"
           href="<?= $data['link'] ?>"
           draggable="false"
           aria-label="<?= $data['title'] ?>"
        ></a>
        <div class="blog-card__badges">
            <?php if ($data['date']): ?>
                <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                    className: 'blog-card__badge-date',
                    text: $data['date'],
                    style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                ); ?>
            <?php endif; ?>
            <?php if ($data['category']): ?>
                <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                    className: 'blog-card__badge-category',
                    text: $data['category'],
                    style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                    icon: 'uniq-hashtag-slim'
                ); ?>
            <?php endif; ?>
        </div>

        <div class="blog-card-text__content">
            <h3 class="blog-card-text__content--title">
                <?= $data['title'] ?>
            </h3>
            <div class="blog-card-text__content--desc">
                <?= $data['desc'] ?>
            </div>
        </div>

        <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'blog-card-text__link',
                text: 'Читать',
                link: $data['link'],
                icon: 'arrow-right',
                style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                iconPos: \App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
            );
        ?>
    </div>
<?php endif; ?>