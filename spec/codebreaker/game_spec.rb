require 'spec_helper'

module Codebreaker
  RSpec.describe Game do
    let(:game_statistic_double) { instance_double('GameStatistic') }
    let(:game) { described_class.new(game_statistic_double) }

    before do
      allow(game_statistic_double).to receive(:secret_number=)
      allow(game_statistic_double).to receive(:attempts_used).and_return(0)
      allow(game_statistic_double).to receive(:attempts_used=)
      allow(game_statistic_double).to receive(:attempts_left).and_return(0)
    end

    describe '#initialize' do
      context 'when game starts it initializes with secret number' do
        subject(:game_secret_number) { game.secret_number }

        let(:secret_number) { '6616' }

        it 'has secret number' do
          allow_any_instance_of(described_class).to receive(:generate_secret_number).and_return(secret_number)
          expect(game_secret_number).to eq(secret_number)
        end

        it 'has valid secret number length' do
          expect(game_secret_number.length).to eq(4)
        end

        it 'has valid secret number digits' do
          game_secret_number.chars.each do |digit|
            expect(digit.to_i).to be_between(1, 6)
          end
        end
      end
    end

    describe '#player_number=' do
      subject(:set_player_number) { game.player_number = new_player_number }

      let(:new_player_number) { '1234' }
      let(:result) { '----' }

      before do
        game.instance_variable_set(:@result, result)
      end

      context 'when player number set' do
        it 'changes game player_number' do
          expect { set_player_number }.to change { game.instance_variable_get(:@player_number) }
        end

        it 'sets appropriate player_number' do
          set_player_number
          expect(game.instance_variable_get(:@player_number)).to eq(new_player_number)
        end

        it 'clears result' do
          expect { set_player_number }.to change { game.instance_variable_get(:@result) }.from(result).to('')
        end
      end
    end

    describe '#win?' do
      subject(:player_win?) { game.win? }

      before { game.instance_variable_set(:@result, result) }

      context 'when player wins' do
        let(:result) { '++++' }

        it { expect(player_win?).to be_truthy }
      end

      context 'when player loose' do
        let(:result) { '--' }

        it { expect(player_win?).to be_falsey }
      end
    end

    describe '#result' do
      subject(:game_result) { game.result }

      context 'when have some result' do
        [
          { secret_number: '6543', input: '5643', result: '++--' },
          { secret_number: '6543', input: '6411', result: '+-' },
          { secret_number: '6543', input: '6544', result: '+++' },
          { secret_number: '6543', input: '3456', result: '----' },
          { secret_number: '6543', input: '6666', result: '+' },
          { secret_number: '6543', input: '2666', result: '-' },
          { secret_number: '6543', input: '2222', result: '' },
          { secret_number: '6666', input: '1661', result: '++' },
          { secret_number: '1234', input: '3124', result: '+---' },
          { secret_number: '1234', input: '1524', result: '++-' },
          { secret_number: '1234', input: '1234', result: '++++' }
        ].each do |line|
          it "returns #{line[:result]} when secret number - #{line[:secret_number]} and input - #{line[:input]}" do
            game.instance_variable_set(:@secret_number, line[:secret_number])
            game.instance_variable_set(:@player_number, line[:input])
            expect(game_result).to eq(line[:result])
          end
        end
      end
    end
  end
end
