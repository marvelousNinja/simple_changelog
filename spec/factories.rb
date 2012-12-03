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

    factory :commit, class: SimpleChangelog::Commit do
      initialize_with do 
        Commit.new('Initial commit',
                   'Derp',
                   Time.now,
                   '234567890123') 
      end
    end

    factory :tag, class: SimpleChangelog::Tag do
      initialize_with do 
        Tag.new('0.0.1',
        'Derp',
        Time.now,
        '34567890987')
      end
    end
  end
end