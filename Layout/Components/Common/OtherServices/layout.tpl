<?php
/** @var array $data */

use App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor;

$services = json_decode($data['services'], true)['v'] ?? [];
?>

<section class="other-services">
    <div class="other-services__container container">
        <?php
        if ($data['title'] || $data['desc']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
                separator: $data['title'] ? true : false,
            );
        }
        ?>

        <div class="other-services__card">
            <?php foreach ($services as $i): ?>
                <?php
                    App\Layout\Components\Cards\ServiceExampleCard\Layout::drawServiceExampleCard(
                        title: $i['title'] ?? '',
                        text: $i['text'] ?? '',
                        img: $i['img'] ?? '',
                        link: $i['link'] ?? '',
                        color: ServiceExampleCardColor::from($i['color'])
                    );
                ?>
            <?php endforeach; ?>
        </div>
    </div>
</section>