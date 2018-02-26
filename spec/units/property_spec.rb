require 'property'

describe Property do
  describe ".all" do
    it "returns an array of the properties" do
      expect(described_class.all.first.email).to eq "test@example.com"
    end
  end

  describe ".create" do
    it "creates a new property resource" do
      described_class.create(email: "another_test@example.com", url: "http://example_url.com")
      expect(described_class.all.map(&:email)).to include("another_test@example.com")
    end
  end

end
