defmodule Satellite.Repo do
  use Ecto.Repo,
    otp_app: :satellite,
    adapter: Ecto.Adapters.Postgres
end
