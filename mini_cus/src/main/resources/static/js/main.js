$(function(){	
	/*$('.left .left_tap ul li').click(function () {
		var num = $(this).index();
		$(this).addClass('on').siblings().removeClass('on');
		$('.left .left_con .left_list').eq(num).show().siblings().hide();
		console.log(num);
	});
	$('.left .left_con .left_list:gt(0)').hide();*/
	
	$(".login_btn").click(function(){
		$(".login_pop").stop().show();
		$(".pop_bg").stop().show();
	});
	
	$(".login_close").click(function(){
		$(".login_pop").stop().hide();
		$(".pop_bg").stop().hide();
	});
});