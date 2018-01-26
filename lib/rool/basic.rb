require 'oj'

class Rool::Basic

  attr_accessor :data_key, :operand, :result, :message
  def initialize(data_key = nil, operand = nil)
    @data_key = data_key
    @operand = operand
    @result = true
    @message = nil
  end

  def process(dataset = {}, *args)
    raise ArgumentError.new("Expected the dataset to be a ruby Hash") unless dataset.kind_of?(Hash)
    return false unless dataset.key?(@data_key)
  end

  def to_json
  	Oj::dump self, :indent => 2 #indented for graphical representation
  end

  def self.from_json(json)
  	Oj.load(json) unless !Oj.load(json).kind_of?(self)
  end

end
