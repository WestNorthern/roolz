module Rool
  class Iterate < Basic
    attr_accessor :rule_type, :container_type

    def process(dataset, container_type, rule_type)
      super

      # spec for checking if data is an array
      # spec for checking if each element of the array responds to rule_type
      @all_array = dataset[@data_key].clone

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

# @new = Rool::Iterate.new(:foo, 10)
# @data = {foo: [1, 2, 3], bar: 20, baz: 15}
# @new.process(@data, Rool::All, Rool::Equal)

# @all_test = Rool::All.new(Rool::Equal.new(:foo, 10), Rool::Equal.new(:bar, 10), Rool::Equal.new(:baz, 30))
# @all_test.process(@data)

# @equal_test = Rool::Equal.new(:bar, 10)
# @equal_test.process(@data)