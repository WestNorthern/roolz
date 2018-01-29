module Rool
  class Iterate < Basic
    attr_accessor :rule_type, :container_type

    def process(dataset, container_type, rule_type)
      super
      # spec for checking if data is an array
      # spec for checking if each element of the array responds to rule_type
      @all_array = dataset[@data_key].clone

      if @all_array.kind_of?(Array) == false
        self.instance_variable_set(:@result, false)
        self.instance_variable_set(:@message, "The data type being passed into the key is not an array of numbers.")
        return false
      end

      @list = {}
      
      @arg_list = []

      @all_array.each_with_index do |x, y|
        @list[y] = x
      end

      @all_array.each_with_index do |x, y|
        @arg_list.push(rule_type.new(@list.keys[y], @operand))
      end

      @arg_list.each do |x|
        x.process(@list)
      end

      @to_process = container_type.new(*@arg_list)

      @to_process.process(@list)

      return @to_process
      
    end
  end
end
