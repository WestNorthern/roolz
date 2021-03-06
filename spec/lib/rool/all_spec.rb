
describe "Rool::All" do
  describe '#process' do

  	## Expect True

    it 'returns true if all the children rules are true for the dataset' do
      expect(Rool::All.new(Rool::True.new, Rool::True.new).process).to be(true)
    end

    it 'returns true if all the children rules are true for the dataset when nested two deep' do
      expect(Rool::All.new(Rool::All.new(Rool::True.new, Rool::True.new), Rool::All.new(Rool::True.new, Rool::True.new)).process).to be(true)
    end

    ## Expect False

    it 'returns false if any of the children rules are false for the dataset' do
      expect(Rool::All.new(Rool::False.new, Rool::True.new).process).to be(false)
    end

    ## Result Attribute

    it 'will have a false result attribute after a false return' do
      @false_test = Rool::All.new(Rool::False.new, Rool::True.new)
      @false_test.process
      expect(@false_test).to have_attributes(result: false)
    end

    it 'will have a true result attribute after a true return' do
      @true_test = Rool::All.new(Rool::True.new)
      @true_test.process
      expect(@true_test).to have_attributes(result: true)
    end
   
  end

  describe '#message' do
  	before :each do
	    @data = {
	      one: 1,
	      two: 2,
	      name: "T'Kuvma",
	      email_fail: '@gmail.ryan',
	      email_pass: 'ryan@gmail.com',
	      foo: 'bar',
	      an_array: [1, 2, 3, 4, 5],
	      blank_val: nil,
	    }

	    # All of these tests will return false

	    @blank_test = Rool::Blank.new(:one)
    	@false_test = Rool::False.new
    	@email_test = Rool::Email.new(:email_fail)
    	@equal_test = Rool::Equal.new(:one, 2)
    	@greater_test = Rool::GreaterThan.new(:one, -10)
    	@less_test = Rool::LessThan.new(:one, 10)
    	@include_test = Rool::Include.new(:one, 'bar')
    	@regex_test = Rool::Regex.new(:name, /DenverDurham/i)
    	@subset_test = Rool::Subset.new(:an_array, [4, 5, 6])

    	# All of these tests will pass
    	@blank_pass = Rool::Blank.new(:blank_val)
    	@true_test = Rool::True.new

  	end

  	## Message Test

    it 'returns an array of messages from children methods that all test false' do
      expect(Rool::All.new(Rool::False.new, @blank_test).message(@data)).to eql(["This method automatically returns False.", "The value of 1 is not blank."])
    end
    it 'returns an array of one if one argument that evaluates to false is passed in' do
      expect(Rool::All.new(@subset_test).message(@data)).to eql(["[4, 5, 6] is not a valid subset of [1, 2, 3, 4, 5]"])
    end
    it 'returns only an array of messages from children methods that test false' do
      expect(Rool::All.new(@email_test, @blank_pass, @regex_test, @equal_test, @true_test).message(@data)).to eql(["@gmail.ryan is probably not an e-mail address.", "(?i-mx:DenverDurham) cannot be found in the data set with regexp.", "1 is not equal to 2"])
    end
  end

  describe '#to_json' do

    it 'converts a container class and children to json' do
      expect(Rool::All.new(Rool::True.new, Rool::True.new).to_json).to eql("{\n  \"^o\":\"Rool::All\",\n  \"children\":[\n    {\n      \"^o\":\"Rool::True\",\n      \"data_key\":null,\n      \"operand\":null,\n      \"result\":null,\n      \"message\":null\n    },\n    {\n      \"^o\":\"Rool::True\",\n      \"data_key\":null,\n      \"operand\":null,\n      \"result\":null,\n      \"message\":null\n    }\n  ],\n  \"result\":null\n}\n")
    end

    it 'converts a container class and children to json nested two deep' do
      expect(Rool::All.new(Rool::All.new(Rool::True.new, Rool::True.new), Rool::All.new(Rool::True.new, Rool::True.new)).to_json).to eql("{\n  \"^o\":\"Rool::All\",\n  \"children\":[\n    {\n      \"^o\":\"Rool::All\",\n      \"children\":[\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":null,\n          \"message\":null\n        },\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":null,\n          \"message\":null\n        }\n      ],\n      \"result\":null\n    },\n    {\n      \"^o\":\"Rool::All\",\n      \"children\":[\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":null,\n          \"message\":null\n        },\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":null,\n          \"message\":null\n        }\n      ],\n      \"result\":null\n    }\n  ],\n  \"result\":null\n}\n")
    end

    it 'returns children with processed methods after container is processed' do
    	@processed = Rool::All.new(Rool::True.new, Rool::False.new)
    	@processed.process(@data) 
    	expect(@processed.to_json).to eq("{\n  \"^o\":\"Rool::All\",\n  \"children\":[\n    {\n      \"^o\":\"Rool::True\",\n      \"data_key\":null,\n      \"operand\":null,\n      \"result\":true,\n      \"message\":null\n    },\n    {\n      \"^o\":\"Rool::False\",\n      \"data_key\":null,\n      \"operand\":null,\n      \"result\":false,\n      \"message\":\"This method automatically returns False.\"\n    }\n  ],\n  \"result\":false\n}\n")
    end

    it 'returns children with processed methods after container is processed nested two deep' do
    	@processed = Rool::All.new(Rool::All.new(Rool::True.new, Rool::True.new), Rool::All.new(Rool::True.new, Rool::True.new))
    	@processed.process(@data) 
    	expect(@processed.to_json).to eq("{\n  \"^o\":\"Rool::All\",\n  \"children\":[\n    {\n      \"^o\":\"Rool::All\",\n      \"children\":[\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":true,\n          \"message\":null\n        },\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":true,\n          \"message\":null\n        }\n      ],\n      \"result\":true\n    },\n    {\n      \"^o\":\"Rool::All\",\n      \"children\":[\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":true,\n          \"message\":null\n        },\n        {\n          \"^o\":\"Rool::True\",\n          \"data_key\":null,\n          \"operand\":null,\n          \"result\":true,\n          \"message\":null\n        }\n      ],\n      \"result\":true\n    }\n  ],\n  \"result\":true\n}\n")
    end
    
  end

  describe '#from_json' do

    it 'converts to a container class with nested objects from json' do
      @container_test = Rool::All.new(Rool::True.new, Rool::True.new).to_json
      expect(Rool::Container.from_json(@container_test)).to be_a_kind_of(Rool::Container)
    end

    it 'converts All class with nested objects from json' do
      @all_test = Rool::All.new(Rool::True.new, Rool::True.new).to_json
      expect(Rool::Container.from_json(@all_test)).to be_a_kind_of(Rool::All)
    end
    
    it 'returns nil when trying to convert a nested class from json with ^o key of a different nested class' do
      @test = Rool::All.new(Rool::True.new, Rool::True.new).to_json
      expect(Rool::Any.from_json(@test)).to be(nil)
    end
  end
end



