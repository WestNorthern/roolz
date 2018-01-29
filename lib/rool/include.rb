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

  		if dataset[@data_key].kind_of?(Array)
  		  if dataset[@data_key].include?(@operand)
  				self.instance_variable_set(:@result, true)
  				return true
  			else
  				self.instance_variable_set(:@result, false)
      		self.instance_variable_set(:@message, "The operand is not included in the array.")
  				return false
  			end
  		end
  		
  		
  		
  		##
  		#   According to my initial guess at what the function did.
  		##
  		# dataset.values.each do |value|
  		# 	if value == @operand
  		# 		self.instance_variable_set(:@result, true)
  		# 		return true
  		# 	end
  		# end

  		self.instance_variable_set(:@result, false)
      self.instance_variable_set(:@message, "Value is not able to be compared.")
  		return false
  	end
  end
end
