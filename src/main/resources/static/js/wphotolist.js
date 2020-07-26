$(function() {
   $(".photolist>.list").each(function() {
      $(this).lightGallery();
   });
   $(".photolist .mgal").click(function() {
      //alert($(this).prev().html());
      //$(this).prev().data('lightGallery').slide(0);
      $(this).prev().find("a").eq(0).click();
   });
});