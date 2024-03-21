require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    it 'is valid with a title and website_url' do
      link = Link.new(title: 'Example Link', website_url: 'https://example.com')
      expect(link).to be_valid
    end

    it 'is invalid without a title' do
      link = Link.new(website_url: 'https://example.com')
      expect(link).to_not be_valid
    end

    it 'is invalid without a website_url' do
      link = Link.new(title: 'Example Link')
      expect(link).to_not be_valid
    end
  end
end