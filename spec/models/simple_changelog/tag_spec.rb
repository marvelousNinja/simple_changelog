require 'spec_helper'

module SimpleChangelog
  describe Tag do
    subject { Tag.new('name', 'datetime') }

    context 'methods' do
      describe '#name' do
        it { should respond_to :name }
        its(:name) { should_not be_nil }
      end

      describe '#datetime' do
        it { should respond_to :datetime }
        its(:datetime) { should_not be_nil }
      end
    end
  end
end
