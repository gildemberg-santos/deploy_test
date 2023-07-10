# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful # response.success?
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = User.create! nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao'
      get :show, params: { id: post.to_param }
      expect(response).to be_successful # response.success?
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful # response.success?
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      post = User.create! nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao'
      get :edit, params: { id: post.to_param }
      expect(response).to be_successful # response.success?
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create,
               params: { user: { nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao' } }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created post' do
        post :create, params: { user: { nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao' } }
        expect(response).to redirect_to(User.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { titulo: 'titulo', drescricao: 'drescricao' }
      end

      it 'updates the requested user' do
        user = User.create! nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao'
        put :update, params: { id: user.to_param, user: new_attributes }
        user.reload
        expect(user.nome).to eq 'nome'
        expect(user.email).to eq 'email'
        expect(user.password).to eq 'password'
        expect(user.drescricao).to eq 'drescricao'
      end

      it 'redirects to the user' do
        user = User.create! nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao'
        put :update, params: { id: user.to_param, user: new_attributes }
        expect(response).to redirect_to(user)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      user = User.create! nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao'
      expect do
        delete :destroy, params: { id: user.to_param }
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the posts list' do
      user = User.create! nome: 'nome', email: 'email', password: 'password', drescricao: 'drescricao'
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(users_url)
    end
  end
end
