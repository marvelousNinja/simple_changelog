require 'spec_helper'

module SimpleChangelog
  describe Commit do
    subject { Commit.new('name', 'type', 'message', 'author') }

    context 'methods' do

      describe '#name' do
        it { should respond_to :name }
        its(:name) { should_not be_nil }
      end

      describe '#message' do
        it { should respond_to :message }
        its(:message) { should_not be_nil }
      end

      describe '#type' do
        it { should respond_to :type }
        its(:type) { should_not be_nil }
      end

      describe '#author' do
        it { should respond_to :author }
        its(:author) { should_not be_nil }
      end
    end
  end
end
