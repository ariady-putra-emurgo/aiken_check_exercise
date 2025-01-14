//// @hidden

use aiken/cbor
use aiken/collection/list
use aiken/fuzz
use cardano/transaction.{OutputReference}
use test_kit/fuzzy/fuzzer.{transaction_id_fuzzer}

// ## Section 1

/// Fix me in as many ways as possible, at least 2 ways
test prop_1(i via fuzz.int()) {
  i / i == i
}

test prop_2(ls via fuzz.list_between(fuzz.constant(0), 5, 10)) {
  // DO NOT MODIFY BELOW //
  let len = ls |> list.length
  len < 5
  // DO NOT MODIFY ABOVE //
}

test prop_3(b via fuzz.bool()) {
  // DO NOT MODIFY BELOW //
  b
  // DO NOT MODIFY ABOVE //
}

test prop_4(b8 via fuzz.byte()) fail {
  // DO NOT MODIFY BELOW //
  b8 % 2 == 0
  // DO NOT MODIFY ABOVE //
}

// ## Section 2

// The usage of fuzz.constant at test prop_2 is not really appropriate, albeit working.
// Explain what fuzz.constant is intended for

fn output_reference_fuzzer() -> Fuzzer<OutputReference> {
  todo @"Define fn output_reference_fuzzer()"
  // Explain the difference between fuzz.and_then and fuzz.map
}

test prop_o_ref(o_ref via output_reference_fuzzer()) {
  o_ref |> cbor.diagnostic |> fuzz.label
  // Explain the difference between cbor.diagnostic and cbor.serialise
}
