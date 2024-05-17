import gleam/int
import gleam/io

import state.{type State}

pub fn main() {
  let action = one_and_a_half()
  let #(_, result) = action(6)
  io.println("Result: " <> int.to_string(result))
}

fn one_and_a_half() -> State(Int, Int) {
  use state <- state.get_state()
  use <- state.set_state(state / 2)
  use state2 <- state.get_state()
  state.return(state + state2)
}
