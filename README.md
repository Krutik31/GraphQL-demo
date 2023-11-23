# GraphQL in Rails

In this directory, I have practiced and implemented GraphQl in rails.

### GraphQL Installation:

#### Step 1:

in Gemfile,

```
  gem 'graphql'

  group :development do
    gem 'graphiql-rails'
  end
```

run **bundle** command in console for adding the gems in your project.

#### Step 2:

Execute the following command for installing graphql in the project. this will create some boilerplate graphql files in **app/graphql** folder.

```
  rails g graphql:install
```

#### Step 3:

Add following lines in **app/assets/config/manifest.js**, if you want to use graphiql IDE playground for testing GraphQL queries and mutations.

```
  //= link graphiql/rails/application.css
  //= link graphiql/rails/application.js
```

### GraphQL Commands:

For creating new object

```
  rails g graphql:object <OBJECT>
  eg:
    rails g graphql:object user
```

For generating Mutations

```
  For inserting the data:
    rails g graphql:mutation_create <OBJECT>

  For updating the data:
    rails g graphql:mutation_update <OBJECT>

  For deleting the data:
    rails g graphql:mutation_delete <OBJECT>
```

### GraphQL Authentication

Here GraphQL authentication has been done by using the session storage logic. checkout following files for more.

**_app/controllers/graphql_controller.rb_**

**_app/graphql/mutations/login.rb_**

**_app/graphql/mutations/logout.rb_**

### GraphQL Authorization

User will have role either an admin or a client. Only admins can change every users profiles but client can only change their profiles. checkout following files for more.

**_app/graphql/mutations/user_update.rb_**
