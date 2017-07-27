$(document).ready(function(){
  $(".search-result-placeholder").on("click", "#vin-confirm", addToTempGarage);
})

function addToTempGarage(e) {
  e.preventDefault()
  let car = $('.car-result').html()
  $('.temp-garage-placeholder').append("<div class='temp-car'>" + car + "</div>")
  $('.search-result-placeholder').empty()
}