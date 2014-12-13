{if isset($block_blog_entries) && $block_blog_entries}
	<div class="ia-items new-blog-posts">
	{foreach $block_blog_entries as $one_blog_entry}
		<div class="media ia-item ia-item-bordered-bottom">
			{if $one_blog_entry.image}
				<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" class="media-object pull-left">{printImage imgfile=$one_blog_entry.image width='60' title=$one_blog_entry.title}</a>
			{/if}
			<div class="media-body">
				<h5 class="media-heading">
					<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}">{$one_blog_entry.title}</a>
				</h5>
				<p class="ia-item-date">{$one_blog_entry.date_added|date_format:$config.date_format}</p>
				<p class="ia-item-body">{$one_blog_entry.body|strip_tags|truncate:50:'...'}</p>
			</div>
		</div>

		{if $one_blog_entry@iteration == $config.blog_number_new_block}
			{break}
		{/if}
	{/foreach}
	</div>

	<p>
		<a href="{$smarty.const.IA_URL}blog/">{lang key='view_all_blog_entries'}</a>
	</p>
{else}
	<div class="alert alert-info">{lang key='no_blog_entries'}</div>
{/if}