defmodule SatelliteWeb.API.MetricController do
  use SatelliteWeb, :controller

  alias Satellite.Ingestion

  def create(conn, params) do
    case Ingestion.create_metric(params) do
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(SatelliteWeb.ErrorHelpers)
        |> render("error.json", changeset: changeset)

      {:ok, _request} ->
        conn
        |> put_status(:created)
        |> put_view(SatelliteWeb.API.DefaultView)
        |> render("created.json")
    end
  end
end
