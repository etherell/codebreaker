require "spec_helper"

module Codebreaker
  RSpec.describe Game do
    let(:game) { Game.new }

    context "when game start" do
      before(:each) { game.start }

      it "saves secret code" do
        expect(game.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it "saves 4 numbers secret code" do
        expect(game.instance_variable_get(:@secret_code).size).to eq(4)
      end

      it "saves secret code with numbers from 1 to 6" do
        expect(game.instance_variable_get(:@secret_code)).to match(/[1-6]+/)
      end
    end

    context "with valid input" do
      let(:input) { "1234" }
      let(:secret_code) { "1433" }

      before(:each) do
        game.instance_variable_set(:@secret_code, secret_code)
        game.instance_variable_set(:@input, input)
        game.check_input_number
      end

      it "has one partial and two complete matched number" do
        expect(game.result).to eq(%w[+ + -])
      end

      it "deleted from input matched numbers" do
        expect(game.instance_variable_get(:@input).length).to eq(1)
      end
    end

    describe "#give_hint" do
      let(:secret_code) { "1433" }
      before(:each) { game.instance_variable_set(:@secret_code, secret_code) }

      it "returns random number from secret number" do
        expect(game.instance_variable_get(:@secret_code)).to include(game.give_hint.to_s)
      end

      it "returns only one number" do
        expect(game.give_hint.to_s.length).to eq(1)
      end
    end

    describe "#win" do
      before(:each) do
        game.instance_variable_set(:@secret_code, secret_code)
        game.instance_variable_set(:@input, input)
        game.check_input_number
      end

      subject(:player_win?) { game.win? }
      let(:win_result) { %w[+ + + +] }
      let(:secret_code) { "1234" }

      context "when player wins" do
        let(:input) { "1234" }
  
        it { expect(player_win?).to be_truthy }

        it "returns array with all complete values" do
          expect(game.result).to eq(win_result)
        end
      end

      context "when player loose" do
        let(:input) { "1235" }

        it { expect(player_win?).to be_falsey }

        it "returns array with all complete values" do
          expect(game.result).to_not eq(win_result)
        end
      end
    end
  end
end
