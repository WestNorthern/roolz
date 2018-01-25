
describe "Rool::LessThan" do
  describe '#process' do

    before :each do
      @data = {foo: 5}
    end

    ## Expect True

    it "returns true if the operand is less than the value in the data set" do
      # -30 < 5 is true
      expect(Rool::LessThan.new(:foo, -30).process(@data)).to eq(true)
    end

    ## Expect False

    it "returns false if the value passed is equal to the value in the data set" do
      expect(Rool::LessThan.new(:foo, 5).process(@data)).to eq(false)
    end
    it "returns false if the operand is greater than the value in the data set" do
      # 5 > 30 is false
      expect(Rool::LessThan.new(:foo, 30).process(@data)).to eq(false)
    end
    it "returns false if the value passed does not respond to the < operator" do
      @data = {foo: ['a','b']}
      expect(Rool::LessThan.new(:foo, 1).process(@data)).to eq(false)
    end

    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a false return' do
      @false_test = Rool::LessThan.new(:foo, 5)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "5 is NOT less than #{@data[:foo]}")
    end

    it 'will have a false result attribute and a message if incomparable' do
      @false_test = Rool::GreaterThan.new(:foo, 'Texas')
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "Texas is not able to be compared.")
    end
  end
end
