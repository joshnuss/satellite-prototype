defmodule Satellite.Log do
  use Ecto.Schema
  import Ecto.Changeset

  @log_types ~w(emergency alert critical error warning notice info debug)

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

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [
      :request_id,
      :type,
      :host,
      :app,
      :environment,
      :client,
      :language,
      :ip,
      :commit,
      :message,
      :data
    ])
    |> validate_required([
      :request_id,
      :type,
      :host,
      :app,
      :environment,
      :client,
      :language,
      :ip,
      :message
    ])
    |> validate_inclusion(:type, @log_types,
      message: "is invalid. Allowed values are #{Enum.join(@log_types, ", ")}"
    )
  end
end
