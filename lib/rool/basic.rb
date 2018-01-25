require 'json'
require 'oj'

class Rool::Basic

  attr_accessor :data_key, :operand, :result, :message
  def initialize(data_key = nil, operand = nil)
    @data_key = data_key
    @operand = operand
    @result = true
    @message = nil
  end

  def process(dataset = {})
    raise ArgumentError.new("Expected the dataset to be a ruby Hash") unless dataset.kind_of?(Hash)
    return false unless dataset.key?(@data_key)
  end

  def jsonify
  	Oj::dump self, :indent => 2
  end

  def self.from_json(json)
  	Oj.load(json)
  end

end
