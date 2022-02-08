$(function(){

    $('.left .left_tap ul li').click(function () {
        var num = $(this).index();
        $(this).addClass('on').siblings().removeClass('on');
        $('.left .left_con .left_list').eq(num).show().siblings().hide();
    });
    $('.left .left_con .left_list:gt(0)').hide();

    $('.right .right_tap ul li').click(function () {
        var num = $(this).index();
        $(this).addClass('on').siblings().removeClass('on');
        $('.right .right_con .right_list').eq(num).show().siblings().hide();
    });
    $('.right .right_con .right_list:gt(0)').hide();
    
});