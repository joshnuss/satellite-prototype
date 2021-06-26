defmodule Satellite.Request do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @timestamps_opts updated_at: false
  schema "requests" do
    field :id, :string
    field :host, :string
    field :app, :string
    field :environment, :string
    field :language, :string
    field :client, :string
    field :ip, :string
    field :commit, :string
    field :url, :string
    field :headers, Satellite.Types.JSON
    field :status_code, :integer

    timestamps(inserted_at: :timestamp)
  end

  def changeset(params) do
    %__MODULE__{headers: %{}}
    |> cast(params, [
      :id,
      :host,
      :app,
      :environment,
      :client,
      :language,
      :ip,
      :commit,
      :url,
      :headers,
      :status_code
    ])
    |> validate_required([
      :id,
      :host,
      :app,
      :environment,
      :client,
      :language,
      :ip,
      :url,
      :status_code
    ])
  end
end
