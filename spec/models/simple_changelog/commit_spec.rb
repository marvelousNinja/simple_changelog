require 'spec_helper'

module SimpleChangelog
  describe Commit do
  	before(:each) do
  		@init_commit = mock('init commit',
  										     short_message: 'Initial commit',
  										     author: 'Derp',
  										     date: Time.now,
  											   id: '1234')
  	end

  	subject { Commit.new(@init_commit) }
  	
  	context :methods do
	  	it { should respond_to :message }
	  	it { should respond_to :author }
	  	it { should respond_to :date }
	  	it { should respond_to :id }
	  end

	  context :return_values do
	  	its(:message) { should_not be_nil }
	  	its(:author) { should_not be_nil }
	  	its(:date) { should_not be_nil }
	  	its(:id) { should_not be_nil }
		end
  end
end
