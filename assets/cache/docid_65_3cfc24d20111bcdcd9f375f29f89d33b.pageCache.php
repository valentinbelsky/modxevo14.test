<?php die('Unauthorized access.'); ?>a:41:{s:2:"id";s:2:"65";s:4:"type";s:8:"document";s:11:"contentType";s:9:"text/html";s:9:"pagetitle";s:16:"Контакты";s:9:"longtitle";s:0:"";s:11:"description";s:0:"";s:5:"alias";s:8:"kontakty";s:15:"link_attributes";s:0:"";s:9:"published";s:1:"1";s:8:"pub_date";s:1:"0";s:10:"unpub_date";s:1:"0";s:6:"parent";s:1:"0";s:8:"isfolder";s:1:"0";s:9:"introtext";s:0:"";s:7:"content";s:338:"<section class="seo-text">
<h2>Контент для SEO-продвижения</h2>
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, est harum tempora accusantium eos tenetur obcaecati beatae quis veritatis nihil, quibusdam ullam sit ducimus praesentium tempore voluptates? Natus, numquam corrupti.</p>
</section>";s:8:"richtext";s:1:"1";s:8:"template";s:1:"8";s:9:"menuindex";s:2:"19";s:10:"searchable";s:1:"1";s:9:"cacheable";s:1:"1";s:9:"createdby";s:1:"1";s:9:"createdon";s:10:"1735817053";s:8:"editedby";s:1:"1";s:8:"editedon";s:10:"1735945648";s:7:"deleted";s:1:"0";s:9:"deletedon";s:1:"0";s:9:"deletedby";s:1:"0";s:11:"publishedon";s:10:"1735817053";s:11:"publishedby";s:1:"1";s:9:"menutitle";s:0:"";s:7:"donthit";s:1:"0";s:10:"privateweb";s:1:"0";s:10:"privatemgr";s:1:"0";s:13:"content_dispo";s:1:"0";s:8:"hidemenu";s:1:"0";s:13:"alias_visible";s:1:"1";s:7:"meta_h1";a:5:{i:0;s:7:"meta_h1";i:1;s:19:"Контакты H1";i:2;s:0:"";i:3;s:0:"";i:4;s:4:"text";}s:8:"og_title";a:5:{i:0;s:8:"og_title";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:4:"text";}s:14:"og_description";a:5:{i:0;s:14:"og_description";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:8:"textarea";}s:8:"og_image";a:5:{i:0;s:8:"og_image";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:5:"image";}s:17:"__MODxDocGroups__";s:0:"";}<!--__MODxCacheSpliter__--><!DOCTYPE html>
<html lang="ru">

<head>
  <head>
    <base href="http://localhost:8888/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- SEO -->
    <title>Контакты | My Evolution Site</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    
    <!-- Open Graph -->
	<meta property="og:title" content="[!if? &is=`:=:` &then=`Контакты` &else=``!]">
	<meta property="og:description" content="[!if? &is=`:=:` &then=`` &else=``!]">
	<meta property="og:image" content="[!if? &is=`:=:` &then=`http://localhost:8888/` &else=`http://localhost:8888/`!]">
	<meta property="og:type" content="website">
    <meta property="og:url" content="http://localhost:8888/[~65~]">

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
  
	<main>
		<div class="page-header">
	[!DLCrumbs? 
	&showCurrent=`1`
	&tpl=`@CODE:<li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><meta itemprop="position" content="[+iteration+]" /><a href="[+url+]" title="[+e.title+]"  itemprop="item"><span itemprop="name">[+title+]</span></a></li>`
	&tplCurrent=`@CODE:<li class="breadcrumb-item active" aria-current="page" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><meta itemprop="position" content="[+iteration+]" /><span itemprop="name">[+title+]</span></li>`
	&ownerTpl=`@CODE:<nav aria-label="breadcrumb"><ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">[+crumbs.wrap+]</ol></nav>`
!]	
	<h1>Контакты H1</h1>
</div>
		<div class="content">
			<section class="seo-text">
<h2>Контент для SEO-продвижения</h2>
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, est harum tempora accusantium eos tenetur obcaecati beatae quis veritatis nihil, quibusdam ullam sit ducimus praesentium tempore voluptates? Natus, numquam corrupti.</p>
</section>
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

</html>
