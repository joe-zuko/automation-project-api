describe "create a new project" do
  context "when new project" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiProject.create_project(build(:new_project, assignedTo: user.id).to_hash, token) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when wrong user ID" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiProject.create_project(build(:new_project, assignedTo: "iderrado").to_hash, token) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Error creating new project" }
  end
end
