// import AliExpress from ‘aliexpress’

$(function(){

	$('.text-ajax').click(function(){
		console.log("obj");
	});
	
	


	$('.btn-quick-add-to-cart').click(function() {
		var productId = $(this).data('product-id');
		var quantity = 1;

		doAjaxAddToCart(productId, quantity);
	})

	$('.btn-add-to-cart').click(function() {
		var productId = $(this).data('product-id');
		var quantity = $("#AddToCartForm .qty").val();

		doAjaxAddToCart(productId, quantity);
	})

	var doAjaxAddToCart = function(productId, quantity) {
		$.ajax({
			type: "POST",
			url: "/order_lines",
			data: 'order_line[number]=' + quantity + "&order_line[product_id]=" + productId,
			beforeSend: function() {
				showLoading();
			},
			success: function(msg) {
				hideLoading();
				successAddToCart();
			},
			error: function(xhr, text) {
				if(text == 'error' && xhr.responseJSON.status == 422){
					showError(xhr.responseJSON.description);
				}else{
					showError("");
				}
			}
		});
	}

	var successAddToCart = function() {
		showSuccess('Success Add to Cart!');
	}

	var showSuccess = function(text) {
		// $('#alert-success').iziModal('setSubtitle', subTitle);
		$('#alert-success .text').html(text);
		$('#alert-success').show();
	}
	var showError = function(text) {
		console.error(text);
	}

	var showLoading = function() {
		$('#item-loading-v1').show();
	}
	var hideLoading = function() {
		$('#item-loading-v1').hide();
	}   

	if (window.location.pathname == '/aliexpress') {
		$.ajax({
			type: "GET",
			url: "http://localhost:5000",
			dataTpye: 'json',
			headers: {
				"Access-Control-Allow-Origin": "http://localhost:3000",
				'Content-Type':'application/json'
			},
			beforeSend: function(xhr) {
				xhr.overrideMimeType( "text/plain; charset=x-user-defined" );
				showLoading();
			},
			success: function(data) {
				hideLoading();
				successGetAliexpress(data);
			},
			error: function(xhr, text) {
				showError(xhr);
			}
		});
	}

	function successGetAliexpress(data) {
		console.log(data);
	}

	$('#alert-success .close, #alert-error .close').click(function(){
		$('#alert-success, #alert-error').hide();
	})

});

$(function() { engoPriceSlider(); });