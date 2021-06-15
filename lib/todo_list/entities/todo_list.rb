module TodoList
  module Entities
    class TodoList
      attr_accessor :title, :todos

      def initialize(title:, todos: [])
        @title = title
        @todos = todos
      end

      def add_item(item)
        @todos << item
      end

      def get_list
        @todos
      end
    end
  end
end
