class UserModel
  attr_accessor :id, :name, :email, :password

  def to_hash
    {
      name: @name,
      email: @email,
      password: @password,
    }
  end
end
