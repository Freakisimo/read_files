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
  # UpdateExcess.read_file()
  def read_file do
    zero_array = Enum.map(0..23, fn(x) -> x * 0 end)
    data_speeding = Map.new
    File.stream!("/tmp/indice_de_excesos.csv") |>
    CSV.decode(separator: ?\n) |>
    Enum.map(fn row ->
      parsed_row =
      List.to_string(row) |>
      String.split(",")
      segment_id = Enum.at(parsed_row, 0)
      hour = Enum.at(parsed_row, 2)
      exist = Map.has_key?(data_speeding, segment_id)
      case exist do
        true  -> IO.puts "Hello"
        false -> Map.put(data_speeding, segment_id, zero_array)
      end
    end)
  end

end
