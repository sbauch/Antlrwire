$('#notice').html("<%= escape_javascript raw('Primary Page Changed') %>")
$("#pages").html("<%= escape_javascript(render @fan_pages).html_safe %>");