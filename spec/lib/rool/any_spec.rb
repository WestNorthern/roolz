
describe "Rool::Any" do
  describe '#process' do

  	## Expect True

    it 'returns true if any of the children rules are true for the dataset' do
      expect(Rool::Any.new(Rool::False.new, Rool::True.new).process).to be(true)
    end

    ## Expect False

    it 'returns false if all of the children rules are false for the dataset' do
      expect(Rool::Any.new(Rool::False.new, Rool::False.new).process).to be(false)
    end

    ## Result Attribute

    it 'will have a false result attribute after a false return' do
      @false_test = Rool::Any.new(Rool::False.new, Rool::False.new)
      @false_test.process
      expect(@false_test).to have_attributes(result: false)
    end

    it 'will have a true result attribute after a true return' do
      @true_test = Rool::Any.new(Rool::False.new, Rool::True.new)
      @true_test.process
      expect(@true_test).to have_attributes(result: true)
    end
  end
end
