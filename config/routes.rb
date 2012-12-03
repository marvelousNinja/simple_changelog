SimpleChangelog::Engine.routes.draw do
  get "repositories/show"

  root to: "repositories#show"
end
