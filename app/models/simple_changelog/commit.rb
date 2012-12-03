module SimpleChangelog
  class Commit < Struct.new(:message, :author, :date, :id)
  end
end
