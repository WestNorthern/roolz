describe "Rool::Send" do

  before :each do
    @data = {
      foo: [2, 3, 4, 5, 6, 7, 10],
      fizz: ['Yes', 'We', 'Keneng'],
      cool_number: 262,
      bar: [10, 10, 10, 10, 10]
    }
  end


  describe '#process' do

    it 'evaluates to true when sending count, 7 and equal on :foo' do
      @send_test = Rool::Send.new(:foo, 7).process(@data, 'count', Rool::Equal)
      expect(@send_test).to be(true)
    end

    it 'will be an instance of Rool::Send' do
      @send_test = Rool::Send.new(:foo, 10)
      expect(@send_test).to be_an_instance_of Rool::Send
    end


    # Expect False

    it 'evaluates to false when sending count, 9 and equal on :foo' do
      @send_test = Rool::Send.new(:foo, 10).process(@data, 'count', Rool::Equal)
      expect(@send_test).to be(false)
    end

    # Serialization

  end
end