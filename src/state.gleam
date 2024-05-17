pub type State(s, r) =
  fn(s) -> #(s, r)

pub fn return(result: r) -> State(s, r) {
  fn(state) { #(state, result) }
}

pub fn get_state(next: fn(s) -> State(s, r)) -> State(s, r) {
  fn(state) { next(state)(state) }
}

pub fn set_state(state: s, next: fn() -> State(s, r)) -> State(s, r) {
  fn(_) { next()(state) }
}
