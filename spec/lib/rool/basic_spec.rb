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

end