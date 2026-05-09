<?php
/** @var $data array */
?>

<?php if ($data['cards']): ?>
    <section class="about-team">
        <div class="about-team__container container">
            <?php
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'],
                    desc: $data['desc'],
                    separator: true
                )
            ?>

            <div class="about-team__list">
                <?php foreach ($data['cards'] as $card){
                    App\Layout\Components\Cards\TeamCard\Layout::drawTeamCard(
                        className: 'about-team__card',
                        name: $card['name'],
                        job: $card['job'],
                        img: $card['image'],
                    );
                }?>
            </div>
        </div>
    </section>
<?php endif; ?>