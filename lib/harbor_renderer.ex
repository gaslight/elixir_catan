defmodule HarborRenderer do
  @harbor_map %{
    water: %{sw: [{-4, 1}, {-3, 2}],
             se: [{ 4, 1}, { 3, 2}],
             s:  [{-1, 2}, { 0, 2}, {1, 2}]},
    land:  %{sw: [{-6, 1}, {-5, 2}],
             se: [{ 6, 1}, { 5, 2}],
             s:  [{-1, 4}, { 0, 4}, {1, 4}]}
  }
  @resource_text %{
    any:    "3", brick: "b", grain: "g",
    lumber: "l", ore:   "o", wool:  "w",
  }
  def render_harbor(map_lines, %{harbor_resource: resource}, direction, l = %AsciiLocation{}, terrain) do
    Enum.reduce(@harbor_map[terrain][direction], map_lines, fn({x, y}, map_lines) ->
      map_lines
      |> Enum.at(l.y + y)
      |> StringUtil.replace_substring(@resource_text[resource], l.x + x)
      |> StringUtil.replace_line(l.y + y, map_lines)
    end)
  end

  def render_harbor(map_lines, _, _, _, _), do: map_lines
end
