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

	  	describe '#highlight_commit_tags' do
	  	  it { should respond_to(:highlight_commit_tags) }
	      it 'should not return nil' do
	      	helper.highlight_commit_tags('some message').should_not be_nil
	      end
	  	end

	  	describe '#current_version_tag' do
	  		it { should respond_to(:current_version_tag) }
	  		it 'should not return nil' do
	  			Repository.should_receive(:new).and_return(repo)
	  			helper.current_version_tag.should_not be_nil
	  		end
	  	end

	  	describe '#changelog_link' do
	  		it { should respond_to(:changelog_link) }
	  		it 'should not return nil' do
	  			Repository.should_receive(:new).and_return(repo)
	  			helper.changelog_link.should_not be_nil
	  		end
	  	end
	  end
  end
end
