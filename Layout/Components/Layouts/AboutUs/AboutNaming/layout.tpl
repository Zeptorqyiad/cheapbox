<?php
/** @var $data array */

?>

<?php if ($data['cards']): ?>
    <section class="about-naming">
        <div class="about-naming__container container">
            <?php if ($data['title']) {
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title']
                );
            } ?>
            <div class="about-naming__content">
                <?php if ($data['image']): ?>
                    <img class="about-naming__content-image"
                         src="/uf/images/source/<?= $data['image'] ?>"
                         alt="image" />
                <?php endif; ?>

                <?php if ($data['desc']): ?>
                    <div class="about-naming__content-desc">
                        <?= $data['desc'] ?>
                    </div>
                <?php endif; ?>

                <div class="about-naming__content-cards">
                    <?php foreach ($data['cards'] as $card) {
                        App\Layout\Components\Cards\AboutCard\Layout::drawAboutCard(
                            className: 'about-naming__card',
                            title: $card['title'],
                            subtitle: $card['subtitle'],
                            desc: $card['desc']
                        );
                    } ?>
                </div>
            </div>
        </div>
    </section>
<?php endif; ?>