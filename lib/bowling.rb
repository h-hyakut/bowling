# class Bowling
#     def initialize 
#         @score = []
#     end

#     def total_score
#         @score.sum

#     def add_score(n)
#         @score << n  
#     end  
# end

class Bowling
    def initialize 
        @total_score = 0
        @scores = []
        @temp = []
    end

    def total_score
        @total_score
    end

    def add_score(pins)
        #@total_score += pins #total_score = total_score+ pins
        @temp << pins
        if @temp.size == 2 || strike?(@temp)
            @scores << @temp #配列は複数形
            @temp = []
        end
    end

    
    #add score
    def add_many_score(pins)
      @temp << pins
      if @temp.size == 2 || strike?(@temp)
        @scores << @temp
        @temp = []
      end
    end
    #score.sum
    def calc_score
        @scores.each.with_index(1) do |score, index| #index:スコアの番号
        #index(1) =>本来は0,1,2...で数えるけど、1から始まるようにする
        if strike?(score) && not_last_frame?(index)
          @total_score += calc_strike_bonus(index)
        # 最終フレーム以外でのスペアなら、スコアにボーナスを含めて合計する
        elsif spare?(score) && not_last_frame?(index)
          @total_score += calc_spare_bonus(index)
          #if (score.inject(:+) == 10) && (index < 10)
          #@total_score += 10 + @score[index].first #[index:番号のみが入っている]
          else
              @total_score += score.inject(:+) #そのframeをそのまま合計に加算
          end
        end
      end         
      
      private
      #strike
      def strike?(score)
        score.first == 10
      end
      
      def calc_strike_bonus(index)
      #ストライク＆次のフレームもストライク（最終フレーム以外）なら、
      #もう一つ次のフレームの一投目をボーナスの対象にする
        if strike?(@scores[index]) && not_last_frame?(index + 1)
          20 + @scores[index + 1].first
        else
          10 + @scores[index].inject(:+)
        end
      end
        
        
      #スペアかどうか判定する
      def spare?(score)
        score.inject(:+) == 10
      end

      def not_last_frame?(index)  #index == num わかりやすい
        index < 10
      end

      def calc_spare_bonus(index)
        10 + @scores[index].first
      end
 end











