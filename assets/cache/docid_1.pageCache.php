<?php die('Unauthorized access.'); ?>a:42:{s:2:"id";s:1:"1";s:4:"type";s:8:"document";s:11:"contentType";s:9:"text/html";s:9:"pagetitle";s:14:"Главная";s:9:"longtitle";s:14:"Главная";s:11:"description";s:38:"Описание для главной";s:5:"alias";s:5:"index";s:15:"link_attributes";s:0:"";s:9:"published";s:1:"1";s:8:"pub_date";s:1:"0";s:10:"unpub_date";s:1:"0";s:6:"parent";s:1:"0";s:8:"isfolder";s:1:"0";s:9:"introtext";s:0:"";s:7:"content";s:0:"";s:8:"richtext";s:1:"1";s:8:"template";s:1:"5";s:9:"menuindex";s:1:"0";s:10:"searchable";s:1:"1";s:9:"cacheable";s:1:"1";s:9:"createdby";s:1:"1";s:9:"createdon";s:10:"1144904400";s:8:"editedby";s:1:"1";s:8:"editedon";s:10:"1736176894";s:7:"deleted";s:1:"0";s:9:"deletedon";s:1:"0";s:9:"deletedby";s:1:"0";s:11:"publishedon";s:1:"0";s:11:"publishedby";s:1:"0";s:9:"menutitle";s:4:"Home";s:7:"donthit";s:1:"0";s:10:"privateweb";s:1:"0";s:10:"privatemgr";s:1:"0";s:13:"content_dispo";s:1:"0";s:8:"hidemenu";s:1:"0";s:13:"alias_visible";s:1:"1";s:7:"meta_h1";a:5:{i:0;s:7:"meta_h1";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:4:"text";}s:8:"og_title";a:5:{i:0;s:8:"og_title";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:4:"text";}s:14:"og_description";a:5:{i:0;s:14:"og_description";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:8:"textarea";}s:8:"og_image";a:5:{i:0;s:8:"og_image";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:5:"image";}s:12:"home_banners";a:5:{i:0;s:12:"home_banners";i:1;s:308:"{"fieldValue":[{"home_banner_desktop":"assets/images/home_banner_1_desktop.png","home_banner_mobile":"assets/images/home_banner_1_mobile.png"},{"home_banner_desktop":"assets/images/home_banner_2_desktop.png","home_banner_mobile":"assets/images/home_banner_2_mobile.png"}],"fieldSettings":{"autoincrement":1}}";i:2;s:0:"";i:3;s:11:"&align=none";i:4;s:17:"custom_tv:multitv";}s:17:"__MODxDocGroups__";s:0:"";}<!--__MODxCacheSpliter__--><!DOCTYPE html>
<html lang="ru">

<head>
  <head>
    <base href="http://localhost:8888/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- SEO -->
    <title>Главная | My Evolution Site</title>
    <meta name="description" content="Описание для главной">
    <meta name="keywords" content="">
    
    <!-- Open Graph -->
	<meta property="og:title" content="[!if? &is=`:=:` &then=`Главная` &else=``!]">
	<meta property="og:description" content="[!if? &is=`:=:` &then=`Описание для главной` &else=``!]">
	<meta property="og:image" content="[!if? &is=`:=:` &then=`http://localhost:8888/` &else=`http://localhost:8888/`!]">
	<meta property="og:type" content="website">
    <meta property="og:url" content="http://localhost:8888/[~1~]">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    
    <!-- CSS -->
    <link rel="stylesheet" href="assets/templates/qmedia/css/qmedia.css">
    
    <!-- JavaScript -->
    <script src="assets/templates/qmedia/js/qmedia.js"></script>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Mulish:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
	
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
	
    
    <!-- Analytics -->
    [(google_analytics)]
    [(yandex_metrika)]
</head>

</head>

<body>
  <header class="header">
    <div class="header-wrap">
        <div class="header-top">
            <nav class="menu">
                <ul>
					[!DocLister?
        				&documents=`60,61,63,64,65`
        				&tpl=`@CODE<li><a href="/[~[+id+]~]">[+pagetitle+]</a></li>`
        				&sortby=`menuindex`
						&order=`ASC`
    				!]
                </ul>
            </nav>
			
            <div class="phones">
				[!getPhonesHeaderFromSettings!]
            </div>

        </div>

        <div class="header-bottom">
			<div class="mobile-menu">
				<img src="assets/images/toggle.svg">
			</div>
            <div class="branding">

                <a href="/">
				<img src="assets/images/logo.svg" alt="Логотип сайта">

                <div class="site-info">
                    <p class="site-title">Qmedia Market</p>
                    <p class="site-description">Интернет-магазин полезных вещей</p>
                </div>
				</a>
            </div>

            <div class="search-bar">
                <input type="text" placeholder="Поиск по каталогу...">
                <button><img src="assets/images/search.svg" alt="Логотип сайта"></button>
            </div>
        </div>
    </div>
</header>
	<main class="main-content">
		<div style="display:none;"><div class="page-header">
	[!DLCrumbs? 
	&showCurrent=`1`
	&tpl=`@CODE:<li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><meta itemprop="position" content="[+iteration+]" /><a href="[+url+]" title="[+e.title+]"  itemprop="item"><span itemprop="name">[+title+]</span></a></li>`
	&tplCurrent=`@CODE:<li class="breadcrumb-item active" aria-current="page" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><meta itemprop="position" content="[+iteration+]" /><span itemprop="name">[+title+]</span></li>`
	&ownerTpl=`@CODE:<nav aria-label="breadcrumb"><ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">[+crumbs.wrap+]</ol></nav>`
!]	
	<h1></h1>
</div></div>
    <section class="banner">
	<div class="swiper mySwiper">
    <div class="swiper-wrapper"><div class="swiper-slide">
<div class="banner">
    <picture>
        <source srcset="assets/cache/images/home_banner_1_mobile-900x300-a90.webp" media="(max-width: 1199px)">
        <img src="assets/cache/images/home_banner_1_desktop-1600x250-c28.webp" alt="Banner Image">
    </picture>
</div>
</div>
<div class="swiper-slide">
<div class="banner">
    <picture>
        <source srcset="assets/cache/images/home_banner_2_mobile-900x300-a90.webp" media="(max-width: 1199px)">
        <img src="assets/cache/images/home_banner_2_desktop-1600x250-c28.webp" alt="Banner Image">
    </picture>
</div>
</div>
</div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
</section>

	
	<section class="categories">
    <div class="category-grid">	
		[!DocLister? 
			&parents=`53`
    		&tvList=`category_image`
    		&sortBy=`menuindex`
    		&sortDir=`ASC`
			&tpl=`tplCategory`
		!]	
	</div>
</section>
		
	<section class="contact-section">
    <div class="contact-wrapper">
		
		<!-- Правая колонка: текст -->
        <div class="text-container">
            <h3>Qmedia Market – Интернет-магазин полезных вещей</h3>
			<div class="wrap-text-about">
				<p>Qmedia Market — магазин полезных вещей для себя, дома, офиса и дачи. Здесь вы найдете товары под свои предпочтения: от аудиотехники и одежды до строительных материалов и велосипедов. Работаем с проверенными производителями с 2007 года. Доставляем товары точно в срок.</p>
			<p>Покупка товара проста только на первый взгляд. Нужно думать о том, как оформить доставку, кто соберет шкаф или установит кондиционер. В нашем магазине эти услуги уже продуманы. Думайте только о подборе товаров в каталоге. Для этого предлагаем комплексный подход — наша команда выполнит все задачи!</p>
			</div>
            
        </div>
		
		
		
		
		
		
		
		[!FormLister?
&formid=`basic`
&protectSubmit=`0`
&rules=`
{
    "name":{
        "required":"Обязательно введите имя",
        "matches":{
            "params":"\/^[\\pL\\s\\-']++$\/uD",
            "message":"Введите имя правильно"
        }
    },
    "email":{
        "email":"Введите email правильно"
    },
    "phone":{
        "required":"Обязательно введите номер телефона",
        "phone":"Введите номер правильно"
    },
}`
&formTpl=`@CODE:
<div class="form-container row">
    <div class="col-md-8 col-md-offset-2">
        <div class="well">
            <form class="contact-form" method="post">
                <input type="hidden" name="formid" value="basic">
                <div class="wrap form-group[+name.errorClass+][+name.requiredClass+]">
                    <label for="name" class="col-sm-2 control-label">Имя *</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" placeholder="Екатерина" name="name" value="[+name.value+]">
                        [+name.error+]
                    </div>
                </div>
                
                <div class="wrap form-group[+phone.errorClass+][+phone.requiredClass+]">
                    <label for="phone" class="col-sm-2 control-label">Телефон *</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" placeholder="+375 __ __ __ __" name="phone" value="[+phone.value+]">
                        [+phone.error+]
                    </div>
                </div>
				
				
				<div class="wrap form-group[+email.errorClass+]">
                    <label for="email" class="col-sm-2 control-label">Email *</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" placeholder="katya@mail.by" name="email" value="[+email.value+]">
                        [+email.error+]
                    </div>
					
                </div>

				<div>[+form.messages+]</div>
                
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-envelope"></i> Отправить</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>`
&to=`valikbelsky@gmail.com, valentinbelsky@live.com`
&from=`valikbelsky@yandex.ru`
&ccSender=`1`
&ccSenderField=`email`
&ccSenderTpl=`@CODE:Спасибо за обращение, [+name.value+]`
&reportTpl=`@CODE:
<p>Посетитель сайта: Qmedia Market оставил заявку</p>
<p>Имя: [+name.value+]</p>
<p>Email: <a href="mailto:[+email.value+]">[+email.value+]</a></p>
<p>Телефон: [+phone.value+]</p>
`
&errorClass=` has-error`
&requiredClass=` has-warning`
&subject=`Новое сообщение`
&messagesOuterTpl=`@CODE:<div class="alert alert-danger" role="alert">[+messages+]</div>`
&errorTpl=`@CODE:<span class="help-block">[+message+]</span>`
!]
		
		
		
        

        
    </div>
</section>
		
		<div>
			
		</div>
		
  </main>
  <footer class="footer">
    <!-- Первый блок -->
	<div class="footer-main-wrap">
    <div class="footer-block footer-logo">
		<div class="branding">
			<a href="/">
			<img src="assets/images/logo.svg" alt="Логотип сайта">
            <div class="site-info">
                <p class="site-title footer-color">Qmedia Market</p>
                <p class="site-description footer-color">Интернет-магазин полезных вещей</p>
            </div>
			</a>
        </div>
        <div class="footer-address">
            <p>Юр. адрес: 220 123, г. Минск, ул. Старовиленская 100−4а Свидетельство о гос. регистрации номер 0191397 (выдано Минским горисполкомом 14.10.2022)</p>
        </div>

    </div>
    <div class="footer-wrap">
        <!-- Второй блок -->
        <div class="footer-block footer-links">
            <h3 class="footer-heading">Каталог</h3>
				<ul class="footer-menu">
			[!DocLister?
				&parents=`53`
				&sortby=`menuindex`
				&order=`ASC`
				&maxDepth=`1`
				&tpl=`@CODE<li><a href="/[~[+id+]~]">[+pagetitle+]</a></li>`!]
			</ul>
        </div>

        <!-- Третий блок -->
        <div class="footer-block footer-links">
            <h3 class="footer-heading">Информация</h3>
            <ul class="footer-menu">
				[!DocLister?
        				&documents=`60,61,63,64,65`
        				&tpl=`@CODE<li><a href="/[~[+id+]~]">[+pagetitle+]</a></li>`
        				&sortby=`menuindex`
						&order=`ASC`
    				!]
            </ul>
        </div>

        <!-- Четвёртый блок -->
        <div class="footer-block footer-contacts">
            <h3 class="footer-heading">Контакты</h3>
            <ul class="footer-phones">	
				[!getPhonesFooterFromSettings!]
				[!getEmailsFooterFromSettings!]
            </ul>
        </div>
    </div>

</div>
</footer>
</body>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper(".mySwiper", {
		loop: true,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>

</html>
