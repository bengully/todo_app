require 'rails_helper'

RSpec.describe Todo, type: :model do
    let(:todo) { Todo.new(task: 'make test') } 

    it 'is valid with a task' do
        expect(todo).to be_valid
    end
    
    it 'defaults to open status when created' do
        todo.save
        expect(todo.status).to eq 'open'
    end
end