module SimpleChangelog
  describe Repository do  	
  	before(:each) do
  		@repo = double('repository',
  									 commits: [],
  									 tags: [],
  									 commit_count: 0)

  		Grit::Repo.should_receive(:new).with(anything).and_return(@repo)
  	end

  	let(:empty_repo) { Repository.new 'empty'  }
  	let(:repo_with_commits) { Repository.new 'with_commits' }
  	let(:repo_with_tags) { Repository.new 'repo_with_tags' }
  	
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
		  before(:each) do
  			commit = double('commit',
  		                  short_message:'hi',
  					            date: 'somedate',
  					            id: 'someid')

  			@repo.stub(:commits).and_return([commit])
        @repo.stub(:commits_between).and_return([])
        @repo.stub(:commit).with(commit.id).and_return(commit)
  			@repo.stub(:tags).and_return([])
  		end

			subject { repo_with_commits }
			
			it_should_behave_like 'a versioned repo'
			
			it 'should have one record at version history' do
				repo_with_commits.load_history.keys.count.should == 1
			end
		end

		describe :repo_with_tags do

			before(:each) do
				commit = double('commit',
					              short_message:'hi',
					              date: 'somedate',
					              id: 'someid')
				tag = double('tag',
					              name:'hi',
					              tag_date: 'somedate',
                        commit: commit)
				@repo.stub(:commits).and_return([commit])
        @repo.stub(:commits_between).and_return([])
        @repo.stub(:commit).with(commit.id).and_return(commit)
				@repo.stub(:tags).and_return([tag])
			end

			subject { repo_with_tags }

			it_should_behave_like 'a versioned repo'
			
			it 'should have at least one record at version history' do
				repo_with_tags.load_history.keys.count.should >= 1
			end
		end
  end
end
