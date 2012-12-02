require 'spec_helper'

module SimpleChangelog
  describe Tag do
  	before(:each) do
  		@init_tag = mock('init tag',
  										  name: '0.0.1',
  										  author: 'Derp',
  										  tag_date: Time.now)
  		@init_tag.stub_chain(:commit, :id).and_return('1234')
  	end

  	subject { Tag.new(@init_tag) }
  	
  	context :methods do
	  	it { should respond_to :name }
	  	it { should respond_to :author }
	  	it { should respond_to :date }
	  	it { should respond_to :commit_id }
	  end

	  context :return_values do
	  	its(:name) { should_not be_nil }
	  	its(:author) { should_not be_nil }
	  	its(:date) { should_not be_nil }
	  	its(:commit_id) { should_not be_nil }
		end
  end
end
