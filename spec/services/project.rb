class ApiProject
  include HTTParty
  base_uri "http://18.228.225.71"
  headers "Content-Type" => "application/json"

  def self.find_projects(project_id, token)
    get("/projects/#{project_id}", :headers => { "Authorization" => "Bearer #{token}" })
  end

  def self.remove(project_id, token)
    delete("/projects/#{project_id}", :headers => { "Authorization" => "Bearer #{token}" })
  end

  def self.updated_projects(project_id, project, token)
    put("/projects/#{project_id}", body: project.to_json, :headers => { "Authorization" => "Bearer #{token}" })
  end

  def self.create_project(project, token)
    post("/projects", body: project.to_json, :headers => { "Authorization" => "Bearer #{token}" })
  end
end
