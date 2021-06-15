module TodoList::Repository::Todo
  class InMemory < TodoList::Repository::InMemory
    def create(todo:)
      super(resource: todo)
    end

    def update(todo_id:, todo:)
      super(resource_id: todo_id, resource: todo)
    end
  end
end
