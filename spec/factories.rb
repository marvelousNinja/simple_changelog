module SimpleChangelog
  repos_path = 'spec/repos'

  empty = File.join(repos_path, 'empty')
  with_commits = File.join(repos_path, 'with_commits')
  with_tags = File.join(repos_path, 'with_tags')

  FactoryGirl.define do
    factory :repository, class: Repository do
      
      trait :empty do 
        initialize_with { Repository.new(empty) }
      end

      trait :with_commits do 
        initialize_with { Repository.new(with_commits) }
      end

      trait :with_tags do 
        initialize_with { Repository.new(with_tags) }
      end
    end
  end
end