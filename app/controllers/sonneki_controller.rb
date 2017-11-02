# -*- coding: utf-8 -*-
class SonnekiController < ApplicationController

  def q1_k
    array = ["仕入値","定価","利益"]
    array.shuffle!
    @val1 = array[0]
    @val2 = array[1]
    @val3 = array[2]
  end

  def q2_k
    random = Random.new()
    #仕入れ値
    @val1 = random.rand(1..10) * 100
    #一個あたりの利益
    one_profit = random.rand(2..20) * 50
    #個数
    @val2 = random.rand(1..9) * 10
    #合計利益
    @val3 = one_profit * @val2
    #定価(答え)
    @ans = @val1 + one_profit

    #選択肢
    mistake1 = @ans + 300
    mistake2 = @ans + 500
    mistake3 = @val1 * 2
    @array = [@ans, mistake1, mistake2, mistake3].uniq
    num = 50
    while @array.count != 4 do
      @array.push(@ans + num)
      num += 50
    end
    @array.shuffle!
  end


end
