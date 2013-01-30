# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.onload = ->
  validation = $(".new_fare").exValidation(
    firstValidate: true
    rules:
      fare_day: "chkrequired chknumonly chkmin2"
      fare_visiting_company: "chkrequired"
      fare_visiting_purpose: "chkrequired"
      fare_start_station: "chkrequired"
      fare_arrival_station: "chkrequired"
      fare_fare: "chkrequired chknumonly"

    stepValidation: true
    errFocus: true
  )   

jQuery ->
# google乗換案内ボタン
  $("#fare_calculation_button").click ->
    fare_start_station = $("#fare_start_station").val()
    fare_arrival_station = $("#fare_arrival_station").val()
    fare_url = "https://maps.google.co.jp/maps?oi=ja_train&hl=ja&ie=UTF8&f=d&saddr=" + fare_start_station + "&daddr=" + fare_arrival_station
    window.open fare_url, 300, 200
    false

# アクセスした年月を取得して請求月作成のデフォルトを設定する。
  now = new Date()
  thismonth = now.getMonth() + 1
  thisyear = now.getFullYear()
  $("#month_month").val thismonth
  $("#month_year").val thisyear

# jquery uiでの日付入力
  $("#fare_day").datepicker dateFormat: "dd"

# 交通手段によっての領収書の有無切り替え
  $("#fare_vehicle").change(->
    str = $("#fare_vehicle").val()
    if (str is "1") or (str is "3") or (str is "4")
      $("#fare_recipt").val 1  
    else
      $("#fare_recipt").val 0
  ).change()

# google乗換案内からの要素取得テストとの残骸
#  $("#fare_arrival_station").change(->
#    start_str = $("#fare_start_station").val()
#    arrival_str = $(this).val()
#    fare_url = "https://maps.google.co.jp/maps?oi=ja_train&hl=ja&ie=UTF8&f=d&saddr=" + start_str + "&daddr=" + arrival_str
#    $("#fare_calculation_list").load "fare_url #dir_altroutes_body li"
#    $("#start_station_test").text start_str
#  ).change()