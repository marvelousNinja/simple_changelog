require 'spec_helper'

module SimpleChangelog
  describe Tag do
  	subject { build(:tag) }
  	
  	context :methods do
	  	it { should respond_to :name }
	  	it { should respond_to :date }
	  	it { should respond_to :commit_id }
	  end

	  context :return_values do
	  	its(:name) { should_not be_nil }
	  	its(:date) { should_not be_nil }
	  	its(:commit_id) { should_not be_nil }
		end
  end
end
