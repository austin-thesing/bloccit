require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

let (:my_advertisement) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_int) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_advertisement] to @advertisements" do
      get :index

      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
