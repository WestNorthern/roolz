describe "Rool::Iterate" do

  before :each do
    @data = {
      foo: [2, 3, 4, 5, 6, 7, 10],
      fizz: ['Yes', 'We', 'Keneng'],
      cool_number: 262,
      bar: [10, 10, 10, 10, 10]
    }
  end

  # @new = Rool::Iterate.new(:foo, 10)
  # @data = {foo: [1, 2, 3], bar: 20, baz: 15}
  # @new.process(@data, Rool::All, Rool::Equal)

  # @all_test = Rool::All.new(Rool::Equal.new(:foo, 10), Rool::Equal.new(:bar, 10), Rool::Equal.new(:baz, 30))
  # @all_test.process(@data)

  # @equal_test = Rool::Equal.new(:bar, 10)
  # @equal_test.process(@data)


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
      @iterate_test = Rool::Iterate.new(:foo, 10).process(@data, Rool::All, Rool::Equal).process
      expect(@iterate_test).to have_attributes(result: false)
    end

    it 'will have an attribute called message that warns you about the type being passed in' do
      @iterate_test = Rool::Iterate.new(:foo, 10).process(@data, Rool::All, Rool::Equal)
      expect(@iterate_test).to have_attributes(message: "The data type being passed into the key is not an array of numbers.")
    end

    it 'will have an attribute called message that explains why result is false' do
      @iterate_test = Rool::Iterate.new(:foo, 10).process(@data, Rool::All, Rool::Equal)
      expect(@iterate_test).to have_attributes('All of the child methods.')
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