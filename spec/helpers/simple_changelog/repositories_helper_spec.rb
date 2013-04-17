require 'spec_helper'

module SimpleChangelog
  describe RepositoriesHelper do

  	let(:repo) do
  		double('repo', current_version_tag: '0.0.1')
  	end

    subject { helper }

    context 'methods' do
    	describe '#long_date_format' do
    		it { should respond_to(:long_date_format) }
	    	it 'should not return nil' do
	  		  helper.long_date_format(Time.now).should_not be_nil
	  	  end
	  	end
	  end
  end
end
