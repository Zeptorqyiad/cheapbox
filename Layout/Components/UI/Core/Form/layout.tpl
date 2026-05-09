<?php
/** @var array $data */

?>

<form class="form feedback__form js--form-feedback <?=$data['className']?>" action="" method="post">
    <fieldset class="form__body">
        <div class="form__inputs">
            <div class="form__col item-a">
                <?php App\Layout\Components\UI\Core\TextInput\Layout::drawInput(
                    labelText: 'Имя',
                    labelPos: App\Layout\Components\UI\Core\TextInput\TextInputLabelPos::Standard,
                    id: 'name',
                    attributes: [
                        'name' => 'name',
                        'placeholder' => 'Иван',
                    ]
                ); ?>
            </div>
            <div class="form__col item-b">
                <?php App\Layout\Components\UI\Core\TextInput\Layout::drawInput(
                    labelText: 'Телефон*',
                    labelPos: App\Layout\Components\UI\Core\TextInput\TextInputLabelPos::Standard,
                    id: 'phone',
                    attributes: [
                        'name' => 'phone',
                        'placeholder' => '+7 (999) 999-99-99',
                        'type' => 'tel',
                        'required' => 'required'
                    ]
                ); ?>
            </div>
            <div class="form__col item-c">
                <?php App\Layout\Components\UI\Core\TextInput\Layout::drawInput(
                    labelText: 'Почта',
                    labelPos: App\Layout\Components\UI\Core\TextInput\TextInputLabelPos::Standard,
                    id: 'email',
                    attributes: [
                        'name' => 'email',
                        'placeholder' => 'example@example.ru',
                        'type' => 'email',
                    ]
                ); ?>
            </div>
        </div>
    </fieldset>
    <div class="form__footer">
        <?php
        App\Layout\Components\UI\Core\Checkbox\Layout::drawCheckbox(
            className: 'form__policy',
            policy: true,
            attributes: [
                'name' => 'policy',
                'required' => 'required'
            ]
        );

        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'form__submit',
            text: 'Заказать звонок',
            loader: true,
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
            attributes: [
                'type' => 'submit'
            ]
        );
        ?>
    </div>
</form>