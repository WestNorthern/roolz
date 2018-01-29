module Rool
  class Equal < Basic
  	def process(dataset)
      super

      if (dataset[@data_key].respond_to?(:>) && @operand.respond_to?(:>))
      	if @operand == dataset[@data_key]
      		self.instance_variable_set(:@result, true)
      		return true
      	else
      		self.instance_variable_set(:@result, false)
      		self.instance_variable_set(:@message, "#{dataset[@data_key]} is not equal to #{@operand}")
  				return false
      	end
      end
      false
    end
  end
end
