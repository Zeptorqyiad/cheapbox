<?php
/** @var array $data */

use App\Extensions\Cases\Model\Cases;

$page = (int)($_REQUEST['page'] ?? 0);
if ($page < 0) $page = 0;

$limit = 16;

$totalCount = Cases::findAdv()
    ->where(['is_active' => 1])
    ->orderBy('npp')
    ->select('count(*)')
    ->fetchScalar();

$pages = (int)ceil($totalCount / $limit);

if ($page >= $pages && $pages > 0) $page = $pages - 1;

$offset = $page * $limit;
$cards  = Cases::findAdv()
    ->where(['is_active' => 1])
    ->orderBy('npp')
    ->limit("$offset, $limit")
    ->all();

$data['cards'] = $cards;
$data['page']  = $page;
$data['pages'] = $pages;
?>

<section class="cases-section">
    <div class="cases-section__container container">
        <div class="cases-section__wrap">
            <?php foreach ($data['cards'] as $i): ?>
                <?php
                    App\Layout\Components\Cards\CaseCard\Layout::drawCaseCard(
                        name: $i->name ?? '',
                        short: $i->short ?? '',
                        photo: $i->photo_min ?? '',
                        link: $i->alias . '/',
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
<div class="container">
    <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
    ?>
</div>
