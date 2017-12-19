$(function(){

	$('.text-ajax').click(function(){
		console.log("obj");
	});

	$('.action.add-to-cart').click(function(){
		var productId = $(this).data('product-id');
		var quantity  = $("#AddToCartForm .qty").val();

		console.log(productId);
	});	

});

$(function() { engoPriceSlider(); });