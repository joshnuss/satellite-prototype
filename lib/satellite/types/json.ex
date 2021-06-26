defmodule Satellite.Types.JSON do
  use Ecto.Type

  def type, do: :string

  def cast(array) when is_list(array), do: {:ok, array}
  def cast(map) when is_map(map), do: {:ok, map}
  def cast(string) when is_binary(string), do: {:ok, string}
  def cast(_), do: :error
  def load(value), do: Jason.decode(value)
  def dump(value), do: Jason.encode(value)
end
