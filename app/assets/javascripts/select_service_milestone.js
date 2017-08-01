$(document).ready(function(){
  $(".milestone-select").bind("change", redirectToServiceMilestone); 
})

function redirectToServiceMilestone() {
  let url = "/service_milestones/" + $(this).val();
  document.location.href = url;
}