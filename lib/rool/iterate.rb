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
        @arg_list.push(rule_type.new(y, @operand))
      end
      puts "The List Hash"
      p @list
      puts "The array"
      p @all_array

      @to_process = container_type.new(*@arg_list)
      p @to_process
      @to_process.process(@list)
      p @to_process
      @to_process

      ## Check ALL again. It is processing the first child of the object and not hitting the rest


      
    end
  end
end

# @new = Rool::Iterate.new(:foo, 10)
# @data = {foo: [1, 2, 3]}
# @new.process(@data, Rool::All, Rool::Equal)