// use aiken/builtin
use aiken/collection/list
use aiken/fuzz

/// Fix me in as many ways as possible, at least 2 ways
test property_test_1(i via fuzz.int()) {
  i / i == i
}

test property_test_2(ls via fuzz.list_between(fuzz.constant(0), 5, 10)) {
  // DO NOT MODIFY BELOW //
  let len = ls |> list.length
  len < 5
  // DO NOT MODIFY ABOVE //
}

test property_test_3(b via fuzz.bool()) {
  // DO NOT MODIFY BELOW //
  b
  // DO NOT MODIFY ABOVE //
}

test property_test_4(b8 via fuzz.byte()) fail {
  // DO NOT MODIFY BELOW //
  b8 % 2 == 0
  // DO NOT MODIFY ABOVE //
}
