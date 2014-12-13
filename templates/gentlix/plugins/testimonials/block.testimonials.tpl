{if !empty($block_testimonials)}
	<div class="ia-items block-block_testimonials">
		<div class="row-fluid">
			{foreach $block_testimonials as $one_testimonials}
				<div class="span4">
					<div class="media ia-item ia-item-bordered-bottom">
						<div class="media-body">
							<h4><p class="ia-item-date">{$one_testimonials.name}</p></h4>
							<blockquote>
								<p class="ia-item-body">{$one_testimonials.body|truncate:$config.testimonials_max:"..."}</p>
							</blockquote>
						</div>
					</div>
				</div>
				{if $one_testimonials@iteration == 3}
					{break}
				{/if}
			{/foreach}
		</div>

		<div class="ia-items-panel">
			<a class="btn btn-info btn-mini" href="{$smarty.const.IA_URL}testimonials/">{lang key='read_more'}</a>
			<a class="btn btn-info btn-mini" href="{$smarty.const.IA_URL}testimonials/add/">{lang key='add_yours'}</a>
		</div>
	</div>
{/if}