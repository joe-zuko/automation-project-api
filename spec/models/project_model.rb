class ProjectModel
  attr_accessor :title, :description, :tasks, :name, :assignedTo

  def to_hash
    {
      title: @title,
      description: @description,
      tasks: [{
        name: @name,
        assignedTo: @assignedTo,
      }],
    }
  end
end
