describe "delete projects" do
  context "when I delete project" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:project) { ApiProject.create_project(build(:new_project, assignedTo: user.id).to_hash, token) }
    let(:id_project) { project["project"].values[1] }
    let(:result) { ApiProject.remove(id_project, token) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when project ID is wrong" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiProject.remove("453", token) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Error deleting project" }
  end
end
