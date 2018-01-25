describe "Rool::Blank" do


  before :each do
    @data = {
      num_test: 5,
      string_test: 'Ni Hao?',
      array_test: [3, 5, 6, 7, 8],
      bool_test: true
    }
  end


  describe '#to_json' do

    it 'converts a Basic class to json' do
      expect(Rool::Basic.new.to_json).to eql("{\n  \"^o\":\"Rool::Basic\",\n  \"data_key\":null,\n  \"operand\":null,\n  \"result\":true,\n  \"message\":null\n}\n")
    end
    it 'converts a nested class to json' do
      expect(Rool::Email.new.to_json).to eql("{\n  \"^o\":\"Rool::Email\",\n  \"data_key\":null,\n  \"operand\":null,\n  \"result\":true,\n  \"message\":null\n}\n")
    end
  end

  describe '#from_json' do

    it 'converts to a Basic class from json with ^o key of basic' do
      @basic_test = Rool::Basic.new.to_json
      expect(Rool::Basic.from_json(@basic_test)).to be_a_kind_of(Rool::Basic)
    end
    it 'converts to a Basic class from json with ^o key of a nested' do
      @nested_test = Rool::Email.new.to_json
      expect(Rool::Basic.from_json(@nested_test)).to be_a_kind_of(Rool::Basic)
    end
    it 'converts to a nested class from json with ^o key of the same nested class' do
      @nested_test = Rool::Email.new.to_json
      expect(Rool::Email.from_json(@nested_test)).to be_a_kind_of(Rool::Email)
    end
    it 'returns nil when trying to convert a nested class from json with ^o key of a different nested class' do
      @nested_test = Rool::Email.new.to_json
      expect(Rool::Equal.from_json(@nested_test)).to be(nil)
    end
  end

end