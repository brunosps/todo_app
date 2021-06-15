RSpec.describe TodoList::UseCases::CreateTodoList do
  it "Create todo list" do
    title = "New Todo List"

    repository = TodoList::Helper::Repository.()

    list_id = TodoList::UseCases::CreateTodoList.(title: title, repository: repository)

    expect(repository[:"todo-list"].exists(list_id)).to be_truthy
    expect(repository[:"todo-list"].find(list_id).title).to eq(title)
  end
end
