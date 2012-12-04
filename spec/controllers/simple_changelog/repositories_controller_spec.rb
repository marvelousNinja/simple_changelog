require 'spec_helper'

module SimpleChangelog
  describe RepositoriesController do
    before(:each) do
        repo = double('repo')
        repo.stub(:kind_of?).with(Repository).and_return(true)
        repo.stub(:load_history).and_return({})
        Repository.should_receive(:new).and_return(repo)
    end

    describe "GET 'show'" do
      it "returns http success" do
        get 'show', { :use_route => "simple_changelog"}
        response.should be_success
      end

      it "assigns @changelog variable" do
        get 'show', { :use_route => "simple_changelog"}
        assigns(:changelog).should be_kind_of(Hash)      
      end

      it "assigns @repo variable" do
        get 'show', { :use_route => "simple_changelog"}
        assigns(:repo).should be_kind_of(Repository) 
      end
    end
  end
end
