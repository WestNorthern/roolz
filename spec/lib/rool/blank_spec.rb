describe "Rool::Blank" do


  before :each do
    @data = {
      empty_string: ' ',
      nil_sym: nil,
      empty_array: [],
      empty_hash: {},
      fizz: 'I am not empty.'

    }
  end


  describe '#process' do

    ## Expect True

    it 'returns true if the datakeys value is nil' do
      expect(Rool::Blank.new(:nil_sym).process(@data)).to be(true)
    end
    it 'returns true if the datakeys value is an empty string' do
      expect(Rool::Blank.new(:empty_string).process(@data)).to be(true)
    end
    it 'returns true if the datakeys value an empty hash' do
      expect(Rool::Blank.new(:empty_hash).process(@data)).to be(true)
    end
    it 'returns true if the datakeys value an empty array' do
      expect(Rool::Blank.new(:empty_array).process(@data)).to be(true)
    end

    ## Expect False

    it 'returns false if the datakeys value is not nil or empty' do
      expect(Rool::Blank.new(:fizz).process(@data)).to be(false)
    end

    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a false return' do
      @false_test = Rool::Blank.new(:fizz)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "The value of #{@data[:fizz]} is not blank.")
    end

  end
end