require 'spec_helper'

module SimpleChangelog
  describe Commit do
    subject { Commit.new('msg', 'date', 'id') }

    context 'methods' do
      describe '#message' do
        it { should respond_to :message }
        its(:message) { should_not be_nil }
      end

      describe '#date' do
        it { should respond_to :date }
        its(:date) { should_not be_nil }
      end

      describe '#id' do
        it { should respond_to :id }
        its(:id) { should_not be_nil }
      end
    end
  end
end
