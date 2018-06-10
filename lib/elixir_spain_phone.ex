defmodule ElixirSpainPhone do
  @moduledoc """
    Module for validating Spanish Phone Numbers, validates length, format,
    phone type, and also returns province for valid landlines. Methods include
    phone_type/1, valid?/1, and find_province/1 which all accept a phone number as a
    string as its only argument.
  """
  def invalid_number, do: "Not a valid Spanish Phone Number"

  @spec valid?(String.t) :: boolean
  def valid?(n), do: Regex.match?(~r/[6789]\d{8}/, n)

  def prefix(n), do: String.slice(n,0..2)

  @spec phone_type(String.t) :: String.t
  def phone_type(n)  do
    cond do
      Regex.match?(~r/^80[1-9]|^90[1-9]/, prefix n) ->
        "premium"
      Regex.match?(~r/^800|^900/, prefix n) ->
        "toll-free"
      Regex.match?(~r/^[67]/, prefix n) ->
        "mobile"
      Regex.match?(~r/^[89][1-9][1-9]/, prefix n) ->
        "landline"
      true ->
        invalid_number()
    end
  end

  @spec find_province(String.t) :: String.t
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
end
