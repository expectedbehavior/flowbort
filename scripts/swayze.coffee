# Description:
#   "Some days you just need to start off with Swayze" - Brian Foreman
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot we need some swayze - Display a random Patrick Swayze gif
#
# Author:
#   armilam

images = [
  "http://giphy.com/gifs/patrick-swayze-road-house-kelly-lynch-5k9ntv01OQhMY",
  "http://giphy.com/gifs/patrick-swayze-road-house-kelly-lynch-RxQOX0g1Ibk5O",
  "http://giphy.com/gifs/v22JfwLFi6nNS",
  "http://giphy.com/gifs/N03DjKoHJVjxe",
  "http://giphy.com/gifs/VzP9FmGm1qWxq",
  "http://giphy.com/gifs/patrick-swayze-road-house-kelly-lynch-69OUouHRzrvcA"
]

module.exports = (robot) ->
  robot.hear /patrick swayze.*/i, (msg) ->
    msg.send msg.random images
