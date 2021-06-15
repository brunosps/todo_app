module TodoList
  module UseCases
    class AddTodo
      def self.call(title:, list_id:, repository:)
        repository[:"todo"].create(todo: todo(title: title, list_id: list_id)) if repository[:"todo-list"].exists(list_id)
      end

      private

      def self.todo(title:, list_id:)
        TodoList::Entities::Todo.new(title: title, list_id: list_id)
      end
    end
  end
end
