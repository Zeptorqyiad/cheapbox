<?php
/** @var array $data */

?>

<nav class="tab-sticky <?= $data['className'] ?? '' ?>">
    <div class="tab-sticky__container">
        <div class="tab-sticky__list">
            <?php foreach ($data['text'] as $tab) {
                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: 'tab-nav__tab tab-sticky__tab',
                    text: $tab['title'],
                    style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Large,
                );
            } ?>
        </div>
    </div>
</nav>
