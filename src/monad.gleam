import gleam/int
import gleam/io

pub fn main() {
  let f = add_constant()
  let #(_, result) = f(6)
  io.println("Result: " <> int.to_string(result))
}

fn add_constant() -> State(Int, Int) {
  use state <- get_state()
  use <- set_state(state / 2)
  use state2 <- get_state()
  return(state + state2)
}

fn get_state(next: fn(s) -> State(s, r)) -> State(s, r) {
  fn(state) { next(state)(state) }
}

fn set_state(state: s, next: fn() -> State(s, r)) -> State(s, r) {
  fn(_) { next()(state) }
}

type State(s, r) =
  fn(s) -> #(s, r)

fn bind(this: State(s, r1), next: fn(r1) -> State(s, r2)) -> State(s, r2) {
  fn(state) {
    let #(state, result) = this(state)
    next(result)(state)
  }
}

fn return(result: r) -> State(s, r) {
  fn(state) { #(state, result) }
}
