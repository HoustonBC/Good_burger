require 'carrierwave/test/matchers'
require 'rails_helper'
describe AvatarUploader do
  include CarrierWave::Test::Matchers

  let(:brendan) { FactoryBot.create(:user) }
  before(:each) do
    sign_in(brendan)
  end


  let(:uploader) { AvatarUploader.new(brendan, :avatar) }

  before do
    AvatarUploader.enable_processing = true
    File.open("/Users/adam/challenges/Good_burger/public/uploads/tmp/1517509180-6066-0064-1755/blueburger.jpeg") { |f| uploader.store!(f) }
  end

  after do
    AvatarUploader.enable_processing = false
    uploader.remove!
  end

  context 'the thumb version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      expect(uploader.thumb).to have_dimensions(50, 45)
    end
  end

  context 'the small version' do
    it "scales down a landscape image to fit within 200 by 200 pixels" do
      expect(uploader).to be_no_larger_than(200, 200)
    end
  end

  it "makes the image readable only to the owner and not executable" do
    expect(uploader).to have_permissions(0644)
  end

  it "has the correct format" do
    expect(uploader).to be_format('jpeg')
  end
end
