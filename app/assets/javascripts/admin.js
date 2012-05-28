$(document).ready(function() {
  // Activate Best In Place editing
  jQuery('.best_in_place').best_in_place();
  
  //Find current authentication type to determine which sections to show/hide
  var current_authentication_type = $("[data-setting='external_authentication_type']").text().toLowerCase();
  showHideAuthentications(current_authentication_type);
  
  //Find current mail delivery method to determine which sections to show/hide
  var current_delivery_method = $("[data-setting='action_mailer_delivery_method']").text().toLowerCase();
  showHideDeliveryMethods(current_delivery_method);
  
  // Link sections based on callback from best_in_place
  $('.best_in_place').bind('ajax:success', function(data) {
    if ($(this).data('setting') == "external_authentication_type"){
      var type = $(this).text().toLowerCase();
      showHideAuthentications(type);
    }
    if ($(this).data('setting') == "action_mailer_delivery_method"){
      var method = $(this).text().toLowerCase();
      showHideDeliveryMethods(method);
    }
  });
  
});

function showHideAuthentications(current) {
  if (current == "cas"){
    $('#cas_authentication').show('blind', { direction: "vertical" });
    $('#ldap_authentication').hide();
  } else if (current == "ldap") {
    $('#cas_authentication').hide();
    $('#ldap_authentication').show('blind', { direction: "vertical" });
  } else {
    $('#cas_authentication').hide();
    $('#ldap_authentication').hide();
  }
}

function showHideDeliveryMethods(current) {
  if (current == "smtp"){
    $('#smtp').show('blind', { direction: "vertical" });
    $('#sendmail').hide();
  } else if (current == "sendmail") {
    $('#smtp').hide();
    $('#sendmail').show('blind', { direction: "vertical" });
  } else {
    $('#smtp').hide();
    $('#sendmail').hide();
  }
}