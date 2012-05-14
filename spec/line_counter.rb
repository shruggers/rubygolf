class LineCounter
  def self.count(filename)
    open(filename) do |file|
      solution = file.read
      solution.length
    end
  end
end
