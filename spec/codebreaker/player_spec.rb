require 'spec_helper'

module Codebreaker
  RSpec.describe Player do
    let(:player) { described_class.new(name) }
    let(:name) { 'Valera' }

    describe '#name' do
      context 'when name set' do
        it 'has appropriate name' do
          expect(player.name).to eq(name)
        end
      end
    end

    describe '#to_hash' do
      subject(:player_hash) { player.to_hash }

      context 'when successful converted to hash' do
        let(:expected_hash) { { name: name } }

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
