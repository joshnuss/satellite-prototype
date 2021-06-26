defmodule Satellite.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @timestamps_opts updated_at: false
  schema "metrics" do
    field :request_id, :string
    field :name, :string
    field :type, :string
    field :host, :string
    field :app, :string
    field :environment, :string
    field :language, :string
    field :client, :string
    field :value, :integer
    field :tags, {:array, :string}

    timestamps(inserted_at: :timestamp)
  end
end
