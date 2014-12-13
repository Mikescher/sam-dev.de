{if isset($top_categories)}
	<div class="row">
		{foreach $top_categories as $top_category}
			<div class="span3">
				<a href="{ia_url type='url' item='articlecats' data=$top_category}"{if $top_category.nofollow == '1'} rel="nofollow"{/if}>{$top_category.title}</a> <span class="label">{$top_category.num}</span>
			</div>

			{if $top_category@iteration % 4 == 0}
				</div>
				<div class="row">
			{/if}
		{/foreach}
	</div>
{/if}