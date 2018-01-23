require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should belong_to :user }
  it { should have_many :reviews }

  it { should allow_value("Travis").for(:name) }
  it { should_not allow_value("").for(:name) }

  it { should allow_value("500 summer street").for(:address) }
  it { should_not allow_value("").for(:address) }

  it { should allow_value("Boston").for(:city) }
  it { should_not allow_value("").for(:city) }

  it { should allow_value("MA").for(:state) }
  it { should_not allow_value("").for(:state) }

  it { should allow_value("00000").for(:zip) }
  it { should_not allow_value("0000").for(:zip) }

  it { should allow_value("this.img").for(:picture) }
  it { should_not allow_value("").for(:picture) }
end
