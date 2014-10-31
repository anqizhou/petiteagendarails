# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require moment

$ ->
  $(".addbutton_task").click (event) ->
    event.preventDefault()

    # $.ajax
    #   url: '/jfow.json'
    # .done (data, status) ->
    #   if status is 201
    # Get input
    taskTitle = $(this).parent().find('.board_title input').val()
    taskDate = $(this).parent().find('.date_input').val()
    boardColor = $(this).parent().parent().css("background-color")
    debugger
    # Calculate time
    taskDateParsed = moment(taskDate, "MMM-DD")
    dayOfWeek = moment(taskDateParsed).day()



    # # Calculate position
    # multiplier = timeSpan / 3600000
    tableCellHeight = parseInt($(".col-2").css("height"))/2
    # boxHeight = multiplier * tableCellHeight * 2
    boxWidth = $("#task-col-2").css("width")
    # Need to do an if statement for saturday or sunday for the margin Left value

    # Posting
    if dayOfWeek is 6
       $("<div class='added-task' style='width:#{boxWidth};height:#{tableCellHeight}px;background-color:#{boardColor};'>#{taskTitle}</div>").prependTo("#task-col-2")
    else
       $("<div class='added-task' style='width:#{boxWidth};height:#{tableCellHeight}px;background-color:#{boardColor};'>#{taskTitle}</div>").prependTo("#task-col-3")




