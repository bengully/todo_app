require 'rails_helper'

RSpec.describe Todo, type: :model do 
    context 'when a task is specified' do 
        let(:todo) { Todo.new(task: 'make test') }

        it 'is valid' do
            expect(todo).to be_valid
        end

        it 'defaults to open status when created' do
            todo.save
            expect(todo.status).to eq 'open'
        end
    end

    context 'when no task is specified' do
        it 'is invalid' do
            expect(Todo.new).not_to be_valid
        end
    end
end