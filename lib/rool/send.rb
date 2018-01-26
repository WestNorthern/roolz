module Rool
  class Send < Basic
    attr_accessor :method_name, :rule_type

    def process(dataset, method_name, rule_type)
      super
      @key = dataset[@data_key].clone
      p @data_key

      @new_key = @key.public_send(method_name) if @key.respond_to? method_name

      @new_data = { @data_key => @new_key }

      rule_type.new(@data_key, @operand).process(@new_data)
      
    end
  end
end