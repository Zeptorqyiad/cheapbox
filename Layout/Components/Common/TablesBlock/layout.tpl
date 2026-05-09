<?php
/** @var array $data */

$body = json_decode($data['body'] ?? '{}')->v ?? [];

?>

<section class="tables-block">
    <div class="tables-block__container container">
        <?php if ($data['title'] || $data['desc']): ?>
            <?php
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'] ?? '',
                    desc: $data['desc'] ?? '',
                    separator: $data['desc'] ? true : false
                );
            ?>
        <?php endif; ?>

        <div class="tables-block__wrap">
            <?php if ($data['table-title']): ?>
                <div class="tables-block__title">
                    <?= $data['table-title'] ?>
                </div>
            <?php endif; ?>

            <div class="tables-block__wrap-container">
                <div class="tables-block__wrap-container--wrap">
                    <table class="tables-block__table" align="center">
                        <colgroup>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead class="tables-block__table-header" valign="middle" align="center">
                            <tr class="tables-block__table-header--tr">
                                <th class="tables-block__table-header--th-btlr col-1" scope="col">Страна отправителя</th>
                                <th class="tables-block__table-header--th col-2" scope="col">Порт отправления</th>
                                <th class="tables-block__table-header--th col-1" scope="col">Порт прибытия</th>
                                <th class="tables-block__table-header--th col-3" scope="col">20DC COC FILO</th>
                                <th class="tables-block__table-header--th-btrr col-3" scope="col">40DC COC FILO</th>
                            </tr>
                        </thead>
                        <tbody class="tables-block__table-body" align="center">
                            <tr class="tables-block__table-body--tr">
                                <td class="tables-block__table-body--td-bblr" rowspan="3">China</td>
                                <td class="tables-block__table-body--td">Shanhai / Ningo / Qingdao / Rizhao / Xingang</td>
                                <td class="tables-block__table-body--td" rowspan="3">ВМТП / ВМПП / ПЛ / Терминал Астафьева</td>
                                <td class="tables-block__table-body--td">1250$</td>
                                <td class="tables-block__table-body--td">1340$</td>
                            </tr>
                            <tr class="tables-block__table-body--tr">
                                <td class="tables-block__table-body--td">Xiamen / Shenzhen (Yantian) / Guangzhou (Nansha) / Dalian</td>
                                <td class="tables-block__table-body--td">1350$</td>
                                <td class="tables-block__table-body--td">1450$</td>
                            </tr>
                            <tr class="tables-block__table-body--tr">
                                <td class="tables-block__table-body--td">Fuzhou / Shantou / Pearl River Inner Ports (Beijiao / Foshan, Jiangmen / Rongqi. Zhongshan / Shunde / Zhuhai / Dongguan</td>
                                <td class="tables-block__table-body--td">1500$</td>
                                <td class="tables-block__table-body--td-bbrr">1650$</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'about-us__separator'
            );
        ?>

        <div class="tables-block__wrap">
            <?php if ($data['table-second-title']): ?>
                <div class="tables-block__title">
                    <?= $data['table-second-title'] ?>
                </div>
            <?php endif; ?>

            <div class="tables-block__wrap-container">
                <div class="tables-block__wrap-container--wrap">
                    <table class="tables-block__table" align="center">
                        <colgroup>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead class="tables-block__table-header" valign="middle" align="center">
                            <tr class="tables-block__table-header--tr">
                                <th class="tables-block__table-header--th-btlr col-1" scope="col" rowspan="2">Город назначения</th>
                                <th class="tables-block__table-header--th col-1" scope="col" colspan="3">Ставка за 1 ктк, руб.</th>
                                <th class="tables-block__table-header--th-btrr col-1" scope="col" colspan="2">Ставка за 1 ктк, руб.</th>
                            </tr>
                            <tr class="tables-block__table-header--tr">
                                <th class="tables-block__table-header--th col-1" scope="col">20DC (<24 т брутто груза)</th>
                                <th class="tables-block__table-header--th col-1" scope="col">20DC (>24 т брутто груза)</th>
                                <th class="tables-block__table-header--th col-1" scope="col">40HC (<28 т брутто груза)</th>
                                <th class="tables-block__table-header--th col-3" scope="col">Охрана 20DC*</th>
                                <th class="tables-block__table-header--th col-3" scope="col">Охрана 20HC*</th>
                            </tr>
                        </thead>

                        <?php if ($body): ?>
                            <?php foreach ($body as $i): ?>
                                <tbody class="tables-block__table-body" align="center">
                                    <tr class="tables-block__table-body--tr first-child">
                                        <td class="tables-block__table-body--td"><?= $i->city ?></td>
                                        <td class="tables-block__table-body--td"><?= $i->column2 ?></td>
                                        <td class="tables-block__table-body--td"><?= $i->column3 ?></td>
                                        <td class="tables-block__table-body--td"><?= $i->column4 ?></td>
                                        <td class="tables-block__table-body--td"><?= $i->column5 ?></td>
                                        <td class="tables-block__table-body--td"><?= $i->column6 ?></td>
                                    </tr>
                                </tbody>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </table>
                </div>
            </div>
        </div>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'about-us__separator'
            );
        ?>

        <div class="tables-block__content">
            <div class="tables-block__content-text">
                <?php if ($data['content-title']): ?>
                    <div class="tables-block__content-title">
                        <?= $data['content-title'] ?>
                    </div>
                <?php endif; ?>

                <?php if ($data['desc-content']): ?>
                    <div class="tables-block__content-desc">
                        <?= $data['desc-content'] ?>
                    </div>
                <?php endif; ?>
            </div>

            <?php if ($data['accent-descr']): ?>
                <?php
                    App\Layout\Components\Cards\AccentCard\Layout::drawAccentCard(
                        desc: $data['accent-descr'] ?? '',
                    );
                ?>
            <?php endif; ?>
        </div>
    </div>
</section>
