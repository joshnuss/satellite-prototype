defmodule Satellite.Ingestion do
  alias Satellite.{ Repo, Request }

  def create_request(params) do
    Request.changeset(params)
    |> Repo.insert()
  end
end
