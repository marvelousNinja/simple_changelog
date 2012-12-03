def recreate_repos(path)
	FileUtils.rm_rf(path) if Dir.exists?(path)
	FileUtils.mkdir(path)
end

def create_and_init(path)
	FileUtils.mkdir(path)
  Grit::Repo.init(path)
end

def make_n_commits(repo, n)
  n.times do |i|
    repo.git.commit(allow_empty: true, m: "Commit No. #{i}")
  end
end

def tag_every_nth_commit(repo, n)
  commits = repo.commits
  (0...commits.count).step(n).each do |i|
    c = commits[i]
    repo.git.tag({}, "Tag No. #{i}", c.id)
  end
end

repos_path = 'spec/repos'

empty = File.join(repos_path, 'empty')
with_commits = File.join(repos_path, 'with_commits')
with_tags = File.join(repos_path, 'with_tags')

recreate_repos(repos_path)

create_and_init(empty)

repo = create_and_init(with_commits)
make_n_commits(repo, 4)

repo = create_and_init(with_tags)
make_n_commits(repo, 8)
tag_every_nth_commit(repo, 3)