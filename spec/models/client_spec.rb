require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryGirl.build_stubbed(:client)
  end

  describe 'creation' do
    it 'can be created' do
      expect(@client).to be_valid
    end
  end

  describe 'validations' do
    it 'can not be created if not valid' do
      @client = FactoryGirl.build_stubbed(:client)
      @client.source_app = nil
      @client.api_key = nil
      expect(@client).to_not be_valid
    end

    it 'has a unique source_app' do
      first_client = Client.create(source_app: "app_name", api_key: "I384fHtD1h9XZvs4fGPJUgtt")
      duplicate_client = Client.create(source_app: "app_name", api_key: "I384fHtD1h9XZvs4fGPJUgtt")
      expect(duplicate_client).to_not be_valid
    end
  end
end