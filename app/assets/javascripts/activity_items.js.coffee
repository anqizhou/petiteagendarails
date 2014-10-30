# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require moment

$ ->
  $(".addbutton_activity").click (event) ->
    event.preventDefault()

    # $.ajax
    #   url: '/jfow.json'
    # .done (data, status) ->
    #   if status is 201

    # Get input
    activityTitle = $(this).parent().find('.board_title input').val()
    activityStartingTime = $(this).parent().find('.board_time_start_input').val()
    activityEndingTime = $(this).parent().find('.board_time_end_input').val()
    boardColor = $(this).parent().parent().css("background-color")


    # Calculate time
    zeroTime = moment("00:00", "HH:mm")
    activityStartingTimeParsed = moment(activityStartingTime, "HH:mm")
    activityEndingTimeParsed = moment(activityEndingTime, "HH:mm")
    timeSpan = activityEndingTimeParsed - activityStartingTimeParsed


    # Calculate position
    multiplier = timeSpan / 3600000
    tableCellHeight = parseInt($(".col-2").css("height"))
    boxHeight = multiplier * tableCellHeight * 2
    boxWidth = $(".col-2").css("width")
    # Need to do an if statement for saturday or sunday for the margin Left value
    marginLeft = $(".col-1").css("width")
    marginTop = (activityStartingTimeParsed - zeroTime) * tableCellHeight * 2 / 3600000



    # Posting
    $("<div class='added-appointment' style='width:#{boxWidth};height:#{boxHeight}px;background-color:#{boardColor};position:absolute;top:#{marginTop}px;left:#{marginLeft};border-radius:3%;padding:2%;opacity:0.7;font-weight:bold;'>#{activityTitle}</div>").appendTo(".calendar_body")
      # $(this).css({
      #   "width": "#{boxWidth}",
      #   "height": "#{boxHeight}",
      #   "background-color": "#{boardColor}",
      #   "position": "absolute",
      #   "top": "#{marginTop}",
      #   "left": "{marginLeft}",
      #   "border-radius": "3%",
      #   "padding": "2%",
      #   "opacity": "0.5",
      #   "font-weight": "bold",
      # })
