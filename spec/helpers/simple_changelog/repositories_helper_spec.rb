require 'spec_helper'

module SimpleChangelog
  describe RepositoriesHelper do
    subject { helper }
    
    it { should respond_to(:long_date_format) }
    it { should respond_to(:highlight_commit_tags) }
    it { should respond_to(:current_version_tag) }
  end
end
