# Description:
#   tell people to do pushups on a regular basis

module.exports = (robot) ->

  workoutReminderIntervalId = null

  robot.respond /GET PUMPED( BROS?)?( \d+)?$/, (msg) ->
    unless msg.match[2]
      return msg.send('Usage: "GET PUMPED <reps>"')

    inTargetHours = () ->
      startHour = 8
      endHour = 18
      timezoneOffset = -4
      currentHour = (new Date()).getUTCHours()
      startHour <= (currentHour + timezoneOffset) <= endHour

    unless inTargetHours()
      return msg.send('Try tomorrow!\nThis will only prompt people to work out during work hours.')

    repCount = msg.match[2].trim()
    robot.brain.set("workout:repCount", repCount)
    msg.send("WORKOUT TIMER STARTED\nDo some pushups RIGHT NOW for a BROnus")

    intervalAmount = 1000 * 60 * 60 # 1 hour
    workoutReminderIntervalId = setInterval () ->
      unless inTargetHours()
        clearInterval(workoutReminderIntervalId)
        return msg.send("Workout done for today! Good work, bros!")

      repCount = robot.brain.get("workout:repCount")
      msg.send("Do #{repCount} pushups!")
    , intervalAmount
