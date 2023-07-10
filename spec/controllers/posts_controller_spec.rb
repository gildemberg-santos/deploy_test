# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful # response.success?
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = Post.create! titulo: 'titulo', drescricao: 'drescricao'
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
      post = Post.create! titulo: 'titulo', drescricao: 'drescricao'
      get :edit, params: { id: post.to_param }
      expect(response).to be_successful # response.success?
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create, params: { post: { titulo: 'titulo', drescricao: 'drescricao' } }
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post :create, params: { post: { titulo: 'titulo', drescricao: 'drescricao' } }
        expect(response).to redirect_to(Post.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { titulo: 'titulo', drescricao: 'drescricao' }
      end

      it 'updates the requested post' do
        post = Post.create! titulo: 'titulo', drescricao: 'drescricao'
        put :update, params: { id: post.to_param, post: new_attributes }
        post.reload
        expect(post.titulo).to eq 'titulo'
        expect(post.drescricao).to eq 'drescricao'
      end

      it 'redirects to the post' do
        post = Post.create! titulo: 'titulo', drescricao: 'drescricao'
        put :update, params: { id: post.to_param, post: new_attributes }
        expect(response).to redirect_to(post)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = Post.create! titulo: 'titulo', drescricao: 'drescricao'
      expect do
        delete :destroy, params: { id: post.to_param }
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      post = Post.create! titulo: 'titulo', drescricao: 'drescricao'
      delete :destroy, params: { id: post.to_param }
      expect(response).to redirect_to(posts_url)
    end
  end
end
