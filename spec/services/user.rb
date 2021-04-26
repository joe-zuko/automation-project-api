class ApiUser
  include HTTParty
  base_uri "http://18.228.225.71"
  headers "Content-Type" => "application/json"

  def self.create(user)
    post("/auth/register", body: user.to_json)
  end

  def self.auth(user)
    post("/auth/authenticate", body: user.to_json)
  end

  def self.token(user_email, user_pass)
    result = post("/auth/authenticate", body: { email: user_email, password: user_pass }.to_json)
    "#{result.parsed_response["token"]}"
  end
end
