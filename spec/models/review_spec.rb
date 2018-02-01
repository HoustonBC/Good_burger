require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :restaurant }

  it { should allow_value("this").for(:title) }
  it { should_not allow_value("").for(:title) }

  it { should allow_value(1).for(:rating) }
  it { should_not allow_value(nil).for(:rating) }

  it { should allow_value(3).for(:rating) }
  it { should_not allow_value(nil).for(:rating) }

  it { should allow_value("hello").for(:body) }

end
