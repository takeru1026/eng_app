require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    
    before do
      @user = FactoryBot.create(:user)
      @article= FactoryBot.create(:article)
    end
    
    describe "#index" do
    # 正常なレスポンスか？
      it "responds successfully" do
        get :index
        expect(response).to be_success
      end
    # 200レスポンスが返ってきているか？
      it "returns a 200 response" do
        get :index
        expect(response).to have_http_status "200"
      end
    end
    
    describe 'POST #create' do
        it "saves the new contact in the database" do
          article_params= FactoryBot.attributes_for(:article)
          sign_in @user
          expect{
            post :create, params: { article: article_params }
          }.to change(Article, :count).by(1)
        end
        it "redirects to articles#index" do
          article_params= FactoryBot.attributes_for(:article)
          sign_in @user
          post :create, params: { article: article_params }
          expect(response).to redirect_to articles_path
        end
    end
    
    describe 'patch #update' do
      it "locates the requersted @article" do
        article_params= {title: "うんこちゃん"}
        sign_in @user
        
        patch :update, params: { id: @article.id , article: article_params }
        expect(@article.reload.title).to eq "うんこちゃん"
      end
      
      it 'changes @artiles' do
        article_params= { title: 'hoge', description: 'wwwww', price: '1', country: 'canada', language: 'french', period: '3month'}
        sign_in @user
        
        patch :update, params: { id: @article.id, article: article_params }
        @article.reload
        expect(@article.title).to eq("hoge")
        expect(@article.description).to eq("wwwww")
        expect(@article.price).to eq("1")
        expect(@article.country).to eq("canada")
        expect(@article.language).to eq("french")
        expect(@article.period).to eq("3month")
      end
    end
    
    it "redirects the page to /articles/article.id(1)" do
        sign_in @user
        article_params = {title: "うんこちゃん"}
        patch :update, params: {id: @article.id, article: article_params}
        expect(response).to redirect_to articles_path
    end
    
     describe "#destroy" do
       context "as an authorized user" do
      # 正常に記事を削除できるか？
        it "deletes an article" do
          article_params= FactoryBot.attributes_for(:article)
          sign_in @user
          expect {
            delete :destroy, params: {id: @article.id, article: article_params}
          }.to change(Article, :count).by(-1)
        end
      # 記事を削除した後、ルートページへリダイレクトしているか？
        it "redirects the page to root_path" do
          sign_in @user
          delete :destroy, params: {id: @article.id}
          expect(response).to redirect_to articles_path
        end
       end
     end
      
end