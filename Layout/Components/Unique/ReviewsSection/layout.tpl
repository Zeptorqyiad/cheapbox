<?php
/** @var array $data */

use App\Extensions\Site\Model\Reviews;

$page = (int)($_REQUEST['page'] ?? 0);
if ($page < 0) $page = 0;

$limit = 16;
$q = Reviews::findAdv()->where(['is_active' => 1]);
$totalCount = $q->select('count(*)')->fetchScalar();

$pages = (int)ceil($totalCount / $limit);

if ($page >= $pages && $pages > 0) $page = $pages - 1;

$offset = $page * $limit;
$cards  = $q->select("*")
    ->limit("$offset, $limit")
    ->orderBy('npp DESC')
    ->all();

$data['cards'] = $cards;
$data['page']  = $page;
$data['pages'] = $pages;

?>

<section class="reviews-section">
    <div class="reviews-section__container container">
        <div class="reviews-section__wrap">
            <?php foreach ($data['cards'] as $card): ?>
                <?php
                    App\Layout\Components\Cards\DocCard\Layout::drawDocCard(
                        title: $card['title'] ?? '',
                        image: '/uf/images/source/' . $card['image'] ?? '',
                    );
                ?>
            <?php endforeach; ?>
        </div>
        <?php
            App\Layout\Components\UI\Other\Pagination\Layout::drawPages(
                $data['page'],
                $data['pages'],
            );
        ?>
    </div>
</section>
