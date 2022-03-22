# frozen_string_literal: true

# Landing controller
class HomeController < ApplicationController
  protect_from_forgery except: :search_repositories
  before_action :github_api, only: %i[search_repositories]

  def index
    @results = {}
  end

  def search_repositories
    page = params[:page] || 1
    @results = @github_api.search_repositories(params[:search_query], page)
  end

  private

  def github_api
    @github_api = GithubApi.new
  end
end
