# ElixirSpainPhone

Elixir package for validating Spanish Phone numbers for length, format, and type. Also finds
province for valid landlines.  
Available Methods:
´´´
phone_number = '937226615'

ElixirSpainPhone.find_province(phone_number)
=> :barcelona

ElixirSpainPhone.valid?(phone_number)
=> true

ElixirSpainPhone.phone_type(phone_number)
=> 'mobile'
´´´
The PhoneGenerator module can be used to generate random, valid Spanish phone numbers. After requiring the module call:

´´´
PhoneGenerator.generate_toll_free
"800229664"

PhoneGenerator.generate_premium
"902293916"

PhoneGenerator.generate_mobile
=> "651715399"

PhoneGenerator.generate_landline
=> "951487492"
´´´

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_spain_phone` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_spain_phone, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_spain_phone](https://hexdocs.pm/elixir_spain_phone).
