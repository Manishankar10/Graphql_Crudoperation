defmodule Dboperation.Repo do
  use Ecto.Repo,
    otp_app: :dboperation,
    adapter: Ecto.Adapters.Postgres
end
