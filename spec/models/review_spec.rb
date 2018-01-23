require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :restaurant }

  it { should allow_value(0).for(:rating) }
  it { should_not allow_value(nil).for(:rating) }

  it { should allow_value("hello").for(:body) }
end
