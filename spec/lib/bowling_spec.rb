require "bowling"


describe "ボウリングのスコア" do #メイン：ボウリングのスコア計算
    before do # describeのdoからendまで毎回実行される
        @game = Bowling.new
    end

    describe "全体の合計" do #サブ:スコア計算の全体の合計
        context "全ての投球がガターだった場合" do #
            it "0になること" do
                add_many_scores(20,0)
                # @game = Bowling.new #instance作成
                # 20.times do
                #     @game.add_score(0) #method
                # end
                @game.calc_score #合計を計算
                expect(@game.total_score).to eq 0 #期待する実際の数値
            end
        end

        context "全ての投球で１ピンずつ倒した場合" do
            it "20になること" do
                add_many_scores(20,1) #重複を減らす：再利用性を高める
                # @game = Bowling.new    #@game:新規インスタンス
                # 20.times do
                #     @game.add_score(1)
                # end
                @game.calc_score
                expect(@game.total_score).to eq 20 #期待する実際の数値
            end 
        end

        context "スペアを取った場合" do
            it "スペアボーナスが加算されること" do
                @game.add_score(3)
                @game.add_score(7)

                @game.add_score(4)
                
                add_many_scores(17,0)

                @game.calc_score

                expect(@game.total_score).to eq 18
            end
        end

        context "フレーム違いでスペアになるようなスコアだった場合" do
            it "スペアボーナスが加算されないこと" do
                #1 
                @game.add_score(3)
                @game.add_score(5)
                #2
                @game.add_score(5)
                @game.add_score(4)

                add_many_scores(16,0)
                
                @game.calc_score
                expect(@game.total_score).to eq 17
            end
        end

        context "最終フレームでスペアを取った場合" do
            it "スペアボーナスが加算されないこと" do
                #1
                @game.add_score(3)
                @game.add_score(7)
                #2
                @game.add_score(4)
                add_many_scores(15,0)
                #
                @game.add_score(3)
                @game.add_score(7)

                @game.calc_score

                expect(@game.total_score).to eq 28
            end
        end
     end
end


private
#複数回のスコア追加をまとめて実行する
def add_many_scores(count, pins)
    count.times do
        @game.add_score(pins)
    end
end

#Ubuntu $ rspec spec/lib/bowling_spec.rb =>テストの実行


# 1. `require "bowling"`: テストで使用する`bowling`モジュールを読み込みます。

# 2. `describe "ボウリングのスコア計算" do`: テストスイートのメインのブロックを開始します。このブロックは、ボウリングのスコア計算に関するテストを含みます。

# 3. `describe "全体の合計" do`: テストスイート内のサブグループとして、ボウリングのスコア計算の全体の合計に関するテストを含むブロックを開始します。

# 4. `context "全ての投球がガターだった場合" do`: テストケースのコンテキストを示します。このコンテキストでは、全ての投球がガターだった場合のテストを含みます。

# 5. `it "0になること" do`: このブロック内のテストケースの説明を提供します。ここでは、全ての投球がガターだった場合のスコアが0になることを検証します。

# 6. `@game = Bowling.new`: `Bowling`クラスの新しいインスタンスを作成し、`@game`インスタンス変数に代入します。

# 7. `20.times do`: 20回の繰り返しを行います。

# 8. `@game.add_score(0)`: `@game`に0を投球のスコアとして追加します。

# 9. `expect(@game.total_score).to eq 0`: 期待される値として、`@game`の合計スコアが0であることを検証します。

# 10. `context "全ての投球で1ピンずつ倒した場合" do`: もう1つのコンテキストを開始し、全ての投球で1ピンずつ倒した場合のテストを含みます。

# 11. `it "20になること" do`: このブロック内のテストケースの説明を提供します。ここでは、全ての投球で1ピンずつ倒した場合のスコアが20になることを検証します。

# 12. `@game = Bowling.new`: 同様に、`Bowling`クラスの新しいインスタンスを作成し、`@game`インスタンス変数に代入します。

# 13. `20.times do`: 20回の繰り返しを行います。

# 14. `@game.add_score(1)`: `@game`に1を投球のスコアとして追加します。

# 15. `expect(@game.total_score).to eq 20`: 期待される値として、`@game`の合計スコアが20であることを検証します。

# 16. 最後の`end`は、すべてのブロックの終了を示します。