defmodule Satellite.Ingestion do
  alias Satellite.{ Log, Repo, Request }

  def create_request(params) do
    Request.changeset(params)
    |> Repo.insert()
  end

  def create_log(params) do
    Log.changeset(params)
    |> Repo.insert()
  end
end
