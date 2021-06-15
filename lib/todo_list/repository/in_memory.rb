module TodoList
  module Repository
    class InMemory
      attr_accessor :DB

      def initialize()
        @DB = {}
      end

      def create(resource:)
        save(get_next_id, resource)
      end

      def update(resource_id:, resource:)
        save(resource_id, resource) if exists(resource_id)
      end

      def find(resource_id)
        @DB[resource_id] if exists(resource_id)
      end

      def delete(resource_id)
        @DB.delete(resource_id) if exists(resource_id)
      end

      def exists(resource_id)
        @DB.key?(resource_id)
      end

      def all()
        @DB
      end

      private

      def save(resource_id, resource)
        @DB[resource_id] = resource
        resource_id
      end

      def get_next_id
        @DB.size + 1
      end
    end
  end
end
