describe "post new user" do
  context "when new user" do
    let(:result) { ApiUser.create(build(:new_user).to_hash) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when duplicate email" do
    let(:result) { ApiUser.create(build(:user).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "User Already Exists" }
  end

  context "when empty email" do
    let(:result) { ApiUser.create(build(:empty_email_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Registration failed" }
  end

  context "when empty password" do
    let(:result) { ApiUser.create(build(:empty_password_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Registration failed" }
  end

  context "when null email" do
    let(:result) { ApiUser.create(build(:null_email_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
  end

  context "when null password" do
    let(:result) { ApiUser.create(build(:null_password_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
  end
end
