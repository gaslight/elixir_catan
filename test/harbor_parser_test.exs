defmodule HarborParserTest do
  use ExUnit.Case
  doctest HarborParser

  setup do
    map_lines = ~S"
        b~~g~~l
       b~~~~~~~l
     <~~~~~~~~~~~>
      w3~~~~~~~wr
       w3~~o~~wr
         -bbb-
       "
    |> String.split("\n")

    {
      :ok,
      map_lines: map_lines,
      location: %AsciiLocation{x: 11, y: 3}
    }
  end

  describe "HarborParser.parse_harbors/2" do
    # test "finds a :nw harbor", %{map_lines: map_lines, location: location} do
    #   assert HarborParser.parse_harbors(location, map_lines).nw == :brick
    # end

    # test "finds a :n harbor", %{map_lines: map_lines, location: location} do
    #   assert HarborParser.parse_harbors(location, map_lines).n == :grain
    # end

    # test "finds a :ne harbor", %{map_lines: map_lines, location: location} do
    #   assert HarborParser.parse_harbors(location, map_lines).ne == :lumber
    # end

    test "finds a :se harbor", %{map_lines: map_lines, location: location} do
      assert HarborParser.parse_harbors(location, map_lines).se == :wool
    end

    test "finds a :s harbor", %{map_lines: map_lines, location: location} do
      assert HarborParser.parse_harbors(location, map_lines).s == :ore
    end

    test "finds a :sw harbor", %{map_lines: map_lines, location: location} do
      assert HarborParser.parse_harbors(location, map_lines).sw == :any
    end
  end
end
