defmodule Satellite.Error do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @timestamps_opts updated_at: false
  schema "errors" do
    field :request_id, :string
    field :type, :string
    field :message, :string
    field :host, :string
    field :app, :string
    field :environment, :string
    field :language, :string
    field :client, :string
    field :ip, :string
    field :commit, :string
    field :stacktrace, {:array, :string}

    timestamps(inserted_at: :timestamp)
  end

  def changeset(params) do
    %__MODULE__{stacktrace: []}
    |> cast(params, [
      :request_id,
      :type,
      :message,
      :host,
      :app,
      :environment,
      :client,
      :language,
      :ip,
      :commit,
      :stacktrace
    ])
    |> validate_required([:request_id, :type, :host, :app, :environment, :client, :language, :ip])
  end
end
