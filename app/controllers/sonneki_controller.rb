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
    @sell = (@val2*(1-@val3.to_f/100)).to_i
    @ans = @sell - @val1

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

  def q2_t
    random = Random.new()
    #原価
    array1 = Array(1..12).shuffle
    array1.map!{|x| x * 100}
    @ans = array1[0]
    #原価の何%の利益か
    num_per = random.rand(1..5)
    @val2 = num_per * 10
    @val2_f = (num_per * 0.1).round(2)
    @prof_per = (@val2_f + 1).round(2)
    #売値
    @price = (@ans * @prof_per).round(1).to_i
    #割引率 val1
    array2 = Array(1..6).shuffle
    array2.map!{|x| (x * 0.1).round(2)}
    #定価を求める(余りなし) val3
    flag = false
    array2.each{|var|
      if @price % var == 0 then
        flag = true
        @val3 = (@price / var).to_i
        @val1 = (var * 100).to_i
        @val1_f = var
        break
      end
    }
    if !flag
      @var1 = 30
      @var1_f = 0.3
      @var2 = 20
      @var2_f = 0.2
      @price = 1008
      @var3 = 1440
      @ans = 940
    end
    #選択肢
    @array = [@ans,array1[1],array1[2],array1[3]].shuffle

  end

  def q3_t
    #原価
    random = Random.new()
    @val1 = random.rand(1..10) * 100
    #仕入れ個数
    @val2 = random.rand(2..6) * 100
    #利益
    profit = random.rand(1..5)
    @val3 = profit * 10
    #売った個数
    if rand(2).zero? then
      @val4 = @val2 / 2 + 50
    else
      @val4 = @val2 / 2 - 50
    end
    #残り
    @val5 = @val2 - @val4
    #定価
    @price = (@val1 * (1 + profit.to_f * 0.1)).to_i
    #残りの割引率
    val6_num = random.rand(1..6)
    @val6 = val6_num * 10
    #仕入れ値の総額
    @all_cost = @val1 * @val2
    #定価での売上
    sell = @price * @val4
    #割引売値
    @discount = (@price * (1 - (val6_num.to_f * 0.1).round(2))).to_i
    #総売上
    @all_sell = sell + @discount.to_i * @val5
    #総利益
    @all_profit = @all_sell - @all_cost
    #答え
    if @all_profit < 0 then
      @ans = "#{@all_profit.abs}円の損失"
      mistake2 = "#{@all_profit.abs}円の利益"
      mistake1 = "損益なし"
      mis_num = @all_profit.abs + 1000
    elsif @all_profit > 0 then
      @ans = "#{@all_profit}円の利益"
      mistake2 = "#{@all_profit}円の損失"
      mistake1 = "損益なし"
      mis_num = @all_profit + 1000
    else
      @ans = "損益なし"
      mistake2 = "10000円の損失"
      mistake1 = "10000円の利益"
      mis_num = 2500
    end
    #選択肢

    mistake3 = "#{@all_sell}円の利益"
    mistake4 = "#{@all_sell}円の損失"
    mistake5 = "#{mis_num}円の利益"
    mistake6 = "#{mis_num}円の損失"
    @array = [@ans,mistake1,mistake2,mistake3,mistake4,mistake5,mistake6].shuffle
  end

  def q1_k
    @ans = "定価=仕入れ値+利益"
    mistake1 = "仕入れ値=利益+定価"
    mistake2 = "利益=仕入れ値+定価"
    @array = [@ans,mistake1,mistake2].shuffle
  end

  def q2_k
    random = Random.new()
    #仕入れ値
    @val1 = random.rand(1..10) * 100
    #一個あたりの利益
    @one_profit = random.rand(2..20) * 50
    #個数
    @val2 = random.rand(1..9) * 10
    #合計利益
    @val3 = @one_profit * @val2
    #定価(答え)
    @ans = @val1 + @one_profit

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
    @val2_f = (profit[0].to_f/10).round(2)
    @ans = (@val1 * (profit[0].to_f/10 + 1)).to_i

    #選択肢
    mistake1 = @val1 * (profit[1].to_f/10 + 1)
    mistake2 = @val1 * (profit[2].to_f/10 + 1)
    mistake3 = @val1 * (profit[3].to_f/10 + 1)

    @array = [@ans, mistake1, mistake2, mistake3].shuffle
    @array.map!{|x| x.to_i}
    
  end

end
