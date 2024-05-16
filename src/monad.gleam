import gleam/io
import gleam/int

pub fn main() {
  let f = add_constant(12)
  let result = f(24)
  io.println("Result: " <> int.to_string(result))
}

fn add_constant(constant: Int) -> fn(Int) -> #(Int, Int) {
  use state <- get_state()
  return(constant  + state)
}

fn get_state(next: fn(a) -> #(a, b)) -> fn(a) -> #(a, b) {
}

fn set_state(state: a, next: fn() -> #(a, b)) -> fn(a) -> #(a, b) {
}

fn bind(next: fn(r) -> fn(s) -> #(s, r)) -> fn(s) -> #(s, r) {
  fn(state) {}
}

fn return(result: r) -> fn(s) -> #(s, r) {
  fn(state) { #(state, result) }
}
