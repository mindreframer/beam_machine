defmodule BeamMachineTest do
  use ExUnit.Case
  doctest BeamMachine

  test "greets the world" do
    assert BeamMachine.hello() == :world
  end
end
