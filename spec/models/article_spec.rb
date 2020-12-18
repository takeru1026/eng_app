require 'rails_helper'

RSpec.describe Article, type: :model do
  it "title,description,price, country, language, periodがある場合、有効である" do
    expect(FactoryBot.create(:article)).to be_valid
  end
  
  it "titleがnilの場合、無効である" do
    expect(FactoryBot.build(:article, title: "")).to_not be_valid 
  end
  
  it "descriptionがnilの場合、無効である" do
    expect(FactoryBot.build(:article, description: "")).to_not be_valid 
  end
  
  it "priceがnilの場合、無効である" do
    expect(FactoryBot.build(:article,price: "")).to_not be_valid 
  end
  
  it "languageがnilの場合、無効である" do
    expect(FactoryBot.build(:article, language: "")).to_not be_valid 
  end
  
  it "countryがnilの場合、無効である" do
    expect(FactoryBot.build(:article, country: "")).to_not be_valid 
  end
  
  it "periodがnilの場合、無効である" do
    expect(FactoryBot.build(:article, period: "")).to_not be_valid 
  end
  
  
end