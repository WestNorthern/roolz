##
# Assuming that the Rool::Include is parsing a dataset and checking to see
# if the operand matches one of the keys
##

module Rool
  class Include < Basic
  	def process(dataset)
  		super
  		
  		if @operand == nil
  			self.instance_variable_set(:@result, false)
      	self.instance_variable_set(:@message, "The operand cannot be nil.")
  			return false
  		end
  		
  		dataset.values.each do |value|
  			if value == @operand
  				self.instance_variable_set(:@result, true)
  				return true
  			end
  		end
  		self.instance_variable_set(:@result, false)
      self.instance_variable_set(:@message, "#{@operand} does not match any values in the data set.")
  		return false
  	end
  end
end
