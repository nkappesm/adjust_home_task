# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET home#index' do
    it 'renders index template' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET home#search_repositories' do
    let(:search_results) do
      {
        items: {
          full_name: 'test',
          owner: { login: 'owner' },
          html_url: 'https://google.com'
        }
      }
    end

    it 'renders github repositories' do
      allow_any_instance_of(GithubApi).to receive(:search_repositories).and_return(search_results)
      expect(get(home_search_repositories_path, xhr: true)).to eq(200)
    end
  end
end
