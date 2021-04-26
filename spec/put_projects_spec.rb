describe "put project" do
  context "when modify project" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:original_project) { ApiProject.create_project(build(:new_project, assignedTo: user.id).to_hash, token) }
    let(:id_original_project) { original_project["project"].values[1] }
    let(:new_project) { build(:updated_project, assignedTo: user.id) }
    let(:result) { ApiProject.updated_projects(id_original_project, new_project.to_hash, token) }

    it { puts result }
    it { expect(result.response.code).to eql "200" }
  end

  context "when project ID is wrong" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:original_project) { ApiProject.create_project(build(:new_project, assignedTo: user.id).to_hash, token) }
    let(:id_original_project) { original_project["project"].values[1] }
    let(:new_project) { build(:updated_project, assignedTo: user.id) }
    let(:result) { ApiProject.updated_projects("id_errado", new_project.to_hash, token) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Error creating new project" }
  end
end
