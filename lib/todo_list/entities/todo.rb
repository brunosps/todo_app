module TodoList
  module Entities
    class Todo
      attr_accessor :title, :list_id, :complete_at

      def initialize(title:, list_id:, complete_at: nil)
        @title = title
        @list_id = list_id
        @complete_at = complete_at
      end

      def complete
        @complete_at = Time.now.round
      end
    end
  end
end
