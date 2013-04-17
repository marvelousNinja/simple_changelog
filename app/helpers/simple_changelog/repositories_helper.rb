require('minigit')

module SimpleChangelog
  module RepositoriesHelper
    def long_date_format(datetime)
      datetime.to_date.to_formatted_s :long
    end
  end
end