describe "Rool::True" do
  describe '#process' do
    it 'always returns true' do
      expect(Rool::True.new.process).to eq(true)
    end
  end
end
