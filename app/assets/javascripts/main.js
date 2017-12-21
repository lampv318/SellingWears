$(function(){

	$('.text-ajax').click(function(){
		console.log("obj");
	});

	$('.action.add-to-cart').click(function(){
		var productId = $(this).data('product-id');
		var quantity  = $("#AddToCartForm .qty").val();

		console.log(productId);
	});	

	$('.action.add-to-cart').click(function() {
		var productId = $(this).data('product-id');
		var quantity = $('#AddToCartForm .quantity .qty').val();
		
		$.ajax({
			type: "POST",
			url: "/order_line",
			data: 'number=' + quantity + "&product_id=" + productId,
			dataType: 'json',
			beforeSend: function() {
				// ShowLoading();
			},
			success: function(msg) {
				HideLoading();
				$('.canvas-menu-toggle.sn-back-to-top i').animate({fontSize: '160%'},400).animate({fontSize: '100%'},500);
				resetCart(showCart);
			},
			error: function(xhr, text) {
				if(text == 'error' && xhr.responseJSON.status == 422){
					AlertError(xhr.responseJSON.description);
				}else{
					AlertError("");
				}
			}
		});
	})

});

$(function() { engoPriceSlider(); });