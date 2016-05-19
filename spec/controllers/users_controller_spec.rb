require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    let(:users) { create_list(:user, 5, distance: 90000) }

    it "populates an array of all user's albums" do
      users
      get :index, distance: '100'
      expect(assigns(:users)).to match_array(users)
    end

    it 'it change number of users in database' do
      expect { get :index}.to change(User, :count).by(32)
    end

    it 'should  receive import! for User' do
      expect(User).to receive(:import!)
      get :index
    end

    it 'render index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end
