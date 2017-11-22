require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) {create(:user)}
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
        get :index, group_id: group
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested message to @message" do
        get :index, group_id: group
        expect(assigns(:message)).to have_attributes(id: nil, user_id: nil, group_id: nil, body: nil, created_at: nil, updated_at: nil)
      end

      it "renders the :index template" do
        message = create(:message)
        get :index, group_id: group.id
        expect(response).to render_template :index
      end
    end

    context 'by anonymous user' do
      it "is expected to redirect_to new_user_session_path" do
        get :index, group_id: group.id
        expect(response).to redirect_to :new_user_session
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
          post :create, group_id: group.id, user_id: user.id, message: attributes_for(:message, body: message.body)
          #, message: { user_id: message.user_id,
            #body: message.body,
            #image: message.image  }
          expect(assigns(:message)).to have_attributes(user_id: user.id,
            group_id: Message.last.group_id,
            body: message.body)
          expect(assigns(:message).image).not_to eq nil
        end

        it "is expected to redirect_to group_messages_path" do
          post :create, group_id: group.id,message: { user_id: message.user_id,
            body: message.body,
            image: message.image  }

          expect(response).to redirect_to group_messages_path(Message.last.group)
        end
      end
      context 'unsuccessfully saved messages' do
        it "unsuccessfully saved messages" do
          post :create, group_id: group.id,message: { user_id: message.user_id,
            body: nil,
            image: message.image  }

          expect(flash.now[:notice]).to include "を入力してください"
        end

        it "is expected to redirect_to root_path" do
          post :create, group_id: group.id,message: { user_id: message.user_id,
            body: message.body,
            image: message.image  }

          expect(response).to redirect_to group_messages_path
        end
      end
    end
    describe 'by anonymous user' do
      it "is expected to redirect_to new_user_session_path" do
        post :create, group_id: group.id,message: { user_id: message.user_id,
          body: message.body,
          image: message.image  }

        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
