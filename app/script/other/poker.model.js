// 移动扑克类

function Poker(dPoker, num) {
  this.$rPoker = $('#right-poker');
  this.$dPoker = $(dPoker);
      this.num = num;
     this.left = this.$dPoker.offset().left;
      this.top = this.$dPoker.offset().top;
}

Poker.prototype.init = function(flag) {
  this.createPoker();
  this.movePoker();
  this.removePoker(flag);
};

Poker.prototype.createPoker = function() {
  var that = this;
  that.$pPoker = $('<div id="pos-poker" class="pos-poker poker"></div>');
  that.$rPoker.after(that.$pPoker);
  that.$pPoker.offset(that.$rPoker.offset());
};

Poker.prototype.movePoker = function() {
  var that = this;
  $('.schedule').width($('.schedule').width()-14);
  console.log();
  that.$pPoker.animate({
    left: that.left,
    top: that.top
  });
};

Poker.prototype.removePoker = function(flag) {
  var that = this;
  setTimeout(function(){
    if(flag) {
      that.$dPoker.find('img').attr('src', '../image/poker/tmp/'+that.num+'.jpg');
    }
    that.$pPoker.remove();
  }, 1000);
};