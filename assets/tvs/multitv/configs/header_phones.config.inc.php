<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'header_phones' => array(
        'caption' => 'Телефон',
        'type' => 'text'
    ),
);

$settings['templates'] = array(
    'outerTpl' => '',
    'rowTpl' => '<a href="tel:[+header_phones+]"><img src="assets/images/phone.svg"  alt="Номер телефона" width="20px" height="20px">[+header_phones+]</a>'
);
