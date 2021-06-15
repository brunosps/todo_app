module TodoList
  module Helper
    class Repository
      @instance = new

      private_class_method :new

      def self.instance
        @instance
      end

      def self.call
        @instance.repository
      end

      def repository
        @repository ||= {
          "todo-list": TodoList::Repository::TodoList::InMemory.new,
          "todo": TodoList::Repository::Todo::InMemory.new,
        }
      end
    end
  end
end
