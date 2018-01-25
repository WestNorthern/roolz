
describe "Rool::Regex" do
  describe '#process' do

    before :each do
      @data = {
        email: 'nate@chargeback.com',
        name: 'Nate',
        salary: 'ONE MILLION DOLLARS',
        favorite_books: ['Anathem', 'Cosmos']
      }
    end

    ## Expect True

    it "returns true if the operand matches to the data in the data key" do
      expect(Rool::Regex.new(:email, /chargeback/i).process(@data)).to eq(true)
    end

    ## Expect False

    it "returns false if the operand does not match the value in the data key" do
      expect(Rool::Regex.new(:name, /Arnold\s?Schwarzenegger/i).process(@data)).to eq(false)
    end
    it "returns false if the operand or dataset value does not work with regular expressions" do
      expect(Rool::Regex.new(:name, ).process(@data)).to eq(false)
    end
    it "returns false if the value passed does not respond to the < operator" do
      expect(Rool::Regex.new(:favorite_books, /anathem/i).process(@data)).to eq(false)
    end

    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a false return' do
      @false_test = Rool::Regex.new(:name, /Arnold\s?Schwarzenegger/i)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "#{(/Arnold\s?Schwarzenegger/i)} cannot be found in the data set with regexp.")
    end
    it 'will have a false result attribute and a message after a false return if unable to be compared or searched' do
      @false_test = Rool::Regex.new(:name, )
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: " cannot be compared to #{@data[:name]}")
    end
  end
end
