defmodule SatelliteWeb.API.DefaultView do
  use SatelliteWeb, :view

  def render("created.json", _) do
    %{message: "created"}
  end
end
