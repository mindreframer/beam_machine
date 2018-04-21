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
end
