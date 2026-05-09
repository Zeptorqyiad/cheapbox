<?php
/** @var array $data */
?>

<nav class="tab-list <?= $data['className'] ?? '' ?>">
    <div class="tab-list__container">
        <div class="tab-list__list">
            <?php foreach ($data['text'] as $tab) {
                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: 'tab-nav__tab tab-list__tab',
                    text: $tab['title'],
                    style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Large,
                );
            } ?>
        </div>
    </div>
</nav>
