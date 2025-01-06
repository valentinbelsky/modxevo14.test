<?php

return [
    'caption' => 'Header',
    'introtext' => '',
    'settings' => [
        'logo' => [
            'caption' => 'Логотип',
            'type'  => 'image',
        ],
        'site_name' => [
            'caption' => 'Название',
            'type'  => 'text',
        ],
        'site_description' => [
            'caption' => 'Описание',
            'type'  => 'text',
        ],
        'header_menu' => [
            'caption' => 'Меню в верхней части',
            'type' => 'selector',

        ],
        'header_phones' => [
            'caption' => 'Список телефонов',
            'type' => 'custom_tv:multitv',
        ],
    ],
];
