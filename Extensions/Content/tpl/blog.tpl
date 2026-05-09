<?php
/** @var array $content */

$index = $content->loadFrom('/');

$q = App\Extensions\Blog\Model\Blog::findAdv()
    ->orderBy('npp')
    ->where(['is_active' => 1]);

$c = $_REQUEST['c'] ?? 0;
if ($this->c) {
    $q->andWhere(['bc_id' => $this->c]);
}

$page = (int)($_REQUEST['page'] ?? 0);
if ($page < 0) $page = 0;

$limit = 16;

$totalCount = $q->select('count(*)')->fetchScalar();
$pages = (int)ceil($totalCount / $limit);

if ($page >= $pages && $pages > 0) $page = $pages - 1;

$offset = $page * $limit;
$cards  = $q->select("*")->limit("$offset, $limit")->all();

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
        App\Layout\Components\Layouts\Blog\BlogFs\Layout::draw([
            'title' => $content['params']['blog_fs-title'],
            'desc' => $content['params']['blog_fs-desc'],
        ]);

        App\Layout\Components\Layouts\Blog\BlogContent\Layout::draw([
            'cats' => $c,
            'cards' => $cards,
            'pages' => $pages,
            'page' => $page
        ]);

        App\Layout\Components\Common\FormBlock\Layout::draw([
            'title' => $index['params']['form_block-title'],
            'desc' => $index['params']['form_block-desc'],
            'image' => '/uf/images/source/' . $index['params']['form_block-image'],
        ]);

        App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $index['params']['seo_title_1'],
            'seo-desc' => $index['params']['seo_text_1'],
            'seo2-title' => $index['params']['seo_title_2'],
            'seo2-desc' => $index['params']['seo_text_2'],
        ]);
    ?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>
