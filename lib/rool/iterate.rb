module Rool
  class Iterate < Basic
    attr_accessor :rule_type, :container_type

    def process(dataset, container_type, rule_type)
      super
      @all_array = dataset[@data_key].clone

      # rule_type.new(@data_key, @operand).process(@new_data)
      # @new_data = { @data_key => @new_key }
      # @new_key = @key.public_send(method_name) if @key.respond_to? method_name
      @list = {}
      # @arg_list = @all_array.map { |x| rule_type.new(x, @operand) }
      @arg_list = []

      @all_array.each_with_index do |x, y|
        @list[y] = x
      end
      puts "the key"
      p @list.keys[0]

      @all_array.each_with_index do |x, y|
        @arg_list.push(rule_type.new(@list.keys[y], @operand))
      end

      puts "The List Hash"
      p @list
      puts "The array"
      p @all_array

      @arg_list.each do |x|
        x.process(@list)
      end

      # @to_process.message(@list)

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