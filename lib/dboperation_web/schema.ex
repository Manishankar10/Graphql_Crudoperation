defmodule DboperationWeb.Schema do
  use Absinthe.Schema

  alias DboperationWeb.UserResolver

  object :user do
    field :id, non_null(:id)
    field :job, :string
    field :name, :string
    field :password, :string
    field :username, :string
  end
  query do
    @desc "fetching all users"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&UserResolver.all_users/3)
    end

    @desc "fetch particular user"
    field :user, non_null(:user) do
      arg :id, non_null(:id)
      resolve(&UserResolver.users/3)
    end
  end
  mutation do

    @desc "create a new user"
    field :create_user, :user do
      arg :job, :string
      arg :name, :string
      arg :password, :string
      arg :username, :string

      resolve(&UserResolver.create_user/3)
    end

    @desc "update an existing user"
    field :update_user, :user do
      arg :id, non_null(:id)
      arg :username, :string
      arg :password, :string
      arg :job, :string

      resolve(&UserResolver.update_user/3)
    end

    @desc "deleting a user"

    field :delete_user, :user do
      arg :id, non_null(:id)

      resolve(&UserResolver.delete_user/3)

    end
  end

end
