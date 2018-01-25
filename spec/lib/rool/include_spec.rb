describe "Rool::Include" do
  describe '#process' do

    before :each do
      @data = {
        foo: 'bar',
        fizz: 'Buzz',
        cool_number: 262,
        gettin_jiggy: ['wit', 'It'],
        did_you_know: 'That Nas wrote that song?'
      }
    end

    ## Expect True

    it "returns true if the operand matches one of the data key values" do
      expect(Rool::Include.new(:cool, 'bar').process(@data)).to eq(true)
    end

    it "returns true if the operand matches one of the data key values" do
      expect(Rool::Include.new(:foo, 'Buzz').process(@data)).to eq(true)
    end

    ## Expect False

    it "returns false if the operand is not included in the data key set" do
      expect(Rool::Include.new(:fizz, 'Texas').process(@data)).to eq(false)
    end
    it "returns false if the operand is nil" do
      expect(Rool::Include.new(:fizz, nil).process(@data)).to eq(false)
    end

    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a false return' do
      @false_test = Rool::Include.new(:foo, 232)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "232 does not match any values in the data set.")
    end

    it 'will have a false result attribute and a message after a false return for nil operand' do
      @false_test = Rool::Include.new(:foo, nil)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "The operand cannot be nil.")
    end
    
  end
end