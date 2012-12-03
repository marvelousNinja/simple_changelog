module SimpleChangelog
  class Commit < Struct.new(:message, :date, :id)
  end
end
