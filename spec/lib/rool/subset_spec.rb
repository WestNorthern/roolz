describe "Rool::Subset" do
  describe '#process' do

    before :each do
      @data = {
        fib_array: [1, 1, 2, 3, 5, 8, 13, 21],
        fib_o_NOT_ci: [0, 1, 1, 2, 3, 5, 62, 9],
        blank_array: [],
        boolean_array: [true, false, false, true, true],
        false_bool: [false, false],
        string_array: ['Texas', 'Utah', 'Oregon']
      }
    end

    ## Expect True

    it "returns true if the operand is a complete subset of the data key integer values" do
      expect(Rool::Subset.new(:fib_array, [1, 1, 2, 3, 5, 8, 13, 21]).process(@data)).to eq(true)
    end
    it "returns true if the operand is a complete subset of the data key boolean values" do
      expect(Rool::Subset.new(:boolean_array, [true, false]).process(@data)).to eq(true)
    end
    
    it "returns true if the operand is a complete subset of the data key string values" do
      expect(Rool::Subset.new(:string_array, ['Texas', 'Utah', 'Oregon']).process(@data)).to eq(true)
    end
    
    it "returns true if the operand and data keys are empty sets" do
      expect(Rool::Subset.new(:blank_array, []).process(@data)).to eq(true)
    end

    ## Expect False

    it "returns false if the operand is an incomplete subset of the data key string values" do
      expect(Rool::Subset.new(:string_array, ['Texas', 'Utah', 'Blue Oyster Cult']).process(@data)).to eq(false)
    end

    it "returns false if the operand is not a complete subset of the data key boolean values" do
      expect(Rool::Subset.new(:false_bool, [true]).process(@data)).to eq(false)
    end

    it "returns false if the value passed is not equal to the value in the data set" do
      expect(Rool::Subset.new(:fib_o_NOT_ci, [1, 2, 4, 5, 8, 13, 21]).process(@data)).to eq(false)
    end
    it "returns false if the operand is not an array" do
      expect(Rool::Subset.new(:fib_array, 'Texas').process(@data)).to eq(false)
    end
    it "returns false if the data_key is not an array" do
      expect(Rool::Subset.new(:fnot_array, [2, 4, 6, 8, 9]).process(@data)).to eq(false)
    end


    ## Result and Message Attributes

    it 'will have a false result attribute and a message after a return of false' do
      @operand = ['Texas', 'Utah', 'Blue Oyster Cult']
      @false_test = Rool::Subset.new(:string_array, @operand)
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "#{@operand} is not a valid subset of #{@data[:string_array]}")
    end
    it 'will have a false result attribute and a message after a false return if either argument is not an array or the arguments are incomparable' do
      @false_test = Rool::Subset.new(:fib_array, 'Texas')
      @false_test.process(@data)
      expect(@false_test).to have_attributes(result: false, message: "One of the arguments is not a valid set.")
    end

  end
end