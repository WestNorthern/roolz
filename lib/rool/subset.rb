##
# Assuming that 'complete subset' denotes a subset that 
# contains at least all of the values in the given set.
# Determines whether the operand is a complete 
# subset of the dataset's data_key.
##

require 'set'


module Rool
  class Subset < Basic
    def process(dataset)
      super

      if dataset[@data_key].is_a?(Array) && @operand.is_a?(Array)
      	key_set = dataset[@data_key].to_set
      	operand_set = @operand.to_set
      	if operand_set.subset?(key_set) || operand_set == key_set
          return true
        else
          self.instance_variable_set(:@result, false)
          self.instance_variable_set(:@message, "#{@operand} is not a valid subset of #{dataset[@data_key]}")
          return false
        end
      end
      self.instance_variable_set(:@result, false)
      self.instance_variable_set(:@message, "One of the arguments is not a valid set.")
      return false
    end
  end
end