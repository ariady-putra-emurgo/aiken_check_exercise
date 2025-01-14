//// @hidden

use aiken/builtin
use cardano/transaction
use exercise
use test_kit.{to_data}
use test_kit/fuzzy/fuzzer.{FromKey, Fuzzed, credential_fuzzer, policy_id_fuzzer}
use test_kit/tx/mock.{mock_output_reference}

const arbitrary_utxo = mock_output_reference(#"abcd", 0)

/// Fix me in as many ways as possible, at least 2 ways
test validator_test_1(policy_id via policy_id_fuzzer()) {
  !exercise.validate.mint(24, policy_id, transaction.placeholder)
}

/// Fix me in as many ways as possible, at least 2 ways
test validator_test_2() {
  !exercise.validate.spend(
    datum: None,
    redeemer: Void,
    utxo: arbitrary_utxo,
    tx: transaction.placeholder,
  )
}

/// Modify the VALIDATOR logic!
test validator_test_3(arbitrary_key via credential_fuzzer(FromKey(Fuzzed))) {
  exercise.validate.spend(
    datum: Some(arbitrary_key |> to_data),
    redeemer: Void,
    utxo: arbitrary_utxo,
    tx: transaction.placeholder,
  )
}

test validator_test_4() {
  // DO NOT MODIFY BELOW //
  !exercise.validate.spend(
    datum: Some(24 |> builtin.i_data),
    redeemer: Void,
    utxo: arbitrary_utxo,
    tx: transaction.placeholder,
  )
  // DO NOT MODIFY ABOVE //
}

test validator_test_5() fail {
  // DO NOT MODIFY BELOW //
  !exercise.validate.spend(
    datum: Some("Hello, World!" |> builtin.b_data),
    redeemer: Void,
    utxo: arbitrary_utxo,
    tx: transaction.placeholder,
  )
  // DO NOT MODIFY ABOVE //
}
