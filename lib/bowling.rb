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
        @score = []
        @temp = []
    end

    def total_score
        @total_score
    end

    def add_score(pins)
        # @total_score += pins #total_score = total_score+ pins
        @temp << pins
        if @temp.size == 2
            @score << @temp
            @temp = []
        end
    end

    def calc_score
        @score.each.with_index(1) do |score, index| #index:スコアの番号
            # index(1) =>本来は0,1,2...で数えるけど、1から始まるようにする❣
            if spare?(score) && not_last_frame?(index)
                @total_score += calc_space_bonus(index)
                # if (score.inject(:+) == 10) && (index < 10)
            #     @total_score += 10 + @score[index].first #[index:番号のみが入っている]
            else
                @total_score += score.inject(:+) #そのframeをそのまま合計に加算
            end
        end
    end

    private
    #スペアかどうか判定する
    def spare?(score)
        score.inject(:+) == 10
    end

    def not_last_frame?(index)  #index == num わかりやすい
        index < 10
    end

    def calc_score_bonus(index)
        10 + @score[index].first
    end
 end











