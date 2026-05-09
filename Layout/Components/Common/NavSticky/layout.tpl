<?php
/** @var array $data */

use Simflex\Core\Container;

$navStickyLinks = [
    [
        'text' => 'Частые вопросы',
        'link' => '/faq/',
    ], [
        'text' => 'Гарантии',
        'link' => '/guarantees/',
    ], [
        'text' => 'Глоссарий',
        'link' => '/glossary/',
    ], [
        'className' => ' with-separator',
        'text' => 'Политика <br /> конфиденциальности',
        'link' => '/privacy-policy/',
        'iconRight' => 'chevron-right'
    ]
];

$tabs = !empty($data['tabs']) ? $data['tabs'] : $navStickyLinks;

?>

<nav class="nav-sticky <?= $data['className'] ?? '' ?>">
    <div class="nav-sticky__container">
        <div class="nav-sticky__list">
            <?php foreach ($tabs as $tab): ?>
                <div class="nav-sticky__block <?=$tab['className']?>">
                    <?php
                        App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                            className: 'nav-sticky__tab' . (str_contains($_SERVER['REQUEST_URI'], $tab['link']) ? ' active' : ''),
                            text: $tab['text'] ?? '',
                            link: $tab['link'] ?? '',
                            iconRight: $tab['iconRight'] ?? '',
                            style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
                            size: App\Layout\Components\UI\Core\Tab\TabSize::Large,
                        );
                    ?>
                </div>

            <?php endforeach; ?>
        </div>
    </div>
</nav>
