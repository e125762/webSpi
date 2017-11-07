# -*- coding: utf-8 -*-
class SonnekiController < ApplicationController

  def q1_t
    random = Random.new()
    #仕入れ値
    @val1 = random.rand(1..10) * 100
    #定価
    @val2 = @val1 + random.rand(11..20) * 100
    #割引率
    per = Array(1..10).shuffle
    per.map!{|x| x * 5}
    @val3 = per[0]

    @ans = @val2*(1-@val3.to_f/100) - @val1

    #選択肢
    mistake1 = @val2-@val2*(1-@val3.to_f/100)
    mistake2 = @val2*(1-per[2].to_f/100) - @val1
    mistake3 = @val2*(1-per[3].to_f/100) - @val1
    @array = [@ans,mistake1,mistake2,mistake3].uniq

    if @array.count != 4 then
      mistake1 = @val2*(1-per[1].to_f/100) - @val1
      @array.push(mistake1)
    end
    @array.shuffle!
    @array.map!{|x| x.to_i}
    @ans = @ans.to_i
  end

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

  def q3_k
    random = Random.new()
    #仕入れ値
    @val1 = random.rand(1..10) * 500
    #利益率
    profit = Array(1..9).shuffle
    @val2 = profit[0] * 10

    @ans = (@val1 * (profit[0].to_f/10 + 1)).to_i

    #選択肢
    mistake1 = @val1 * (profit[1].to_f/10 + 1)
    mistake2 = @val1 * (profit[2].to_f/10 + 1)
    mistake3 = @val1 * (profit[3].to_f/10 + 1)

    @array = [@ans, mistake1, mistake2, mistake3].shuffle
    @array.map!{|x| x.to_i}
    
  end

end
