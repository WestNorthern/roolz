describe "Rool::Iterate" do

  before :each do
    @data = {
      foo: [2, 3, 4, 5, 6, 7, 10],
      fizz: ['Yes', 'We', 'Keneng'],
      cool_number: 262,
      bar: [10, 10, 10, 10, 10]
    }
  end


  describe '#process' do

    it 'will be an instance of Rool::All' do
      @iterate_test = Rool::Iterate.new(:foo, 10).process(@data, Rool::All, Rool::Equal)
      expect(@iterate_test).to be_an_instance_of Rool::All
    end

    it 'will be an instance of Rool::All' do
      @iterate_test = Rool::Iterate.new(:foo, 10).process(@data, Rool::All, Rool::Equal)
      expect(@iterate_test).to be_an_instance_of Rool::All
    end


    it 'will have an attribute called result with a value of false' do
      @iterate_test = Rool::Iterate.new(:cool_number, 10)
      @iterate_test.process(@data, Rool::All, Rool::Equal)
      expect(@iterate_test).to have_attributes(result: false)
    end

    it 'will have an attribute called message that warns you about the type being passed in' do
      @iterate_test = Rool::Iterate.new(:cool_number, 10)
      @iterate_test.process(@data, Rool::All, Rool::Equal)
      expect(@iterate_test).to have_attributes(message: "The data type being passed into the key is not an array of numbers.")
    end


    # Expect False

    it 'will iterate through an array and return false' do
      @iterate_test = Rool::Iterate.new(:foo, 10).process(@data, Rool::All, Rool::Equal).process
      expect(@iterate_test).to be(false)
    end

    # Expect True

    it 'will iterate through an array and return false' do
      @iterate_test = Rool::Iterate.new(:bar, 10).process(@data, Rool::All, Rool::Equal).process
      expect(@iterate_test).to be(false)
    end

    # Serialization

  end
end