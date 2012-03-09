$('<%= escape_javascript(render(:partial => @fan_page)) %>')
.prependTo('#pages')
$('#new_fan_page')[0].reset()
$('#notice').html("<%= escape_javascript raw('Page Added') %>")
$('#alert').html("<%= escape_javascript raw('') %>");