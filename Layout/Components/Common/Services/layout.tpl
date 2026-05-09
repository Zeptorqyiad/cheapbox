<?php
/** @var $data array */
/** @var $content array */

use App\Extensions\Site\Model\ServiceCategory;

$catVed = ServiceCategory::findAdv()->where(['name' => 'Консультация ВЭД'])->all();
$catCustom = ServiceCategory::findAdv()->where(['name' => 'Услуги таможенного представителя'])->all();
$catHelp = ServiceCategory::findAdv()->where(['name' => 'Помощь в оформлении документов'])->all();
$catInter = ServiceCategory::findAdv()->where(['name' => 'Услуги международного экспедитора'])->all();
$catFin = ServiceCategory::findAdv()->where(['name' => 'Финансовая логистика'])->all();

$vedOptions = getServiceOptions('Консультация ВЭД');
$customOptions = getServiceOptions('Услуги таможенного представителя');
$helpOptions = getServiceOptions('Помощь в оформлении документов');
$interOptions = getServiceOptions('Услуги международного экспедитора');
$finOptions = getServiceOptions('Финансовая логистика');

$categories = [
    ['cat' => $catVed, 'options' => $vedOptions, 'hasExpress' => true],
    ['cat' => $catCustom, 'options' => $customOptions, 'hasExpress' => false],
    ['cat' => $catHelp, 'options' => $helpOptions, 'hasExpress' => false],
    ['cat' => $catInter, 'options' => $interOptions, 'hasExpress' => false],
    ['cat' => $catFin, 'options' => $finOptions, 'hasExpress' => false],
];
?>

<section class="services">
    <div class="services__container container">
        <?php App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
            title: $data['title'] ?? '',
            desc: $data['description'] ?? '',
            separator: true,
        ); ?>

        <ul class="services__steps">
            <?php foreach ($categories as $category): ?>
                <?php if (!empty($category['options']) && !empty($category['cat'])): ?>
                    <li class="services__step">
                        <div class="services__step_ls">
                            <h3 class="services__step_ls--title">
                                <?= !empty($category['cat'][0]['short']) ? $category['cat'][0]['short'] : ($category['cat'][0]['name'] ?? '') ?>
                            </h3>

                            <div class="services__step_ls--text">
                                <?= $category['cat'][0]['subtitle'] ?? '' ?>
                            </div>
                        </div>

                        <div class="services__step_rs">
                            <?php
                            if ($category['hasExpress']) {
                                App\Layout\Components\Cards\ServiceExampleCard\Layout::drawServiceExampleCard(
                                    className: 'pointer-none',
                                    title: $data['express-title'] ?? '',
                                    text: $data['express-text'] ?? '',
                                    img: $data['express-icon'] ?? '',
                                    color: App\Layout\Components\Cards\ServiceExampleCard\ServiceExampleCardColor::Green,
                                );
                            }

                            foreach ($category['options'] as $option) {
                                $dynamicColor = getServiceCardColor($option['color'] ?? 'main');

                                App\Layout\Components\Cards\ServiceExampleCard\Layout::drawServiceExampleCard(
                                    className: 'service-example-card__link',
                                    title: $option['text'] ?? '',
                                    text: $option['short'] ?? '',
                                    img: '/uf/images/source/' . $option['icon'] ?? '',
                                    link: '/services' . $option['link'] ?? '',
                                    color: $dynamicColor,
                                );
                            }
                            ?>
                        </div>
                    </li>

                    <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'services__separator'
                    );
                    ?>
                <?php endif; ?>
            <?php endforeach; ?>
        </ul>
    </div>
</section>