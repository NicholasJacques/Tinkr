$(document).ready(function(){
  $(".done-container").on("click", "#account-setup-submit", submitGarage); 
})

function submitGarage(e) {
  e.preventDefault()
  let vins = []

  $('.temp-car').each(function() {
    vins.push($(this).data('vin'))
  })

  saveCars(vins)
}

function saveCars(vins) {
  let cars = {
    cars: vins
  }

  $.ajax({
    url: '/api/v1/garage',
    method: "POST",
    data: cars
  }).done(checkResponse)
}

function checkResponse(response) {
  if (response.status = 200) {
    var redirect = '/garage';
    document.location.href = redirect;
  } else {
    console.log(response);
  }

}