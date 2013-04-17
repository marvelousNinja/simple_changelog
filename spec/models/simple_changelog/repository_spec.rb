require 'minigit'

module SimpleChangelog
  describe Repository do
    before(:each) do
      @repo = double('repository', tags: [])
      @repo.stub(:capturing) { @repo }
      @repo.stub(:log).with(anything).and_return ''

      MiniGit.should_receive(:new).with(anything).and_return(@repo)
    end

    let(:empty_repo) { Repository.new 'empty'  }

    describe :empty_repo do
      subject { empty_repo }

      it { should respond_to :load_history }
      its(:load_history) { should be_kind_of(Hash) }
    end
  end
end