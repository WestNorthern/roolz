describe "Rool::Iterate" do

  before :each do
    @data = {
      foo: [2, 3, 4, 5, 6, 7, 10],
      fizz: ['Yes', 'We', 'Keneng'],
      cool_number: 262,
      bar: [true, false]
    }
  end


  describe '#process' do

    it 'will instantiate an All container with children for each array value' do
      @new = Rool::Iterate.new(:foo, 10)
      @processed = @new.process(@data, Rool::All, Rool::Equal)
      expect(@processed).to have_attributes()
    end

  end
end