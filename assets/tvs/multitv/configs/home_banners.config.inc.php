<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'home_banner_desktop' => array(
        'caption' => 'Изображение для десктопов',
        'type' => 'image'
    ),
    'home_banner_mobile' => array(
        'caption' => 'Изображения для мобильных',
        'type' => 'image'
    ),
);

$settings['templates'] = array(
    'outerTpl' => '<div class="swiper-wrapper">[+wrapper+]</div>',
    'rowTpl' => '<div class="swiper-slide">
<div class="banner">
    <picture>
        <source srcset="[[phpthumb? &input=`[+home_banner_mobile+]` &options=`w=900, h=300, zc=B, f=webp`]]" media="(max-width: 1199px)">
        <img src="[[phpthumb? &input=`[+home_banner_desktop+]`&options=`w=1600, h=250, zc=B, f=webp`]]" alt="Banner Image">
    </picture>
</div>
</div>
'
);


