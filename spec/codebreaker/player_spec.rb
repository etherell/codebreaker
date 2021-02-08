require 'spec_helper'

module Codebreaker
  RSpec.describe Player do
    let(:player) { described_class.new }

    describe '#initialize' do
      context 'when player created' do
        let(:user_hints) { player.instance_variable_get(:@hints_used) }
        let(:attempts_used) { player.instance_variable_get(:@attempts_used) }

        it 'has zero used hints' do
          expect(user_hints).to be_zero
        end

        it 'has zero used attempts' do
          expect(attempts_used).to be_zero
        end
      end
    end

    RSpec.shared_examples 'a player with appropriate attempts and hints quantity' do
      before { player.difficulty = difficulty }

      it 'has appropriate attempts quantity' do
        expect(player.instance_variable_get(:@attempts_total)).to eq(attempts_total)
      end

      it 'has appropriate hints quantity' do
        expect(player.instance_variable_get(:@hints_total)).to eq(hints_total)
      end
    end

    describe '#difficulty=' do
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
      subject(:attempts_left) { player.attempts_left }

      let(:difficulty) { 'easy' }
      let(:attempts_total) { 15 }

      before { player.difficulty = difficulty }

      context 'when player difficulty just set' do
        it 'has attempts left equal to attempts total' do
          expect(attempts_left).to eq(attempts_total)
        end
      end

      context 'when all attempts used' do
        before { player.instance_variable_set(:@attempts_used, attempts_total) }

        it 'has zero attempts left' do
          expect(attempts_left).to be_zero
        end
      end
    end
  end
end
