defmodule StandardParsingTest do
  use ExUnit.Case
  doctest CatanMap

  setup do
    map = ~S"
                              >-----<
                             /~~~~~~~\
                            /~~~~~~~~~\
                     >-----<~~~~3:1~~~~>-----<
                    /~~~~~~~\~~~~~~~~~/~~~~~~~\
                   /~~~~~~~~~\*~~~~~*/~~~~~~~~~\
            >-----<~~~~~~~~~~~>-----<~~~~~~~~~~~>-----<
           /~~~~~~~\~~~~~~~~~/       \~~~~~~~~~/~~~~~~~\
          /~~~2:1~~~\~~~~~~~/    8    \~~~~~~~/~~~2:1~~~\
   >-----<~~lumber~~*>-----<  lumber   >-----<*~~wool~~~~>-----<
  /~~~~~~~\~~~~~~~~~/       \         /       \~~~~~~~~~/~~~~~~~\
 /~~~~~~~~~\~~~~~~*/   11    \       /    4    \*~~~~~~/~~~~~~~~~\
<~~~~~~~~~~~>-----<   brick   >-----<   brick   >-----<~~~~~~~~~~~>
 \~~~~~~~~~/       \         /       \         /       \~~~~~~~~~/
  \~~~~~~~/    3    \       /    9    \       /    9    \~~~~~~~/
   >-----<   grain   >-----<  lumber   >-----<    ore    >-----<
  /~~~~~~~\         /       \         /       \         /~~~~~~~\
 /~~~2:1~~~\       /    8    \       /         \       /~~~2:1~~~\
<~~~brick~~*>-----<   wool    >-----<  desert   >-----<*~~~ore~~~~>
 \~~~~~~~~~/       \         /       \  ROBBER /       \~~~~~~~~~/
  \~~~~~~*/   10    \       /    6    \       /   10    \*~~~~~~/
   >-----<  lumber   >-----<   brick   >-----<   wool    >-----<
  /~~~~~~~\         /       \         /       \         /~~~~~~~\
 /~~~~~~~~~\       /   12    \       /    2    \       /~~~~~~~~~\
<~~~~~~~~~~~>-----<   grain   >-----<    ore    >-----<~~~~~~~~~~~>
 \~~~~~~~~~/       \         /       \         /       \~~~~~~~~~/
  \~~~~~~~/    6    \       /    4    \       /   12    \~~~~~~~/
   >-----<   grain   >-----<   wool    >-----<   brick   >-----<
  /~~~~~~*\         /       \         /       \         /*~~~~~~\
 /~~~~~~~~~\       /   11    \       /    5    \       /~~~~~~~~~\
<~~~~3:1~~~*>-----<  lumber   >-----<   grain   >-----<*~~~3:1~~~~>
 \~~~~~~~~~/~~~~~~~\         /       \         /~~~~~~~\~~~~~~~~~/
  \~~~~~~~/~~~~~~~~~\       /    5    \       /~~~~~~~~~\~~~~~~~/
   >-----< ~~~~~~~~~~>-----<   wool    >-----<~~~~~~~~~~~>-----<
          \~~~~~~~~~/*~~~~~*\         /*~~~~~*\~~~~~~~~~/
           \~~~~~~~/~~~~~~~~~\       /~~~2:1~~~\~~~~~~~/
            >-----<~~~~3:1~~~~>-----<~~~grain~~~>-----<
                   \~~~~~~~~~/~~~~~~~\~~~~~~~~~/
                    \~~~~~~~/~~~~~~~~~\~~~~~~~/
                     >-----<~~~~~~~~~~~>-----<
                            \~~~~~~~~~/
                             \~~~~~~~/
                              >-----<
    "

  {:ok, map: map}
  end

  test "parses correct tile count on a standard map", %{map: map} do
    assert CatanMap.parse(map) |> CatanMap.terrain_count == 19
  end

  test "assigns correct terrain at the origin on a standard map", %{map: map} do
    assert CatanMap.parse(map) |> CatanMap.terrain_at(0, 0) == :hills
    assert CatanMap.parse(map) |> CatanMap.resource_at(0, 0) == :brick
  end

  test "assigned correct resource on the q axis on a standard map", %{map: map} do
    assert CatanMap.parse(map) |> CatanMap.terrain_at(-2, 0) == :fields
    assert CatanMap.parse(map) |> CatanMap.resource_at(-2, 0) == :grain
  end

  test "detects water hexes correctly", %{map: map} do
    assert CatanMap.parse(map) |> CatanMap.terrain_at(-3, 3) == :water
    assert CatanMap.parse(map) |> CatanMap.resource_at(-3, 3) == nil
  end
end
