module TodoList::Repository::TodoList
  class InMemory < TodoList::Repository::InMemory
    def create(todo_list:)
      super(resource: todo_list)
    end

    def update(list_id:, todo_list:)
      super(resource_id: list_id, resource: todo_list)
    end
  end
end
