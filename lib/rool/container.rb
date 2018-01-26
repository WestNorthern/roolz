class Rool::Container

  attr_reader :children
  attr_accessor :result

  def initialize(*children_rules)
    if !children_rules.all?{|r| r.kind_of?(Rool::Container) || r.kind_of?(Rool::Basic)}
      raise ArgumentError.new("Expected children rules to be objects in the Rool namespace")
    end
    @children = children_rules
    @result = true
  end

  def process(dataset={})
    raise "Implement the #process in the child rule container class"
  end

  def to_json
    Oj::dump self, :indent => 2 #indented for graphical representation
  end

  def self.from_json(json)
    Oj.load(json) unless !Oj.load(json).kind_of?(self)
  end

end
