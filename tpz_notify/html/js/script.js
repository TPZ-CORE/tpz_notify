

function CloseNotificationDisplay() {

	$(".notify").fadeOut(500);

    $.post("http://tpz_notify/close", JSON.stringify({}));
}

document.addEventListener('DOMContentLoaded', function() {
	displayPage("notify", "visible");
	$(".notify").fadeOut();

}, false);

$(function() {
	window.addEventListener('message', function(event) {
		var item = event.data;

		if (item.type == "enable_ui") {

			document.body.style.display = item.enable ? "block" : "none";

			if (!item.enable){
				return
			}

			const image = 'img/types/' + item.actionType + '.png';

			load(image).then(() => {

				$('#notify_action_image_display').css('background-image', `url(${image})`);

				$("#notify_title").text(item.title);
				$("#notify_message").text(item.message);

				$("#notify_message").css("color", item.color);

				if (item.align == 'left') {
					
					$(".notify").css('margin-left', '-48vw');

					$("#notify_title").css('margin-left', '6vw');
					$("#notify_message").css('margin-left', '6vw');
					$("#notify_action_image_display").css('margin-left', '1.5vw');

				}else if (item.align == 'right'){
					$(".notify").css('margin-left', '74vw');
				}

				$(".notify").fadeIn(500);
	
			});

		}

		else if (item.action == 'close'){
			CloseNotificationDisplay();
		}

	});

});

/* The following function is used to load the image first before displaying for avoiding any kind of glitches. */
function load(src) {
	return new Promise((resolve, reject) => {
		const image = new Image();
		image.addEventListener('load', resolve);
		image.addEventListener('error', reject);
		image.src = src;
	});
}

function displayPage(page, cb){
	document.getElementsByClassName(page)[0].style.visibility = cb;
  
	[].forEach.call(document.querySelectorAll('.' + page), function (el) {
	  el.style.visibility = cb;
	});
}
  
