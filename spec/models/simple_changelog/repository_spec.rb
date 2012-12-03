require 'spec_helper'

module SimpleChangelog
  describe Repository do
  	let(:empty_repo) { build(:repository, :empty) }
  	let(:repo_with_commits) { build(:repository, :with_commits) }
  	let(:repo_with_tags) { build(:repository, :with_tags) }

		shared_examples_for 'any repo' do
			it { should respond_to :load_history }
			it { should respond_to :current_version_tag }

			its(:load_history) { should be_kind_of(Hash) }
			its(:current_version_tag) { should_not be_nil }
		end

		shared_examples_for 'a versioned repo' do
			it_should_behave_like 'any repo'
			
			its(:current_version_tag) { should_not be_empty }
		end 	

		describe :empty_repo do
			subject { empty_repo }
			
			it_should_behave_like 'any repo'
		end

		describe :repo_with_commits do
			subject { repo_with_commits }
			
			it_should_behave_like 'a versioned repo'
			
			it 'should have one record at version history' do
				repo_with_commits.load_history.keys.count.should == 1
			end
		end

		describe :repo_with_tags do
			subject { repo_with_tags }

			it_should_behave_like 'a versioned repo'
			
			it 'should have at least one record at version history' do
				repo_with_tags.load_history.keys.count.should >= 1
			end
		end
  end
end
