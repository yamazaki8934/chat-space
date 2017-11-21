require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  # userをcreateし、let内に格納
  let(:group) {create(:group)}
  let(:message) {create(:message)}

  describe 'GET #index' do
  context 'by login user' do
    before do
      login_user user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    it "assigns the requested group to @group" do
      group = create(:group)
      get :index, id: group
      expect(assigns(:group)).to eq tweet
    end

    it "assigns the requested message to @message" do
      message = create(:message)
      get :index, id: message
      expect(assigns(:message)).to eq message
    end

    it "renders the :index template" do
      message = create(:message)
      get :index, id: message
      expect(response).to render_template :index
    end
  end

  context 'by anonymous user' do
    it "is expected to redirect_to new_user_session_path" do
      get :index, id: group_id
      expect(response).to redirect_to :new_user_session_path
    end
  end
end


  describe 'POST #create' do
    describe 'by login user' do
      before do
        login_user user
        # controller_macros.rb内のlogin_userメソッドを呼び出し
      end
      context 'successfully saved messages' do
        it "successfully saved messages" do
          message = create(:message)
          get :create, id: message
          expect(assigns(:message)).to match(message)
        end

        it "is expected to redirect_to root_path" do
          get :create, id: message
          expect(response).to redirect_to :root_path
        end
      end

      context 'unsuccessfully saved messages' do
        it "unsuccessfully saved messages" do
          message = create(:message)
          message.valid?
          expect(message.errors[:message]).to include("を入力してください")
        end

        it "is expected to redirect_to root_path" do
          get :create, id: message
          expect(response).to redirect_to :root_path
        end
      end
      end

      describe 'by anonymous user' do
        it "is expected to redirect_to new_user_session_path" do
          get :create, id: group_id
          expect(response).to redirect_to :new_user_session_path
        end
      end
    end
  end
