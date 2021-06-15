RSpec.describe TodoList::Entities::Todo do
  subject { TodoList::Entities::Todo.new(title: "New Todo", list_id: 1, complete_at: Time.now) }

  it { expect(subject.title).to eq("New Todo") }

  it "Complete a todo" do
    subject.complete()

    expect(subject.complete_at).to eq(Time.now.round)
  end
end
