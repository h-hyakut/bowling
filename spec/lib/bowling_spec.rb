require "bowling"

describe "ボウリングのスコア計算" do #メイン：ボウリングのスコア計算
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

    describe "フレームごとの合計" do #2.4.5-2
        context "全ての投球で1ピンずつ倒した場合" do
            it "1フレーム目の合計が2になること" do
                add_many_scores(20, 1)
                # 合計を計算
                @game.calc_score
                expect(@game.frame_score(1)).to eq 2
            end
          end

        context "スペアを取った場合" do
            it "スペアボーナスが加算されること" do
              # 第一フレームで3点, 7点のスペア
                @game.add_score(3)
                @game.add_score(7)
                  # 第二フレームの一投目で4点
                @game.add_score(4)
                  # 以降は全てガター
                  add_many_scores(17, 0)
                  # 合計を計算
                @game.calc_score
                  # 期待する合計　※()内はボーナス点
                  # 3 + 7 + (4) = 14
              expect(@game.frame_score(1)).to eq 14
            end
          end
            
        context "ストライクを取った場合" do #2.4.5-2
            it "ストライクボーナスが加算されること" do
                # 第一フレームでストライク
              @game.add_score(10)
                      # 第二フレームで5点, 4点
              @game.add_score(5)
              @game.add_score(4)
                      # 以降は全てガター
                      add_many_scores(16, 0)
                      # 合計を計算
                @game.calc_score
                      # 期待する合計　※()内はボーナス点
                      # 10 + (5) + (4) = 19
                expect(@game.frame_score(1)).to eq 19
              end
            end
          end

    describe "フレームごとの合計" do
        context "全ての投球で１ピンずつ倒した場合" do
          it "20になること" do
            add_many_scores(20,1) #重複を減らす：再利用性を高める
                # @game = Bowling.new    #@game:新規インスタンス
                # 20.times do
                #     @game.add_score(1)
                # end
            @game.calc_score #sum
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

        context "ストライクを取った場合" do
          it "ストライクボーナスが加算されること" do
            @game.add_score(10)

            @game.add_score(5) 
            @game.add_score(4)

            add_many_scores(16,0)

            @game.calc_score
                #10+ \ +5+(5) + 4+(4)
            expect(@game.total_score).to eq 28
          end
        end

        context "ダブルを取った場合" do
          it "それぞれのストライクボーナスが加算されること" do
            @game.add_score(10)

            @game.add_score(10)

            @game.add_score(5) 
            @game.add_score(4)
                
            add_many_scores(14,0)

            @game.calc_score
                #10+ 10+(10) +5+(5) +(5) + 4+(4)
            expect(@game.total_score).to eq 53
          end
        end

        context "ターキーを取った場合" do
          it "それぞれのストライクボーナスが加算されること" do
                @game.add_score(10)

                @game.add_score(10)

                @game.add_score(10)

                @game.add_score(5) 
                @game.add_score(4)
                
                add_many_scores(12,0)   

            @game.calc_score
                # 10 + 10 +(10) + 10+(10)+(10) +5+(5)+(5) + 4+(4) = 83
            expect(@game.total_score).to eq 83
            end
          end

        context "最終フレームでストライクを取った場合" do
          it "ストライクボーナスが加算されないこと" do
                @game.add_score(10)

                @game.add_score(5) 
                @game.add_score(4)
                
                add_many_scores(14,0)
                
                @game.add_score(10)

                @game.calc_score
                ## 10 + 10 + (10) + 10 + (10 + 10) + 5 +(5 + 5) + 4 + (4) = 83
            expect(@game.total_score).to eq 38
          end
        end
    end 
  end

         

    private #複数回のスコア追加をまとめて実行する
    def add_many_scores(count, pins)
      count.times do
      @game.add_score(pins)
    end
  end
end


#Ubuntu $ rspec spec/lib/bowling_spec.rb =>テストの実行

