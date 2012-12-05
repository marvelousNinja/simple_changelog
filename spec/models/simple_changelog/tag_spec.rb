require 'spec_helper'

module SimpleChangelog
  describe Tag do
    subject { Tag.new('name', 'date', 'id') }
    
    context 'methods' do
      describe '#message' do
        it { should respond_to :name }
        its(:name) { should_not be_nil }
      end

      describe '#date' do
        it { should respond_to :date }
        its(:date) { should_not be_nil }
      end

      describe '#commit_id' do
        it { should respond_to :commit_id }
        its(:commit_id) { should_not be_nil }
      end
    end
  end
end
