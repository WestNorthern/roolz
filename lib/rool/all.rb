module Rool
  class All < Container
  	
    def process(dataset={})
      if @children.all?{|r| r.process(dataset)}
      	return true
      else
      	self.instance_variable_set(:@result, false)
      	return false
      end
    end

    def message(dataset={})
    	@process_hash = @children.each {|r| r.process(dataset) }
    	@messages = @process_hash.map { |r| r.message unless r.message == "" }.select { |r| r != nil }
    end

  end
end
