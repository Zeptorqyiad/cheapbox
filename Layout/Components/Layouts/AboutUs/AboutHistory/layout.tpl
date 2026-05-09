<?php
/** @var $data array */
?>

<section class="about-history">
    <div class="about-history__container container">

       <div class="about-history__content">
           <?php
                if ($data['title']) {
                    App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                        title: $data['title'],
                    );
                }
           ?>

           <div class="about-history__content-info">
               <?php if ($data['desc']): ?>
                   <div class="about-history__content-info-desc">
                       <?= $data['desc'] ?>
                   </div>
               <?php endif; ?>
               <?php if ($data['image']): ?>
                   <img class="about-history__content-info-image"
                        src="/uf/images/source/<?= $data['image'] ?>"
                        alt="image"
                   >
               <?php endif; ?>
           </div>
       </div>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'about-history__section-separator',
            );
            App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
                title: $data['callback-title'],
                desc: $data['callback-desc']
            );
        ?>
    </div>
</section>