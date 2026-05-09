<?php
/** @var array $content */

$index = $content->loadFrom('/');

$q = App\Extensions\Blog\Model\Blog::findAdv();
$items = $q->select('*')
    ->limit(15)
    ->orderBy('npp')
    ->andWhere(['is_active' => 1])
    ->all();

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();

    if (!empty($this->post->video_horizontal) || !empty($this->post->video_vertical) || !empty($this->post->video)) {
        App\Layout\Components\Layouts\Post\PostHeading\Layout::drawPostHeading(
            className: 'video',
            date: Simflex\Core\Time::normal($this->post->date),
            category: $this->post->category->name,
            views: $this->post->views,
            categoryId: $this->post->category->bc_id
        );

        App\Layout\Components\Layouts\Post\VideoContent\Layout::draw([
            'title' => $this->post->name,
            'description' => $this->post->short,
            'video_h' => $this->post->video_horizontal,
            'video_v' => $this->post->video_vertical,
            'video' => $this->post->video,
        ]);
    } else {
        App\Layout\Components\Layouts\Post\PostHeading\Layout::drawPostHeading(
            date: Simflex\Core\Time::normal($this->post->date),
            category: $this->post->category->name,
            views: $this->post->views,
            categoryId: $this->post->category->bc_id,
        );

        App\Layout\Components\Layouts\Post\PostFs\Layout::drawPostFs(
            title: $this->post->name,
            description: $this->post->short ?? '',
            img: $this->post->photo_post,
        );
    }

    App\Layout\Components\Layouts\Post\PostContent\Layout::drawPostContent(
        id: $this->post->blog_id,
        content: $this->post->content ?? '',
        views: $this->post->views,
        date: Simflex\Core\Time::normal($this->post->date),
        likes: $this->post->likes ?? 0,
        dislikes: $this->post->dislikes ?? 0,
    );

    App\Layout\Components\Common\SliderSections\BlogSlider\Layout::draw([
        'title' => 'Другие статьи',
        'link' => '/blog/',
        'cards' => $items,
    ]);

    App\Layout\Components\Common\FormBlock\Layout::draw([
        'title' => $index['params']['form_block-title'],
        'desc' => $index['params']['form_block-desc'],
        'image' => '/uf/images/source/' . $index['params']['form_block-image'],
    ]);

    App\Layout\Components\Common\Seo\Layout::draw([
        'seo-title' => $this->post->seo_title,
        'seo-desc' => $this->post->seo_desc,
        'seo2-title' => $this->post->seo2_title,
        'seo2-desc' => $this->post->seo2_desc,
    ]);
    ?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>
