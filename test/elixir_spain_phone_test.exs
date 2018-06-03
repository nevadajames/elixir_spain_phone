defmodule ElixirSpainPhoneTest do
  use ExUnit.Case
  doctest ElixirSpainPhone

  test "valid mobile phone" do
    assert ElixirSpainPhone.valid?("634253521") == true 
  end
end
