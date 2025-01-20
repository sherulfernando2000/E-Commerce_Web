$(document).ready(function () {
    let count = 0;
  
    $("#increase").click(function () {
      count++;
      $("#display").text(count);
    });
  
    $("#decrease").click(function () {
      count--;
      $("#display").text(count);
    });
  });
  