$(document).ready(function(){
  $("#vin-submit").on("click", findVin);
})

function findVin(e) {
  e.preventDefault()
  
  searchData = {
    search: {
      vin: $('input[name="vin"]').val()
    }
  }

  $.ajax({
    url: "/api/v1/vin_search",
    method: "POST",
    data: searchData
  })
  .done(showResult)
}

function showResult(response) {
  $('.search-result-placeholder').empty();  
  $('.search-result-placeholder').append(response);
}