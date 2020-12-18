require 'rails_helper'

RSpec.describe User, type: :model do

  it "姓、名、メール、パスワードがある場合、有効である" do
    expect(FactoryBot.create(:user)).to be_valid
  end
  it "名がない場合、無効である" do
    expect(FactoryBot.build(:user, name: "")).to_not be_valid 
  end
  it "メールアドレスがない場合、無効である"  do
    expect(FactoryBot.build(:user, email: "")).to_not be_valid 
  end
  it "パスワードがない場合、無効である" do
    expect(FactoryBot.build(:user, password: "")).to_not be_valid 
  end

end