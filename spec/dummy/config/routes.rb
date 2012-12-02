Rails.application.routes.draw do

  mount SimpleChangelog::Engine => "/simple_changelog"
end
