<?php
/** @var array $data */
$data = [
    [
            'icon'=> 'file',
        'title' => 'Политика конфиденциальности',
        'link' => '/'
    ],
    [
        'icon'=> 'file',
        'title' => 'Публичная оферта',
        'link' => '/'
    ],
    [
        'icon'=> 'file',
        'title' => 'Политика в отношении персональных данных',
        'link' => '/'
    ],
    [
        'icon'=> 'file',
        'title' => 'Правила использования cookies',
        'link' => '/'
    ],
    [
        'icon'=> 'file',
        'title' => 'Title',
        'link' => '/'
    ],
]
?>

<section class="docs-section">
    <div class="docs-section__container container">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <div class="docs-section__body">
            <div class="docs-section__wrap">
                <?php foreach ($data as $item): ?>
                    <?php
                    App\Layout\Components\Cards\CategoryCard\Layout::drawCategoryCard(
                        className: 'category-card--link',
                        link: $item['link'],
                        title: $item['title'],
                        icon: $item['icon']
                    );
                    ?>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>
