require 'spec_helper'

module Codebreaker
  RSpec.describe GameStatistic do
    let(:game_stats) { described_class.new(difficulty) }
    let(:hints_total) { 2 }
    let(:secret_number) { '1234' }
    let(:difficulty) { 'easy' }

    before { game_stats.secret_number = secret_number }

    RSpec.shared_examples 'a player with appropriate attempts and hints quantity' do
      it 'has appropriate attempts quantity' do
        expect(game_stats.attempts_total).to eq(attempts_total)
      end

      it 'has appropriate hints quantity' do
        expect(game_stats.hints_total).to eq(hints_total)
      end
    end

    describe '#initialize' do
      context 'when game stats created' do
        it 'has zero used hints' do
          expect(game_stats.hints_used).to eq(0)
        end

        it 'has zero used attempts' do
          expect(game_stats.attempts_used).to eq(0)
        end
      end

      context 'when difficulty easy' do
        let(:difficulty) { 'easy' }
        let(:attempts_total) { 15 }
        let(:hints_total) { 2 }

        it_behaves_like 'a player with appropriate attempts and hints quantity'
      end

      context 'when difficulty medium' do
        let(:difficulty) { 'medium' }
        let(:attempts_total) { 10 }
        let(:hints_total) { 1 }

        it_behaves_like 'a player with appropriate attempts and hints quantity'
      end

      context 'when difficulty hell' do
        let(:difficulty) { 'hell' }
        let(:attempts_total) { 5 }
        let(:hints_total) { 1 }

        it_behaves_like 'a player with appropriate attempts and hints quantity'
      end
    end

    describe '#attempts_left' do
      subject(:attempts_left) { game_stats.attempts_left }

      let(:attempts_total) { 15 }

      context 'when player difficulty just set' do
        it 'has attempts left equal to attempts total' do
          expect(attempts_left).to eq(attempts_total)
        end
      end

      context 'when all attempts used' do
        before { game_stats.attempts_used = attempts_total }

        it 'has zero attempts left' do
          expect(attempts_left).to be_zero
        end
      end
    end

    describe '#give_hint' do
      subject(:give_hint) { game_stats.give_hint }

      context 'when hint has been given' do
        it 'returns appropriate number' do
          expect(give_hint).to match(/[1-6]/)
        end

        it 'reduces hints quantity' do
          expect { give_hint }.to change(game_stats, :hints_used).by(1)
        end
      end
    end

    describe '#hints_used' do
      subject(:hints_used) { game_stats.hints_used }

      context 'when hints manager just created' do
        it { expect(hints_used).to be_zero }
      end

      context 'when hint given' do
        before { game_stats.give_hint }

        it { expect(hints_used).to eq(1) }
      end
    end

    describe '#hints?' do
      subject(:hints?) { game_stats.hints? }

      context 'when hints manager just created' do
        it { expect(hints?).to be_truthy }
      end

      context 'when all hints given' do
        before do
          hints_total.times { game_stats.give_hint }
        end

        it { expect(hints?).to be_falsey }
      end
    end

    describe '#hints_left' do
      subject(:hints_left) { game_stats.hints_left }

      context 'when hints manager just created' do
        it { expect(hints_left).to eq(hints_total) }
      end

      context 'when all hints given' do
        before do
          hints_total.times { game_stats.give_hint }
        end

        it { expect(hints_left).to be_zero }
      end
    end

    describe '#to_hash' do
      subject(:game_stats_hash) { game_stats.to_hash }

      let(:expected_hash) do
        { hints_used: 0, attempts_used: 0, difficulty: 'easy', attempts_total: 15, hints_total: 2 }
      end

      context 'when successful converted to hash' do
        it 'converts from object to hash' do
          expect(game_stats_hash).to be_a(Hash)
        end

        it 'has appropriate keys and values' do
          expect(game_stats_hash).to eq(expected_hash)
        end
      end
    end
  end
end
