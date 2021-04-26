describe "get projects" do
  context "when I list all projects" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiProject.find_projects("", token) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when I list one project" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:project) { ApiProject.create_project(build(:new_project, assignedTo: user.id).to_hash, token) }
    let(:id_project) { project["project"].values[1] }
    let(:result) { ApiProject.find_projects(id_project, token) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when I searching a project that not exist" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiProject.find_projects("23ff", token) }

    it { expect(result.response.code).to eql "400" }
    it { expect(result.parsed_response["error"]).to eql "Error loading project" }
  end

  context "when token number is wrong" do
    let(:user) { build(:user) }
    let(:token) { ApiUser.token(user.email, user.password) }
    let(:result) { ApiProject.find_projects("", "xpto") }

    it { expect(result.response.code).to eql "401" }
    it { expect(result.parsed_response["error"]).to eql "Token invalid" }
  end
end
