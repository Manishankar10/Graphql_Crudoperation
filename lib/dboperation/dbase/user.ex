defmodule Dboperation.Dbase.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :job, :string
    field :name, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :job])
    |> validate_required([:name, :username, :password, :job])
    |> unique_constraint(:username)
  end
end
