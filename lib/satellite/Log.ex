defmodule Satellite.Log do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @timestamps_opts updated_at: false
  schema "logs" do
    field :request_id, :string
    field :type, :string
    field :host, :string
    field :app, :string
    field :environment, :string
    field :language, :string
    field :client, :string
    field :ip, :string
    field :commit, :string
    field :message, :string
    field :data, Satellite.Types.JSON

    timestamps(inserted_at: :timestamp)
  end
end
