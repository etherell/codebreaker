require 'spec_helper'

module Codebreaker
  RSpec.describe Player do
    let(:player) { described_class.new }

    describe '#name' do
      context 'when name not set' do
        it "doesn't have name" do
          expect(player.name).to be_nil
        end
      end

      context 'when name set' do
        let(:name) { 'Valera' }

        before { player.name = name }

        it 'has appropriate name' do
          expect(player.name).to eq(name)
        end
      end
    end

    describe '#to_h' do
      subject(:player_hash) { player.to_h }

      context 'when successful converted to hash' do
        let(:name) { 'Valera' }
        let(:expected_hash) { { 'name' => name } }

        before { player.name = name }

        it 'converts from object to hash' do
          expect(player_hash).to be_a(Hash)
        end

        it 'has appropriate keys and values' do
          expect(player_hash).to eq(expected_hash)
        end
      end
    end
  end
end
