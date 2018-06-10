defmodule ElixirSpainPhoneTest do
  use ExUnit.Case
  doctest ElixirSpainPhone

  test "valid mobile phone" do
    mobile_number = "634253521"
    assert ElixirSpainPhone.valid?(mobile_number) == true
    assert ElixirSpainPhone.phone_type(mobile_number) == "mobile"
  end

  test "valid landline phone" do
    landline_number = "934253521"
    assert ElixirSpainPhone.valid?(landline_number) == true
    assert ElixirSpainPhone.phone_type(landline_number) == "landline"
    assert ElixirSpainPhone.find_province(landline_number) == :barcelona
    assert is_atom ElixirSpainPhone.find_province(landline_number) 
  end

  test "generate landline phone" do
    phone = PhoneGenerator.generate(:landline)
    assert ElixirSpainPhone.valid?(phone) == true
    assert ElixirSpainPhone.phone_type(phone) == "landline"
    assert ElixirSpainPhone.find_province(phone) != nil
  end

  test "generate mobile phone" do
    mobile = PhoneGenerator.generate(:mobile)
    assert ElixirSpainPhone.valid?(mobile) == true
    assert ElixirSpainPhone.phone_type(mobile) == "mobile"
    assert ElixirSpainPhone.find_province(mobile) == "Not a landline number"
  end

  test "generate toll free phone" do
    toll_free = PhoneGenerator.generate(:toll_free)
    assert ElixirSpainPhone.valid?(toll_free) == true
    assert ElixirSpainPhone.phone_type(toll_free) == "toll-free"
    assert ElixirSpainPhone.find_province(toll_free) == "Not a landline number"
  end

  test "generate premium phone" do
    premium = PhoneGenerator.generate(:premium)
    assert ElixirSpainPhone.valid?(premium) == true
    assert ElixirSpainPhone.phone_type(premium) == "premium"
    assert ElixirSpainPhone.find_province(premium) == "Not a landline number"
  end


  test "invalid phone number" do
    refute ElixirSpainPhone.valid?("sdflk3454lkj")
  end
end
