# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require moment

$ ->
  $(".addbutton_activity").click (event) ->
    event.preventDefault()

    $.ajax
      url: '/activity_items.json'
      data: $(@).parent().serialize()
      type: 'POST'
    .done (data, statusText) ->
      console.log "data: ", data


      # Input
      activityTitle = data.activity_item
      activityDate = data.activity_date
      activityStartingTime = data.starting_time
      activityEndingTime = data.ending_time
      if data.activity_color is null
        boardColor = "#EBEBEB"
      else
        boardColor = data.activity_color

      # Calculate time
      dayOfWeek = moment(activityDate).day()
      zeroTime = moment("00:00", "HH:mm")
      activityStartingTime = data.starting_time.slice(11, 16)
      activityEndingTime = data.ending_time.slice(11,16)
      activityStartingTimeParsed = moment(activityStartingTime, "HH:mm")
      activityEndingTimeParsed = moment(activityEndingTime, "HH:mm")
      timeSpan = activityEndingTimeParsed - activityStartingTimeParsed

      # Calculate position
      multiplier = timeSpan / 3600000
      tableCellHeight = parseInt($(".col-2").css("height"))
      boxHeight = multiplier * tableCellHeight * 2
      boxWidth = $(".col-2").css("width")

      if dayOfWeek is 6
        marginLeft = parseInt($(".col-1").css("width"))
      else
        marginLeft = parseInt($(".col-1").css("width")) + parseInt($(".col-2").css("width"))
      marginTop = (activityStartingTimeParsed - zeroTime) * tableCellHeight * 2 / 3600000

      appointDiv = $("<div class='added-appointment'>#{activityTitle}</div>").appendTo(".calendar_body")
      appointDiv.css
        "width": "#{boxWidth}"
        "height": "#{boxHeight}"
        "background-color": "#{boardColor}"
        "position": "absolute"
        "top": "#{marginTop}px"
        "left": "#{marginLeft}px"
        "border-radius": "3%"
        "padding": "2%"
        "opacity": "0.5"
        "font-weight": "bold"

# Temporary JQuery
      # # Get input
      # activityTitle = $(this).parent().find('.board_title input').val()
      # activityDate = $(this).parent().find('.board_date_input').val()
      # activityStartingTime = $(this).parent().find('.board_time_start_input').val()
      # activityEndingTime = $(this).parent().find('.board_time_end_input').val()
      # boardColor = $(this).parent().parent().css("background-color")

      # # Calculate time

      # activityDateParsed = moment(activityDate, "MMM-DD")
      # dayOfWeek = moment(activityDateParsed).day()
      # zeroTime = moment("00:00", "HH:mm")
      # activityStartingTimeParsed = moment(activityStartingTime, "HH:mm")
      # activityEndingTimeParsed = moment(activityEndingTime, "HH:mm")
      # timeSpan = activityEndingTimeParsed - activityStartingTimeParsed


      # # Calculate position
      # multiplier = timeSpan / 3600000
      # tableCellHeight = parseInt($(".col-2").css("height"))
      # boxHeight = multiplier * tableCellHeight * 2
      # boxWidth = $(".col-2").css("width")


      # if dayOfWeek is 6
      #   marginLeft = parseInt($(".col-1").css("width"))
      # else
      #   marginLeft = parseInt($(".col-1").css("width")) + parseInt($(".col-2").css("width"))
      # marginTop = (activityStartingTimeParsed - zeroTime) * tableCellHeight * 2 / 3600000



    #   # Posting
    #   # $("<div class='added-appointment' style='width:#{boxWidth};height:#{boxHeight}px;background-color:#{boardColor};position:absolute;top:#{marginTop}px;left:#{marginLeft}px;border-radius:3%;padding:2%;opacity:0.7;font-weight:bold;'>#{activityTitle}</div>").appendTo(".calendar_body")
    #   appointDiv = $("<div class='added-appointment'>#{activityTitle}</div>").appendTo(".calendar_body")
    #   appointDiv.css
    #     "width": "#{boxWidth}"
    #     "height": "#{boxHeight}"
    #     "background-color": "#{boardColor}"
    #     "position": "absolute"
    #     "top": "#{marginTop}px"
    #     "left": "#{marginLeft}px"
    #     "border-radius": "3%"
    #     "padding": "2%"
    #     "opacity": "0.5"
    #     "font-weight": "bold"

