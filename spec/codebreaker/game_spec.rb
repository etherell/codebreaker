require 'spec_helper'

module Codebreaker
  RSpec.describe Game do
    let(:game) { described_class.new }

    describe '#initialize' do
      context 'when game starts it initializes with secret number' do
        subject(:game_secret_number) { game.secret_number }

        it 'has secret number' do
          expect(game_secret_number).not_to be_nil
        end

        it 'has valid secret number' do
          expect(game_secret_number).to match(/^[1-6]{4}$/)
        end
      end
    end

    describe '#player_number=' do
      subject(:set_player_number) { game.player_number = new_player_number }

      let(:new_player_number) { '1234' }
      let(:result) { '----' }

      before { game.instance_variable_set(:@result, result) }

      context 'when player number set' do
        it 'changes game player_number' do
          expect { set_player_number }.to change { game.instance_variable_get(:@player_number) }
        end

        it 'sets appropriate player_number' do
          set_player_number
          expect(game.instance_variable_get(:@player_number)).to eq(new_player_number)
        end

        it 'clears result' do
          expect { set_player_number }.to change { game.instance_variable_get(:@result) }.from(result).to(nil)
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

    RSpec.shared_examples 'a game with appropriate result' do
      subject(:game_result) { game.result }

      before do
        game.instance_variable_set(:@secret_number, secret_number)
        game.instance_variable_set(:@player_number, player_number)
      end

      it { expect(game_result).to eq(expected_result) }
    end

    describe '#result' do
      context 'with all partial matches' do
        let(:secret_number) { '6543' }
        let(:player_number) { '3456' }
        let(:expected_result) { '----' }

        it_behaves_like 'a game with appropriate result'
      end

      context 'with all total matches' do
        let(:secret_number) { '1234' }
        let(:player_number) { '1234' }
        let(:expected_result) { '++++' }

        it_behaves_like 'a game with appropriate result'
      end

      context 'with partial and total matches' do
        let(:secret_number) { '1234' }
        let(:player_number) { '3124' }
        let(:expected_result) { '+---' }

        it_behaves_like 'a game with appropriate result'
      end
    end
  end
end
