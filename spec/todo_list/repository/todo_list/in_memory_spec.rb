RSpec.describe TodoList::Repository::TodoList::InMemory do
  subject { TodoList::Repository::TodoList::InMemory.new() }
  it "Initialize object" do
    expect(subject.class).to eq(TodoList::Repository::TodoList::InMemory)
  end

  it "Create a new todo list" do
    list = TodoList::Entities::TodoList.new(title: "New todo list")
    expect(subject.create(todo_list: list)).to eq(1)
    expect(subject.create(todo_list: list)).to eq(2)
  end

  it "Find a todo list" do
    list = TodoList::Entities::TodoList.new(title: "New todo list")
    list_id = subject.create(todo_list: list)

    expect(subject.find(list_id)).to eq(list)
  end

  it "Check if a list id exists" do
    5.times do
      list = TodoList::Entities::TodoList.new(title: "New todo list")
      list_id = subject.create(todo_list: list)
    end

    expect(subject.exists(1)).to be_truthy
    expect(subject.exists(6)).to be_falsy
  end

  it "Updates a todo list" do
    title = "New todo list"
    new_title = "My Newerrrr todo list"

    list = TodoList::Entities::TodoList.new(title: title)
    list_id = subject.create(todo_list: list)

    expect(subject.exists(1)).to be_truthy
    expect(subject.find(1)).to eq(list)
    expect(subject.find(1).title).to eq(title)

    subject.update(todo_list: TodoList::Entities::TodoList.new(title: new_title), list_id: list_id)

    expect(subject.find(1).title).to eq(new_title)
  end

  it "Delete a todo list" do
    title = "New todo list"
    list = TodoList::Entities::TodoList.new(title: title)
    list_id = subject.create(todo_list: list)
    list_id = subject.create(todo_list: list)

    expect(subject.exists(list_id)).to be_truthy

    deleted = subject.delete(list_id)

    expect(subject.exists(list_id)).to be_falsy
    expect(list).to eq(deleted)
  end

  it "Get all todo list" do
    5.times do |t|
      title = "New todo list #{t}"
      list = TodoList::Entities::TodoList.new(title: title)
      list_id = subject.create(todo_list: list)
    end

    expect(subject.all.size).to eq(5)
  end
end
