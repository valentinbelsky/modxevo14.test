<?php

return [
    'caption' => 'Footer',
    'introtext' => '',
    'settings' => [
        'footer_company_info' => [
            'caption' => 'Описание компании',
            'type'  => 'textareamini',
        ],
        'footer_info_menu' => [
            'caption' => 'Информационное меню (рядом с каталогом)',
            'type'  => 'selector',
        ],
        'footer_phones' => [
            'caption' => 'Список телефонов',
            'type'  => 'custom_tv:multitv',
        ],
        'footer_emails' => [
            'caption' => 'Список почтовых ящиков',
            'type'  => 'custom_tv:multitv',
        ]
    ],
];
