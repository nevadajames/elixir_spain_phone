defmodule ElixirSpainPhone do
  @moduledoc """
    Module for validating Spanish Phone Numbers
  """
  
  @doc """
    Check if number is valid, returns boolean
  """
  @spec valid?(String.t) :: boolean
  def valid?(phone_number), do: Regex.match?(~r/[6789]\d{8}/, phone_number)

  @doc """
    Check if phone number type for valid numbers
  """
  @spec phone_type(String.t) :: String.t
  def phone_type(phone_number)  do
    n = prefix(phone_number)
    cond do
      Regex.match?(~r/^80[1-9]|^90[1-9]/, n) ->
        "premium"
      Regex.match?(~r/^800|^900/, n) ->
        "toll-free"
      Regex.match?(~r/^[67]/, n) ->
        "mobile"
      Regex.match?(~r/^[89][1-9][1-9]/, n) ->
        "landline"
      true ->
        invalid_number()
    end
  end

  @doc """
    Returns province for valid landline numbers
  """
  @spec find_province(String.t) :: atom
  def find_province(n) do
    require AreaCode
    if valid?(n) do
      area_code = Enum.filter AreaCode.codes_by_province, fn {_key, value} ->
        Enum.member?(value, String.to_integer(prefix n))
      end
      results = Keyword.keys(area_code)
      if Enum.count(results) > 0, do: List.first(results), else: "Not a landline number"
    else
      invalid_number()
    end
  end

  defp prefix(n), do: String.slice(n,0..2)

  defp invalid_number, do: "Not a valid Spanish Phone Number"

end
