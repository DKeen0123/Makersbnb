require 'user'

describe User do
  describe ".all" do
    it "returns an array of users" do
      expect(described_class.all.first.name).to eq("mike")
    end
  end

  describe ".authenticate" do 
    it "logs in existing user if email/password combination exists" do 
      user = described_class.create(name: "josh", email: "josh@test.com", password: "123")
      expect(User.authenticate(user.email, '123')).to eq user
    end
  end
end
