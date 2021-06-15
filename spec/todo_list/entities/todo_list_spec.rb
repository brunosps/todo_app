RSpec.describe TodoList::Entities::TodoList do
  subject { TodoList::Entities::TodoList.new(title: "My todo list") }

  it "Creates a todo list" do 
      expect(subject.title).to eq("My todo list")
  end
end
