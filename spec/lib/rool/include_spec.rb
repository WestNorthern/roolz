describe "Rool::Include" do
  describe '#process' do

    before :each do
      @data = {
        foo: ['bar', 'baz'],
        fizz: 'Buzz',
        cool_number: 262,
        baz: [ 1, 2, 3, 4, 5, 6, 7 ],
        did_you_know: 'That Nas wrote that song?'
      }
    end

    ## Expect True

    it "returns true if the operand matches one of the data key values as an integer" do
      expect(Rool::Include.new(:baz, 1).process(@data)).to eq(true)
    end

    it "returns true if the operand matches one of the data key values as a string" do
      expect(Rool::Include.new(:foo, 'bar').process(@data)).to eq(true)
    end


    ## Expect False

    it "returns false if the operand is not included in the data key set as string" do
      expect(Rool::Include.new(:foo, 'Texas').process(@data)).to eq(false)
    end

    it "returns false if the operand is not included in the data key set as integer" do
      expect(Rool::Include.new(:baz, 47).process(@data)).to eq(false)
    end

    it "returns false if the operand is nil" do
      expect(Rool::Include.new(:baz, nil).process(@data)).to eq(false)
    end

    it "returns false if the data type is not an array" do
      expect(Rool::Include.new(:fizz, nil).process(@data)).to eq(false)
    end

    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a false return' do
      @false_test = Rool::Include.new(:foo, 232)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "The operand is not included in the array.")
    end

    it 'will have a false result attribute and a message after a false return for nil operand' do
      @false_test = Rool::Include.new(:foo, nil)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "The operand cannot be nil.")
    end
    
  end
end