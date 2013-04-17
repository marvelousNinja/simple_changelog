module SimpleChangelog
  Commit = Struct.new(:name, :type, :message, :author)
end
