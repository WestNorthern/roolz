describe "Rool::Equal" do
  describe '#process' do

    before :each do
      @data = {foo: 10}
    end

    ## Expect True

    it "returns true if the value passed in is equal to the value in the data set" do
      expect(Rool::Equal.new(:foo, 10).process(@data)).to eq(true)
    end

    ## Expect False
    it "returns false if the value passed is not equal to the value in the data set" do
      expect(Rool::Equal.new(:foo, 5).process(@data)).to eq(false)
    end

    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a false return' do
      @false_test = Rool::Equal.new(:foo, 232)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "#{@data[:foo]} is not equal to 232")
    end
    
  end
end