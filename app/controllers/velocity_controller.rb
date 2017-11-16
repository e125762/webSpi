# -*- coding: utf-8 -*-
class VelocityController < ApplicationController
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
end
