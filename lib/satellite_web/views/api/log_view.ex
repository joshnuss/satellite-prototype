defmodule SatelliteWeb.API.LogView do
  use SatelliteWeb, :view

  def render("created.json", _) do
    %{message: "created"}
  end
end
