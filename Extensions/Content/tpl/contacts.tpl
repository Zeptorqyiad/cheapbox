<?php
/** @var array $content */

$index = $content->loadFrom('/');

use App\Extensions\Addresses\Model\Addresses;
$addresses = Addresses::findAdv()->where(['is_active' => 1])->all();

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

    <main>
        <?php
        App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

        App\Layout\Components\Common\PageHeading\Layout::drawPageHeading(
            style: App\Layout\Components\Common\PageHeading\PageHeadingStyle::Secondary
        );

        App\Layout\Components\Common\Contacts\Layout::draw([
            'title' => 'Контакты',
            'className' => 'contacts-page'
        ]);

        App\Layout\Components\Unique\AddressesSection\Layout::draw([
            'title' => 'Наши офисы и склады',
            'addresses' => $addresses,
        ]);

        App\Layout\Components\Common\FormBlock\Layout::draw([
            'title' => $index['params']['form_block-title'],
            'desc' => $index['params']['form_block-desc'],
            'image' => '/uf/images/source/' . $index['params']['form_block-image'],
        ]);
        ?>
    </main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>
