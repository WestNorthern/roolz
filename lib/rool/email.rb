module Rool
  class Email < Basic
  	def process(dataset)
  		super
  		email = dataset[@data_key]
		  valid = '[A-Za-z\d.+-]+' #Commonly encountered email address characters
		  if (email =~ /#{valid}@#{valid}\.#{valid}/) == 0
		  	self.instance_variable_set(:@result, true)
		  	return true
		  else
		  	self.instance_variable_set(:@result, false)
      	self.instance_variable_set(:@message, "#{email} is probably not an e-mail address.")
  			return false
		  end
		end
  end
end