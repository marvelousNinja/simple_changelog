module SimpleChangelog
  class Tag < Struct.new(:name, :date, :commit_id)
  end
end
