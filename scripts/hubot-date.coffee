# Description:
#   年月日の出力
#
#   実行日時から 指定数値後の年月日を出力します
#
# Commands:
#   today <数値> - 実行時から<数値>日後の年月日を出力
#
# Author:
#   zono244

module.exports = (robot) ->
  robot.respond /today ([-+]?\d+)/i, (msg) ->
    num = parseInt(msg.match[1])
    replyDate(msg, num)

  robot.respond /today\s*$/i, (msg) ->
    replyDate(msg, 0)

replyDate = (msg, num) ->
    now = new Date(Date.now() + num * 24 * 60 * 60 * 1000)
    year = now.getFullYear()
    month = now.getMonth() + 1
    day = now.getDate()
    msg.send year + "/" + month + "/" + day