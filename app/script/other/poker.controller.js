// @auth: CY6368

$(function(){

  // 定位
  //var poker = new Poker();

  // 發牌
  $(".m-total").delegate(".js-start-btn", "click", function(e) {
    $(".schedule").width(14*51 + 60);
    $(".m-user .poker").each(function(index) {
      var offset = $(this).offset();
      setTimeout(function(){
        (new Poker(offset.left, offset.top)).init();
      }, index*200);
    });

    // 延迟右侧发牌时间
    setTimeout(function(){
      $(".m-system .poker").each(function(index) {
        if(index > 2) return;
        var offset = $(this).offset();
        setTimeout(function(){
          (new Poker(offset.left, offset.top)).init();
        }, index*200);
      });
    }, 1000);

  });

  // 開牌
  $(".m-total").delegate(".js-end-btn", "click", function(e) {
  });

});