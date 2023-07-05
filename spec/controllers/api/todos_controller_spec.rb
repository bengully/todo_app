require 'rails_helper'

RSpec.describe Api::TodosController, type: :controller do
    describe 'Index' do
        before { create(:todo) }
        
        it 'returns all todos' do
            get :index

            json_response = JSON.parse(response.body)
            expect(json_response.first['task']).to eq 'Make a test'
            expect(json_response.first['description']).to eq 'Have test work'
            expect(json_response.first['status']).to eq 'open'
        end
    end

    describe 'Create' do
        let(:task) { 'Create todo' }
        let(:description) { 'Maybe it will work' }

        it 'creates a todo' do
            expect{
                post :create, params: { task: 'Create todo', description: 'Maybe it will work' }
            }.to change(Todo, :count).by(1)

            json_response = JSON.parse(response.body)
            expect(json_response['task']).to eq task
            expect(json_response['description']).to eq description
        end
    end

    describe 'Destroy' do
        let!(:todo) { create(:todo) }

        it 'deletes a todo' do 
            expect{ delete :destroy, params: { id: todo.id } }.to change(Todo, :count).by(-1)

            expect(Todo.all).not_to include(todo)
        end
    end
end
