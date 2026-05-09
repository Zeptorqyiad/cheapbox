<?php
/** @var array $content */

$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $content['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Unique\ErrorSection\Layout::drawErrorSection(
        img: '/assets/images/sources/404.png',
        title: 'Такой страницы не существует',
        description: 'Скорее всего, вы использовали устаревшую или неправильную ссылку. Вы можете перейти на главную или на страницу услуг и найти то, что вам нужно',
    );
    ?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>