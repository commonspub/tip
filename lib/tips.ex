import ProtocolEx

defimpl_ex Nil, Nil, for: Tip.Check do
  def check(_, x), do: is_nil(x)
end

defimpl_ex Nil, nil, for: Tip.Check do
  def check(_, x), do: is_nil(x)
end

defimpl_ex Truthy, Truthy, for: Tip.Check do
  def check(_, x), do: not (is_nil(x) or not x)
end

defimpl_ex Falsy, Falsy, for: Tip.Check do
  def check(_, x), do: is_nil(x) or not x
end

defimpl_ex Tuple, Tuple, for: Tip.Check do
  def check(_, x), do: is_tuple(x)
end

defimpl_ex Tuple.Sized, {Tuple, n} when is_integer(n) and n >= 0, for: Tip.Check do
  def check({_, size}, x), do: is_tuple(x) and tuple_size(x) == size
end

defimpl_ex Atom, Atom, for: Tip.Check do
  def check(_, x), do: is_atom(x)
end

defimpl_ex List, List, for: Tip.Check do
  def check(_, x), do: is_list(x)
end

defimpl_ex List, {List, of}, for: Tip.Check do
  def check({_, of}, x), do: is_list(x) and Enum.all?(x, &Tip.Check.check(of, &1))
end

defimpl_ex BitString, BitString, for: Tip.Check do
  def check(_, x), do: is_bitstring(x)
end

defimpl_ex Integer, Integer, for: Tip.Check do
  def check(_, x), do: is_integer(x)
end

defimpl_ex Float, Float, for: Tip.Check do
  def check(_, x), do: is_float(x)
end

defimpl_ex Function, Function, for: Tip.Check do
  def check(_, x), do: is_function(x)
end

defimpl_ex Function.Sized, {Function, n} when is_integer(n) and n >= 0, for: Tip.Check do
  def check({_, n}, x), do: is_function(x, n)
end

defimpl_ex Pid, Pid, for: Tip.Check do
  def check(_, x), do: is_pid(x)
end

defimpl_ex Map, Map, for: Tip.Check do
  def check(_, x), do: is_map(x) and not is_map_key(x, :__struct__)
end

defimpl_ex Port, Port, for: Tip.Check do
  def check(_, x), do: is_port(x)
end

defimpl_ex Reference, Reference, for: Tip.Check do
  def check(_, x), do: is_reference(x)
end

defimpl_ex Struct, module when is_atom(module), for: Tip.Check do
  @priority -1
  def check(name, %struct{}), do: name == struct
end