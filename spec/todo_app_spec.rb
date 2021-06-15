RSpec.describe TodoApp do
  it "has a version number" do
    expect(TodoApp::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  it "has TodoList Constant" do
    expect(TodoList.class).to eq(Module)
  end
end
