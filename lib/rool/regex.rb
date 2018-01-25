module Rool
  class Regex < Basic
  	def process(dataset)
  		super
  		if @operand.respond_to?(:match?) && dataset[@data_key].respond_to?(:<)
  			@operand.match?(dataset[@data_key])
  			if @operand.match?(dataset[@data_key])
  				return true
  			else
  				self.instance_variable_set(:@result, false)
  				self.instance_variable_set(:@message, "#{@operand} cannot be found in the data set with regexp.")
					return false
				end
  		end
  		self.instance_variable_set(:@result, false)
  		self.instance_variable_set(:@message, "#{@operand} cannot be compared to #{dataset[@data_key]}")
  		return false
  	end
  end
end
