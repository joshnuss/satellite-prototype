defmodule Satellite.Ingestion do
  alias Satellite.{Error, Log, Metric, Repo, Request}

  def create_request(params) do
    Request.changeset(params)
    |> Repo.insert()
  end

  def create_log(params) do
    Log.changeset(params)
    |> Repo.insert()
  end

  def create_error(params) do
    Error.changeset(params)
    |> Repo.insert()
  end

  def create_metric(params) do
    Metric.changeset(params)
    |> Repo.insert()
  end
end
