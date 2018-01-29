module Rool
  class Any < Container
  	def process(dataset={})
      if @children.any?{|r| r.process(dataset)}
      	self.instance_variable_set(:@result, true)
      	return true
      else
      	self.instance_variable_set(:@result, false)
      	return false
      end
    end
  end
end
