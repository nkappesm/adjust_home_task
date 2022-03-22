# adjust_home_task
Ruby on Rails app for the hiring process at Adjust

## Ruby/Rails version

Ruby: `2.7.3`

Rails: `5.2.1`

## Configuration

1. Clone this repository and `cd` into it.

~~~
git clone git@github.com:nkappesm/adjust_home_task.git

cd /adjust_home_task
~~~

2. Set ruby version to 2.7.3

3. Install all dependencies

~~~
bundle install
~~~
~~~
yarn install
~~~

4. Add the database (postgresql) configuration file **config/database.yml**

~~~yml
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV["RAILS_MAX_THREADS"] { 5 } %>
development:
  <<: *default
  database: <%= ENV['DB_NAME_DEV'] %>
test:
  <<: *default
  database: database: <%= ENV['DB_NAME_TEST'] %>
production:
  <<: *default
  database: adjust_home_task_production
  username: adjust_home_task
  password: <%= ENV['ADJUST_HOME_TASK_DATABASE_PASSWORD'] %>
~~~

5. Create and migrate database

~~~
rails db:create db:migrate
~~~

6. Run server

~~~
rails s
~~~

### Further improvements

- Improve tests
- Add style to the view
- Improve page display and search
- Add advanced search params i.e. search by name, description, owner. Currently supported if you know the syntax
