module Rool

	# Given one rule object, returns the opposite boolean

  class Not < Container
  	def process(dataset={})
  		if @children.length > 1
  			raise "Rool::Not can only accept one rule object"
  		else
  			if @children[0].process == true
  				return false
  			elsif @children[0].process == false
  				self.instance_variable_set(:@result, true)
  				return true
  			end
  		end
    end
  end
end
