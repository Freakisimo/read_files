defmodule UpdateExcess do
  @moduledoc """
  Documentation for UpdateExcess.
  """

  @doc """
  Hello world.

  ## Examples

      iex> UpdateExcess.hello
      :world

  """
  def read_file do
    File.stream!("/tmp/indice_de_excesos.csv") |>
    CSV.decode(separator: ?\n) |>
    Enum.map(fn row ->
      String.split(row)
      # IO.puts(row)
    end)
  end

  def hello do
    :world
  end
end
