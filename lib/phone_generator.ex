defmodule PhoneGenerator do
  @moduledoc """
    Generates valid Spanish phone number of different types:
    mobile, landline, premium, or toll free.
    PhoneValidator.find_province(1) can also be called on the generated landlines.
  """

  @doc """
    ## Available arguments for generate/1
    - generate(:mobile)
    - generate(:landline)
    - generate(:premium)
    - generate(:toll_free)
  """
  @spec generate(atom) :: String.t
  def generate(:landline) do
    require AreaCode
    area_code = AreaCode.codes_by_province
    |> Map.values
    |> List.flatten
    |> Enum.random

    Enum.join([area_code, extension(6)])
  end

  def generate(:mobile) do
    join_number([6,7], 8)
  end

  def generate(:toll_free) do
    join_number([900, 800], 6)
  end

  def generate(:premium) do
    join_number([902, 802], 6)
  end

  defp extension(length) do
    Enum.map(1..length, fn _i -> :rand.uniform(9) end) |> Enum.join()
  end

  defp join_number(prefix_list, length) do
    prefix = Enum.random(prefix_list)
    Enum.join [prefix, extension(length)]
  end
end
