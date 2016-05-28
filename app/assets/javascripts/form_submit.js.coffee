$(document).ready ->
  $("#pi_form")
  .on "ajax:success", (e, data, status, xhr) ->
    console.log $(this)
    $(this).append "
      <div class='form-group'>
        <label class='col-sm-2 control-label'>Iterations:</label>
        <p class='col-sm-2'>#{data.result.iterations}</p>
      </div>

      <div class='form-group'>
        <label class='col-sm-2 control-label'>Result PI number:</label>
        <p class='col-sm-2'>#{data.result.result_pi}</p>
      </div>

      <div class='form-group'>
        <label class='col-sm-2 control-label'>Time taken:</label>
        <p class='col-sm-2'>#{data.time}</p>
      </div>
    "
  .on "ajax:error", (e, xhr, status, error) ->
    $(this).append "<p>ERROR</p>"


$(document).ready ->
  $("#database_form")
  .on "ajax:success", (e, data, status, xhr) ->
    $(this).append "
      <div class='form-group'>
        <label class='col-sm-2 control-label'>Time taken:</label>
        <p class='col-sm-2'>#{data.time}</p>
      </div>
    "
  .on "ajax:error", (e, xhr, status, error) ->
    $(this).append "<p>ERROR</p>"
