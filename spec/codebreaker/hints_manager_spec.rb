require 'spec_helper'

module Codebreaker
  RSpec.describe HintsManager do
    let(:hints_manager) { described_class.new(hints_total, secret_number) }
    let(:hints_total) { 2 }
    let(:secret_number) { '1234' }

    describe '#give_hint' do
      subject(:give_hint) { hints_manager.give_hint }

      context 'when hint has been given' do
        it 'returns appropriate number' do
          expect(give_hint).to match(/[1-6]/)
        end

        it 'reduces hints quantity' do
          expect { give_hint }.to change(hints_manager, :hints_used).by(1)
        end
      end
    end

    describe '#hints_used' do
      subject(:hints_used) { hints_manager.hints_used }

      context 'when hints manager just created' do
        it { expect(hints_used).to be_zero }
      end

      context 'when hint given' do
        before { hints_manager.give_hint }

        it { expect(hints_used).to eq(1) }
      end
    end

    describe '#hints?' do
      subject(:hints?) { hints_manager.hints? }

      context 'when hints manager just created' do
        it { expect(hints?).to be_truthy }
      end

      context 'when all hints given' do
        before do
          hints_total.times { hints_manager.give_hint }
        end

        it { expect(hints?).to be_falsey }
      end
    end

    describe '#hints_left' do
      subject(:hints_left) { hints_manager.hints_left }

      context 'when hints manager just created' do
        it { expect(hints_left).to eq(hints_total) }
      end

      context 'when all hints given' do
        before do
          hints_total.times { hints_manager.give_hint }
        end

        it { expect(hints_left).to be_zero }
      end
    end
  end
end
