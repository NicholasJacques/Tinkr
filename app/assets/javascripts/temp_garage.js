$(document).ready(function(){
  $(".search-result-placeholder").on("click", "#vin-confirm", addToTempGarage); 
})

function addToTempGarage(e) {
  e.preventDefault();
  let id = $('.car-result').attr('id');
  let car = $('.car-result').html();
  $('.temp-garage-placeholder').append("<div class='temp-car' data-vin=" + id + ">" + car + "</div>");
  $('.search-result-placeholder').empty();
  showDoneAddingCarsButton();
}

function showDoneAddingCarsButton() {
  $('.done-container').show();
}