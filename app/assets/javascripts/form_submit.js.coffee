$(document).ready ->
  $("#number_form_rails, #number_form_go, #number_form_go_routines")
    .on "ajax:success", (e, data, status, xhr) ->
      $(this).append "
        <div class='form-group'>
          <label class='col-sm-2 control-label'>Sum:</label>
          <p class='col-sm-2'>#{data.result}</p>
        </div>

        <div class='form-group'>
          <label class='col-sm-2 control-label'>Time taken:</label>
          <p class='col-sm-2'>#{data.time}</p>
        </div>
      "
    .on "ajax:error", (e, xhr, status, error) ->
      $(this).append "<p>ERROR</p>"

  start_time = new Date()

  $("#number_form_go_str")
    .on "ajax:beforeSend", (request, settings) ->
      start_time = new Date().getTime()
    .on "ajax:success", (e, data, status, xhr) ->
      $(this).append "
        <div class='form-group'>
          <label class='col-sm-2 control-label'>Sum:</label>
          <p class='col-sm-2'>#{data}</p>
        </div>

        <div class='form-group'>
          <label class='col-sm-2 control-label'>Time taken:</label>
          <p class='col-sm-2'>#{new Date().getTime() - start_time}</p>
        </div>
      "
    .on "ajax:error", (e, xhr, status, error) ->
      $(this).append "<p>ERROR</p>"

  $("#database_form_rails, #database_form_go")
    .on "ajax:success", (e, data, status, xhr) ->
      console.log this, data
      $(this).append "
        <div class='form-group'>
          <label class='col-sm-2 control-label'>Time taken:</label>
          <p class='col-sm-2'>#{data.time}</p>
        </div>
      "
    .on "ajax:error", (e, xhr, status, error) ->
      $(this).append "<p>ERROR</p>"
