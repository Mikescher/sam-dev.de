$(document).ready(function($)
{
	if($('.sticky-navbar').length) {
		var $window = $(window),
			$navbar = $('.navigation'),
			$inventory = $('.inventory'),
			navbarHeight = $navbar.outerHeight(),
			navbarPos = $navbar.position();

		$window.scroll(function () {
			if($window.scrollTop() >= (navbarPos.top + navbarHeight)) {
				$navbar.addClass('navigation-sticky');
				$inventory.css('margin-bottom', navbarHeight);
			} else {
				$navbar.removeClass('navigation-sticky');
				$inventory.removeAttr('style');
			}
		});	
	}

	$('.nav-toggle').on('click', function(e)
	{
		e.preventDefault();
	});

	$('.m_login .dropdown-menu, .m_login .dropdown-menu input, .m_login .dropdown-menu label, .m_login .dropdown-menu a').click(function(e)
	{
		e.stopPropagation();
	});

	// back to top button
	var scroll_timer,
		displayed = false,
		$message = $('#backToTop'),
		$window = $(window),
		top = $(document.body).children(0).position().top;

	$window.scroll(function () {
		window.clearTimeout(scroll_timer);
		scroll_timer = window.setTimeout(function () {
			if($window.scrollTop() <= top)
			{
				displayed = false;
				$message.fadeOut(500);
			}
			else if(displayed == false)
			{
				displayed = true;
				$message.stop(true, true).show().click(function () { $message.fadeOut(500); });
			}
		}, 100);
	});

	$('a', $message).click(function () {
		$('html, body').animate({scrollTop:0}, 'fast');
		return false;
	});
});