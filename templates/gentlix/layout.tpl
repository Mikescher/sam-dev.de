<!DOCTYPE html>
<html lang="en">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<title>{ia_print_title title=$gTitle|default:$pageTitle}</title>
		<meta http-equiv="Content-Type" content="text/html;charset={$config.charset}">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="generator" content="Subrion CMS {$config.version} - Open Source Content Management System">
		<meta name="description" content="{$description}">
		<meta name="keywords" content="{$keywords}">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$nonProtocolUrl}">

		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
			<script src="{$nonProtocolUrl}js/utils/shiv.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{$nonProtocolUrl}favicon.ico">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$pageName}';

			{foreach $customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>

	<body{if $config.sticky_navbar} class="sticky-navbar"{/if}>
		<header{if 'index' != $pageName} style="padding:0;"{/if}>

			<section class="section section-narrow inventory">
				<div class="container">
					{ia_blocks block='inventory'}

					{include file='language-selector.tpl'}
				</div>
			</section>

			<section class="section navigation"{if 'index' != $pageName} style="border-bottom:none;"{/if}>
				<div class="container">
					<div class="nav-bar">
						<a class="brand" href="{$smarty.const.IA_URL}">
							{if !empty($config.site_logo)}
								<img src="{$nonProtocolUrl}uploads/{$config.site_logo}" alt="{$config.site}">
							{else}
								<img src="{$img}logo.png" alt="{$gTitle}">
							{/if}
						</a>

						<a href="#" class="nav-toggle pull-left" data-toggle="collapse" data-target=".nav-bar-collapse"><i class="icon-reorder"></i></a>

						<div class="nav-bar-collapse">
							<form id="fast-search" method="post" action="{$smarty.const.IA_URL}search/" class="form-inline">
								<div class="control-group">
									<input type="text" name="q" placeholder="{lang key='search'}" class="span2">
									<button type="submit"><i class="icon-search"></i></button>
								</div>
							</form>

							{ia_blocks block='mainmenu'}

						</div>
					</div>
				</div>
			</section>

			{ia_blocks block='header'}

		</header>

		{if isset($iaBlocks.after_header_1) || 
			isset($iaBlocks.after_header_2) || 
			isset($iaBlocks.after_header_3)}
			<section id="after-header" class="section section-dark top-headlines">
				<div class="container">
					<div class="row">
						<div class="{width section='after-header' position='after_header_1'}">
							{ia_blocks block='after_header_1'}
						</div>
						<div class="{width section='after-header' position='after_header_2'}">
							{ia_blocks block='after_header_2'}
						</div>
						<div class="{width section='after-header' position='after_header_3'}">
							{ia_blocks block='after_header_3'}
						</div>
					</div>
				</div>
			</section>
		{/if}

		{if isset($iaBlocks.verytop)}
			<div class="section section-light"{if 'index' != $pageName} style="padding:20px 0;"{/if}>
				<div class="container">
					{ia_blocks block='verytop'}
				</div>
			</div>
		{/if}

		{ia_hooker name='smartyFrontBeforeBreadcrumb'}

		{include file='breadcrumb.tpl'}

		<section id="content" class="section">
			<div class="container">
				<div class="row">

					<div class="{width section='content' position='left'}">
						{ia_blocks block='left'}
					</div>

					<div class="{width section='content' position='center'}">
						<div class="content-wrap">

							{ia_blocks block='top'}

							<h1 class="page-header">{$pageTitle}</h1>

							{ia_hooker name='smartyFrontBeforeNotifications'}
							{include file='notification.tpl'}

							{ia_hooker name='smartyFrontBeforeMainContent'}

							{$_content_}

							{ia_hooker name='smartyFrontAfterMainContent'}

							{ia_blocks block='bottom'}

							{if isset($iaBlocks.user1) || isset($iaBlocks.user2)}
								<div class="row">
									<div class="{width section='user-blocks' position='user1'}">{ia_blocks block='user1'}</div>
									<div class="{width section='user-blocks' position='user2'}">{ia_blocks block='user2'}</div>
								</div>
							{/if}
						</div>
					</div>

					<div class="{width section='content' position='right'}">
						{ia_blocks block='right'}
					</div>

				</div>
			</div>
		</section>

		{if isset($iaBlocks.beforeverybottom)}
			<div class="section" id="beforeverybottom">
				<div class="container">{ia_blocks block='beforeverybottom'}</div>
			</div>
		{/if}

		{if isset($iaBlocks.verybottom)}
			<div class="section section-light">
				<div class="container">{ia_blocks block='verybottom'}</div>
			</div>
		{/if}

		<section class="section section-black">
			<div class="container">
				<div class="row">
					<div class="{width section='footer' position='footer1'}">{ia_blocks block='footer1'}</div>
					<div class="{width section='footer' position='footer2'}">{ia_blocks block='footer2'}</div>
					<div class="{width section='footer' position='footer3'}">{ia_blocks block='footer3'}</div>
				</div>
			</div>
		</section>

		<footer class="section section-black">
			<div class="container">
				{ia_hooker name='smartyFrontBeforeFooterLinks'}

				<div class="row">
					<div class="span4">
						<p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>
					</div>
					<div class="span8">
						{ia_blocks block='copyright'}
					</div>
				</div>

				{ia_hooker name='smartyFrontAfterFooterLinks'}
				<div id="backToTop">
					<a href="#">
						<i class="icon-angle-up"></i>
					</a>
				</div>
			</div>
		</footer>


		<!-- SYSTEM STUFF -->

		{if $config.cron}
			<div style="display: none;">
				<img src="{$nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include file='visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>