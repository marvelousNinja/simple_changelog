require 'spec_helper'

module SimpleChangelog
  describe Commit do
  	subject { build(:commit) }
  	
  	context :methods do
	  	it { should respond_to :message }
	  	it { should respond_to :date }
	  	it { should respond_to :id }
	  end

	  context :return_values do
	  	its(:message) { should_not be_nil }
	  	its(:date) { should_not be_nil }
	  	its(:id) { should_not be_nil }
		end
  end
end
