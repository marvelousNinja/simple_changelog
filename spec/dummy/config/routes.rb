Rails.application.routes.draw do
  mount SimpleChangelog::Engine => '/changelog', as: 'simple_changelog'
end
