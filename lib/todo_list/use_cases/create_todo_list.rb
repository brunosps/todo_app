module TodoList
  module UseCases
    class CreateTodoList
      def self.call(title:, repository:)
        repository[:"todo-list"].create(todo_list: todo_list(title: title))
      end

      private

      def self.todo_list(title:)
        TodoList::Entities::TodoList.new(title: title)
      end
    end
  end
end
