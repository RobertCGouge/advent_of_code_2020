defmodule DayOne do

  def parse(filename) do
    "#{filename}"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end

  def find_what_sums(year, [item | list]) do
    if (year - item) in list do
      [item, year - item]
    else
      find_what_sums(year, list)
    end
  end

  def find_what_sums(_year, []), do: :error

  def answer_part1(filename) do
    [item1, item2] = find_what_sums(2020, parse(filename))
    item1 * item2
  end

  def answer_part2(filename) do
    [item1, item2, item3] = find_three_sums(2020, parse(filename))
    item1 * item2 * item3
  end

  def find_three_sums(year, [item | list]) do
    case find_what_sums(year - item, list) do
      :error -> find_three_sums(year, list)
      [item1, item2] -> [item, item1, item2]
    end
  end

end
