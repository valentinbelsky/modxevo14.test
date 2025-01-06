<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'footer_phones' => array(
        'caption' => 'Телефон',
        'type' => 'text'
    )
);

$settings['templates'] = array(
    'outerTpl' => '[+wrapper+]',
    'rowTpl' => '<li><a href="tel:[+footer_phones+]"><img src="assets/images/phone-white.svg"  alt="Номер телефона" width="20px" height="20px">[+footer_phones+]</a></li>'
);
