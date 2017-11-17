# -*- coding: utf-8 -*-
class VelocityController < ApplicationController
  def q1_t
    random = Random.new()
    #Aの時速
    array1 = Array(2..5).shuffle
    array1.map!{|x| x * 5}
    @val1 = array1[0]
    #Aが進む距離
    a_distance = random.rand(2..6) * 5
    #Aが進む時間
    @val2 = a_distance * 60 / @val1
    #残りの距離
    rest_distance = 40 - a_distance
    #AB合計速度 ab_v
    #val3はBの時速
    case @val1
    when 10 then
      array2 = [10,15].shuffle
      @val3 = array2[0]
    when 15 then
      array2 = [5,10,15].shuffle
      @val3 = array2[0]
    else
      @val3 = 5
    end
    ab_v = @val1 + @val3
    hour = rest_distance.to_f / ab_v.to_f
    @ans = (hour * 60).to_i
    #選択肢
    mistake1 = (rest_distance.to_f / (array1[1] + @val3) * 60).to_i
    mistake2 = (rest_distance.to_f / (array1[2] + @val3) * 60).to_i
    mistake3 = (rest_distance.to_f / (array1[3] + @val3) * 60).to_i
    @array = [@ans,mistake1,mistake2,mistake3]
  end

  def q2_t
    random = Random.new()
    #貨物の速度
    a = random.rand(1..4)
    b = a+1
    val2_s = a * 18
    #時速
    @val2 = val2_s * 3.6
    #特急の速度
    val1_s = random.rand(b..8) * 18
    #時速
    @val1 = val1_s * 3.6
    #相対速度
    total_v = val1_s - val2_s
    #追い越す秒 答え
    array1 = Array(2..12).shuffle
    @ans = array1[0]
    #列車の長さ合計
    length = @ans * total_v
    ten = length / 10.0
    #特急長さ
    @val3 = (ten * 3).round(2)
    #貨物長さ
    @val4 = length - @val3
    #選択肢
    @array = [@ans,array1[1],array1[2],array1[3]].shuffle
  end

  def q1_k
  end

  def q2_k
    random = Random.new()
    #道のり
    array1 = Array(3..10).shuffle
    array1.map!{|x| x*6}
    @val1 = array1[0]
    val1_m = @val1 * 1000
    #時間
    @val2 = (random.rand(10..20) * 0.1).round(1)
    val2_m = (@val2 * 60).to_i
    #答え
    @ans = val1_m / val2_m
    #選択肢
    mistake1 = (@val1 / @val2).round(1).to_i
    mistake2 = array1[1] * 1000 / val2_m
    mistake3 = array1[2] * 1000 / val2_m
    mistake4 = (12000 / @val2).to_i

    @array = [@ans,mistake1,mistake2,mistake3,mistake4].shuffle
  end

  def q3_k
    random = Random.new()
    #答え 何分後
    array1 = Array(2..5).shuffle
    array1.map!{|x| x*10}
    @ans = array1[0]

    #分速AB
    @val2 = random.rand(12..20) * 5 #Aの分速
    @val3 = random.rand(8..15) * 10 #Bの分速
    #AとB合計分速
    ab = @val2 + @val3
    #距離
    @val1 = (ab * @ans * 0.001).round(1)

    #選択肢
    @array = [@ans, array1[1],array1[2],array1[3]].shuffle
  end
end
