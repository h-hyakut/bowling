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
    end

    def total_score
        @total_score
    end

    def add_score(pins)
        @total_score += pins #total_score = total_score+ pins
    end
end


