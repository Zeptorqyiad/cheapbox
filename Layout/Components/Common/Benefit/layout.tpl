<?php
/** @var array $data */

use App\Layout\Components\Cards\BenefitCard\BenefitCardColor;

$cards = json_decode($data['serv-cards'] ?? '{}')->v ?? [];

?>

<section class="benefit">
    <div class="benefit__container container">
        <?php
            if ($data['title'] || $data['desc']) {
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'] ?? '',
                    desc: $data['desc'] ?? '',
                    separator: $data['desc'] ? true : false,
                );
            }
        ?>

        <?php if ($data['cards']): ?>
            <div class="benefit__list">
                <?php foreach ($data['cards'] as $card) {
                    App\Layout\Components\Cards\BenefitCard\Layout::drawBenefitCard(
                        title: $card['title'] ?? '',
                        text: $card['text'] ?? '',
                        img: $card['img'],
                        color: BenefitCardColor::tryFrom($card['color']) ?? BenefitCardColor::Clear
                    );
                } ?>
            </div>
        <?php else: ?>
            <div class="benefit__list">
                <?php foreach ($cards as $card) {
                    App\Layout\Components\Cards\BenefitCard\Layout::drawBenefitCard(
                        title: $card->title,
                        text: $card->text,
                        img: $card->img,
                        color: BenefitCardColor::tryFrom($card->color) ?? BenefitCardColor::Clear
                    );
                } ?>
            </div>
        <?php endif; ?>
    </div>
</section>
