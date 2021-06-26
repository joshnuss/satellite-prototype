defmodule SatelliteWeb.API.ErrorController do
  use SatelliteWeb, :controller

  alias Satellite.Ingestion

  def create(conn, params) do
    case Ingestion.create_error(params) do
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
