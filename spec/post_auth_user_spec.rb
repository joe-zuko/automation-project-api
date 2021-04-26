describe "post auth user" do
  context "when successful login" do
    let(:user) { build(:user) }
    let(:result) { ApiUser.auth(user.to_hash) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response["user"]["email"]).to eql user.email }
  end

  context "when wrong password" do
    let(:result) { ApiUser.auth(build(:wrong_password_user_auth).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Invalid password" }
  end

  context "when empty password" do
    let(:result) { ApiUser.auth(build(:empty_password_user_auth).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Invalid password" }
  end

  context "when wrong email" do
    let(:result) { ApiUser.auth(build(:wrong_email_user_auth).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "User not found" }
  end

  context "when empty email" do
    let(:result) { ApiUser.auth(build(:empty_email_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "User not found" }
  end

  context "when null email" do
    let(:result) { ApiUser.auth(build(:null_email_user).to_hash) }

    it { expect(result.response.code).to eql "400" }
  end
end
