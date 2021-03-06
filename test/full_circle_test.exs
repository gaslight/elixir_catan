defmodule FullCircleTest do
  use ExUnit.Case

  setup do
    map = ~S"
                              >-----<
                             /~~~~~~~\
                            /~~~~~~~~~\
                     >-----<~~~~~~~~~~~>-----<
                    /~~~~~~~\~~~~~~~~~/~~~~~~~\
                   /~~~~~~~~~\~~333~~/~~~~~~~~~\
            >-----<~~~~~~~~~~~>-----<~~~~~~~~~~~>-----<
           /~~~~~~~\~~~~~~~~~/       \~~~~~~~~~/~~~~~~~\
          /~~~~~~~~~\~~~~~~~/    8    \~~~~~~~/~~~~~~~~~\
   >-----<~~~~~~~~~~~>-----<  lumber   >-----<~~~~~~~~~~~>-----<
  /~~~~~~~\~~~~~~~~l/       \         /       \w~~~~~~~~/~~~~~~~\
 /~~~~~~~~~\~~~~~~l/   11    \       /    4    \w~~~~~~/~~~~~~~~~\
<~~~~~~~~~~~>-----<   brick   >-----<   brick   >-----<~~~~~~~~~~~>
 \~~~~~~~~~/       \         /       \         /       \~~~~~~~~~/
  \~~~~~~~/    3    \       /    9    \       /    9    \~~~~~~~/
   >-----<   grain   >-----<  lumber   >-----<    ore    >-----<
  /~~~~~~~\         /       \         /       \         /~~~~~~~\
 /~~~~~~~~~\       /    8    \       /     R   \       /~~~~~~~~~\
<~~~~~~~~~~~>-----<   wool    >-----<  desert   >-----<~~~~~~~~~~~>
 \~~~~~~~~b/       \         /       \         /       \o~~~~~~~~/
  \~~~~~~b/   10    \       /    6    \       /   10    \o~~~~~~/
   >-----<  lumber   >-----<   brick   >-----<   wool    >-----<
  /~~~~~~~\         /       \         /       \         /~~~~~~~\
 /~~~~~~~~~\       /   12    \       /    2    \       /~~~~~~~~~\
<~~~~~~~~~~~>-----R   grain   >-----<    ore    >-----<~~~~~~~~~~~>
 \~~~~~~~~~/       \         /       \         /       \~~~~~~~~~/
  \~~~~~~~/    6    \       /    4    \       /   12    \~~~~~~~/
   >-----<   grain   >-----<   wool   WW-----<   brick   >-----<
  /~~~~~~3\         /       \         /       \         r3~~~~~~\
 /~~~~~~~~3\       /   11    \       /    5    \       r3~~~~~~~~\
<~~~~~~~~~~~>-----<  lumber   >-----<   grain   >-----<~~~~~~~~~~~>
 \~~~~~~~~~/~~~~~~~\         /       \         /~~~~~~~\~~~~~~~~~/
  \~~~~~~~/~~~~~~~~~\       /    5    \       /~~~~~~~~~\~~~~~~~/
   >-----<~~~~~~~~~~~>-----<   wool    >-----<~~~~~~~~~~~>-----<
          \~~~~~~~~~/~~333~~\         /~~ggg~~\~~~~~~~~~/
           \~~~~~~~/~~~~~~~~~\       /~~~~~~~~~\~~~~~~~/
            >-----<~~~~~~~~~~~>-----<~~~~~~~~~~~>-----<
                   \~~~~~~~~~/~~~~~~~\~~~~~~~~~/
                    \~~~~~~~/~~~~~~~~~\~~~~~~~/
                     >-----<~~~~~~~~~~~>-----<
                            \~~~~~~~~~/
                             \~~~~~~~/
                              >-----<
"

  {:ok, map: map}
  end

  test "parses and renders the same map", %{map: map} do
    assert CatanMapParser.parse(map) |> CatanMapRenderer.render == map
  end
end
