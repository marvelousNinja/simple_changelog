module SimpleChangelog
  class Tag < Struct.new(:name, :author, :date, :commit_id)
  end
end
