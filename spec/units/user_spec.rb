require 'user'

describe User do
  describe ".all" do
    it "returns an array of users" do
      expect(described_class.all.first.name).to eq("mike")
    end
  end
end
