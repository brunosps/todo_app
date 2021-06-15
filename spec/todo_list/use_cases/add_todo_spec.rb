RSpec.describe TodoList::UseCases::AddTodo do
  it "Create a todo" do
    repository = TodoList::Helper::Repository.()

    list_id = TodoList::UseCases::CreateTodoList.(title: "My list", repository: repository)

    todo_title = "My todo title"
    TodoList::UseCases::AddTodo.(title: todo_title, list_id: list_id, repository: repository)

    expect(repository[:"todo"].exists(1)).to be_truthy
    expect(repository[:"todo"].exists(2)).to be_falsy
    expect(repository[:"todo"].find(1).title).to eq(todo_title)
    expect(repository[:"todo"].find(1).list_id).to eq(list_id)
  end
end
