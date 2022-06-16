defmodule DboperationWeb.UserResolver do
  alias Dboperation.Dbase

  def all_users(_root, _args, _) do
    {:ok, Dbase.list_users()}
  end

  def users(_root, %{id: id}, _info) do
    user= Dbase.get_user!(id)
    {:ok, user}
  end

  def create_user(_root, args, _info) do
    case Dbase.create_user(args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not create user"}
    end
  end

  def update_user(_root, %{ id: id, username: username, password: password, job: job}, _info) do
    user = Dbase.get_user!(id)

    case Dbase.update_user(user,%{username: username, password: password, job: job}) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not update user"}
    end
  end

  def delete_user(_root, %{id: id}, _info) do
    user= Dbase.get_user!(id)

    case Dbase.delete_user(user) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not delete user"}
    end
  end

end
