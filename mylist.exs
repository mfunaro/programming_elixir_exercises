defmodule MyList do
  def mapsum([head | tail], func, total \\ 0), do: _mapsum([head|tail], func, total)
  defp _mapsum([], _func, total), do: total
  defp _mapsum([head | tail], func, total), do: _mapsum(tail, func, total + func.(head))

  def mapsum2([]), do: 0
  def mapsum2([head | tail]), do: head + mapsum2(tail)

  def max([head | tail]), do: _max(tail, head)
  defp _max([last], _high), do: last
  defp _max([head | tail], _high) when head > _high, do: _max(tail, head)
  defp _max([head | tail], high) when head < high, do: _max(tail, high)

  def any?(list, func), do: _any?(list, func)
  defp _any?([head|tail], func) do
    if func.(head) do
      _any?(tail, func)
    else
      false
    end
  end

  def all?(list, func), do: _all?(list, func)
  defp _all?([], func), do: true
  defp _all?([head|tail], func) do
    if func.(head) do
      _all?(tail, func)
    else
      false
    end
  end

  def each([], func), do: []
  def each([head | tail], func) do
    [func.(head) | each(tail, func)]
  end

  def filter([], func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end
end
