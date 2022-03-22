# frozen_string_literal: true

# In charge of handling the connection to the GithubApi and its preferred defaults
class GithubApi
  def initialize
    @connection = Github.new
  end

  def search_repositories(search_query, page)
    return {} if search_query.blank?

    @connection.search.repositories(search_query + privacy, page: page)
  end

  def privacy
    ' is:public'
  end
end
