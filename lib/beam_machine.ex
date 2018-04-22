defmodule BeamMachine do
  @moduledoc """
  Documentation for BeamMachine.
  """

  @doc """
  :top_heap_size returns the pids of process with biggest heaps
  """
  def top_heap_size do
    :erlang.processes()
    |> Enum.map(fn x -> {x, :erlang.process_info(x, :total_heap_size) |> elem(1)} end)
    |> Enum.sort_by(fn {_pid, size} -> -size end)
  end

  def memory  do
    :erlang.memory
  end

  # :code_server
  def backtrace(modulename) when is_atom(modulename) do
    :erlang.whereis(modulename)
    |> backtrace()
  end

  def backtrace(str_pid) when is_binary(str_pid) do
    pid(str_pid) |> backtrace()
  end

  def backtrace(pid) when is_pid(pid) do
    pid
    |> :erlang.process_info(:backtrace)
    |> elem(1)
    |> IO.puts
  end

  def all do
    :shell_default.i()
  end

  ## https://github.com/elixir-lang/elixir/blob/v1.3.2/lib/iex/lib/iex/helpers.ex#L640

  @doc """
  Creates a PID from `string`.
  ## Examples
      iex> pid("0.21.32")
      #PID<0.21.32>
  """
  def pid(string) when is_binary(string) do
    :erlang.list_to_pid('<#{string}>')
  end

  @doc """
  Creates a PID with 3 non negative integers passed as arguments
  to the function.
  ## Examples
      iex> pid(0, 21, 32)
      #PID<0.21.32>
      iex> pid(0, 64, 2048)
      #PID<0.64.2048>
  """
  def pid(x, y, z) when is_integer(x) and x >= 0 and
                        is_integer(y) and y >= 0 and
                        is_integer(z) and z >= 0 do
    :erlang.list_to_pid(
      '<' ++ Integer.to_charlist(x) ++ '.' ++
             Integer.to_charlist(y) ++ '.' ++
             Integer.to_charlist(z) ++ '>'
    )
  end
end
