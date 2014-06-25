// 移动扑克类

function Poker(left, top) {
  this.$rPoker = $("#right-poker");
     this.left = left;
      this.top = top;
}

Poker.prototype.init = function() {
  this.createPoker();
  this.movePoker();
  this.removePoker();
};

Poker.prototype.createPoker = function() {
  var that = this;
  that.$pPoker = $("<div id='pos-poker' class='pos-poker poker'></div>");
  that.$rPoker.after(that.$pPoker);
  that.$pPoker.offset(that.$rPoker.offset());
};

Poker.prototype.movePoker = function() {
  var that = this;
  $(".schedule").width($(".schedule").width()-14);
  console.log();
  that.$pPoker.animate({
    left: that.left,
    top: that.top
  });
};

Poker.prototype.removePoker = function() {
  var that = this;
  setTimeout(function(){
    that.$pPoker.remove();
  }, 1000);
};