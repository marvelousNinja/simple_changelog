Rails.application.routes.draw do
  mount SimpleChangelog::Engine => "/simple_changelog", as: "simple_changelog" 
end
