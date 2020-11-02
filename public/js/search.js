// alert("Hello");
(function($){
	
	$('input.product-search').on('keyup', function(){
		var  term = $(this).val();
		var search_url = $('#searchbox').attr('action');
		if( term.length > 2 && search_url ){
			$.get(search_url, {keyword: term})
			.then(function(results){ 
				var html_string = "<ul>";
				for(var i in results){

					var item = results[i];
					html_string += '<li><a href="'+item.url+'">'+item.name+'</a></li>';
					 // console.log(html_string);
				}
				html_string += "</ul>";
				 //console.log(html_string);
				$('#search-result').html(html_string)
			})
		}
	})
})(jQuery)