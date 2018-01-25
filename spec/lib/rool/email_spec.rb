describe "Rool::Email" do
  before :each do
    @data = {
      foo: 'ryarthur262@gmail.com',
      fizz: '@gmail.ryan',
      cool_number: 262
    }
  end


  describe '#process' do

    ## Expect True

    it 'returns true if the datakeys value is probably an e-mail address' do
      expect(Rool::Email.new(:foo).process(@data)).to be(true)
    end

    ## Expect False
    
    it 'returns false if the datakeys value is probably not an e-mail address' do
      expect(Rool::Email.new(:fizz).process(@data)).to be(false)
    end

    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a false return' do
      @false_test = Rool::Email.new(:fizz)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "#{@data[:fizz]} is probably not an e-mail address.")
    end
  end
end
