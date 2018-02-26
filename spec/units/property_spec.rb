require 'property'

describe Property do
  describe ".all" do
    it "returns an array of the properties" do
      expect(described_class.all.first.email).to eq "test@example.com"
    end
  end
end
