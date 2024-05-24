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

#     @game = Bowling.new
# #インスタンス変数に代入＝インスタンスを生成

#     20.times do
#     @game.add_score(1)
#     end

#     @game.total_score == 20    #testで書いた数値を用いて正常に動くかどうか

# はい、正解です！`@game.add_score(1)` の呼び出しは、`Bowling` クラスのインスタンスである `@game` の `add_score` メソッドを呼び出しています。
# 具体的には、次のように動作します：
# 1. `Bowling.new` を呼び出すことで、Bowlingクラスの新しいインスタンス @gameが生成されます。
# 2. `20.times do ... end` のループ内で、`@game.add_score(1)` を20回繰り返します。
# 3. `add_score`メソッドは、`@total_score` に引数 `pins` を加えるためのものです。このメソッドは `Bowling` クラス内で定義されており、インスタンス変数 `@total_score` を操作します。

# つまり、`@game.add_score(1)` の呼び出しは、`Bowling` クラスのインスタンスである `@game` の `add_score` メソッドを呼び出し、その中で `@total_score` を更新します。

