<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'footer_email' => array(
        'caption' => 'Email',
        'type' => 'text'
    ),
);

$settings['templates'] = array(
    'outerTpl' => '',
    'rowTpl' => '<a href="tel:[+footer_email+]"><img src="assets/images/phone.svg"  alt="Номер телефона" width="20px" height="20px">[+footer_email+]</a>'
);
