<?php
/** @var $data array */

$badges = json_decode($data['badges'] ?? '{}')->v ?? [];
?>

<section class="consist">
    <div class="consist__container container">
        <?php
        if ($data['title'] || $data['desc']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
                separator: $data['desc'] ? true : false,
            );
        }
        ?>

        <div class="consist__cards">
            <?php foreach ($badges as $i): ?>
                <?php
                    App\Layout\Components\Cards\BadgeCard\Layout::drawBadgeCard(
                        text: $i->text,
                        image: $i->image,
                        desc: $i->desc,
                    );
                ?>
            <?php endforeach; ?>
        </div>
    </div>
</section>
