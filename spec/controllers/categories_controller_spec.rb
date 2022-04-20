require 'rails_helper'

RSpec.describe CategoriesController do
    describe 'GET #show' do
        it "assigns the requested category to @category" do
          category = create(:category)
          get :show, params: { id: category }
          expect(assigns(:category)).to eq category
        end
    
        it "renders the :show template" do
          category = create(:category)
          get :show, params: { id: category }
          expect(response).to render_template :show
        end
    end

    describe 'GET #index' do
        context 'with params[:letter]' do
          it "populates an array of categories starting with the letter" do
            nasi_uduk = create(:category, name: "Nasi Uduk")
            kerak_telor = create(:category, name: "Kelar Telor")
            get :index, params: { letter: 'N' }
            expect(assigns(:categories)).to match_array([nasi_uduk])
        end
    
        it "renders the :index template" do
            get :index, params: { letter: 'N' }
            expect(response).to render_template :index
          end
        end
    
        context 'without params[:letter]' do
          it "populates an array of all categories" do 
            nasi_uduk = create(:category, name: "Nasi Uduk")
            kerak_telor = create(:category, name: "Kelar Telor")
            get :index
            expect(assigns(:categories)).to match_array([nasi_uduk, kerak_telor])
        end
    
        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
          end
        end
      end

      context "with invalid attributes" do
        it "does not save the new category in the database" do
          expect{
            post :create, params: { category: attributes_for(:invalid_category) }
          }.not_to change(Category, :count)
        end
  
        it "re-renders the :new template" do
          post :create, params: { category: attributes_for(:invalid_category) }
          expect(response).to render_template :new
        end
    end

    describe 'PATCH #update' do
        before :each do
          @category = create(:category)
        end
        
        context "with valid attributes" do
          it "locates the requested @category" do
            patch :update, params: { id: @category, category: attributes_for(:category) }
            expect(assigns(:category)).to eq @category
          end
    
          it "changes @category's attributes" do
            patch :update, params: { id: @category, category: attributes_for(:category, name: 'Nasi Uduk') }
            @category.reload
            expect(@category.name).to eq('Nasi Uduk')
          end
    
          it "redirects to the category" do
            patch :update, params: { id: @category, category: attributes_for(:category) }
            expect(response).to redirect_to @category
          end
        end
    
        context "with invalid attributes" do
          it 'does not save the updated category in the database' do
            patch :update, params: { id: @category, category: attributes_for(:invalid_category, name: 'Nasi Uduk', price: "Test") }
            expect(@category.name).not_to eq('Nasi Uduk')
          end
    
          it 're-renders the edit template' do
            patch :update, params: { id: @category, category: attributes_for(:invalid_category) }
            expect(assigns(:category)).to eq @category
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
    end

    describe 'DELETE #destroy' do
        before :each do
          @category = create(:category)
        end
    
        it "deletes the category from the database" do
          expect{
            delete :destroy, params: { id: @category }
          }.to change(Category, :count).by(-1)
        end
    
        it "redirects to categories#index" do
          delete :destroy, params: { id: @category }
          expect(response).to redirect_to category_path
        end
    end
end