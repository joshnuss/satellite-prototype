defmodule Satellite.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  @metric_types ~w(counter)

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

  def changeset(params) do
    %__MODULE__{tags: []}
    |> cast(params, [
      :request_id,
      :name,
      :type,
      :value,
      :host,
      :app,
      :environment,
      :client,
      :language,
      :tags
    ])
    |> validate_required([
      :request_id,
      :name,
      :type,
      :value,
      :host,
      :app,
      :environment,
      :client,
      :language
    ])
    |> validate_inclusion(:type, @metric_types,
      message: "is invalid. Allowed values are #{Enum.join(@metric_types, ", ")}"
    )
  end
end
