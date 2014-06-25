// @auth: CY6368

$(function(){

  // 定位
  //var poker = new Poker();

  // 發牌
  $('.m-total').delegate('.js-start-btn', 'click', function(e) {

    $('.schedule').width(14*51 + 60);

    $('.poker').find("img").remove();
    $('.poker').append('<img class="poker-image" />');
    $('.js-open-btn').show();

      $('.m-user .poker').each(function(index) {
        var that = this;
        setTimeout(function(){
          (new Poker(that, 2)).init(true);
        }, index*200);
      });

    // 延迟右侧发牌时间
    setTimeout(function(){
      $('.m-system .poker').each(function(index) {
        var that = this;
        setTimeout(function(){
          var flag = index > 1 ? false : true;
          (new Poker(that, 1)).init(flag);
        }, index*200);
      });
    }, 1000);

  });

  $('.m-user').delegate('.js-reset-btn', 'click', function(e) {
    var that = $(this).siblings(".poker");
    (new Poker(that, 1)).init(true);
  });

  $('.m-system').delegate('.js-open-btn', 'click', function(e) {
    $(this).siblings(".poker").find('img').attr('src','../image/poker/tmp/'+1+'.jpg');
    $(this).hide();
  });

  // 開牌
  $('.m-total').delegate('.js-end-btn', 'click', function(e) {
    $(".js-open-btn").click();
  });

});