# Description:
# BMI指数を表示
#
# 身長と体重から、BMI指数と理想体重表示
#
# Commands:
# bmi height weight - 身長と体重から、BMI指数と理想体重を表示する
#
# Author:
# せきゅあ
module.exports = (robot) ->
  robot.respond /bmi (\d+\.?\d*) (\d+\.?\d*)$/i, (msg) ->
    height = parseFloat(msg.match[1])
    weight = parseFloat(msg.match[2])

    # BMI指数＝体重(kg) ÷ {身長(m) Ｘ 身長(m)}
    bmi = weight * 10000 / (height * height)

    if bmi < 20.0
      comment = "やせぎみです"
    else if bmi < 24
      comment = "ふつうです"
    else if bmi < 26.5
      comment = "太りぎみです"
    else
      comment = "太りすぎです"

    msg.send "あなたのBMIは" + bmi.toFixed(1) + "です．" + comment

    # 理想体重(BMI = 22.0)
    expect_weight = 22.0 * (height * height) / 10000
    msg.send "理想体重は" + expect_weight.toFixed(1) + "kgです"