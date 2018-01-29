module Rool
  class True < Basic
    def process(dataset={})
      # don't call super since this is an absolute answer
      if false
      	self.instance_variable_set(:@result, false)
      	self.instance_variable_set(:@message, "Something has gone terribly wrong. This should always be true.")
      end
      self.instance_variable_set(:@result, true)
      true
    end
  end
end
