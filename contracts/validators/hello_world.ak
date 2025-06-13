// Hello World validator for NikePig project
// This is a basic test validator to verify Aiken compilation

use cardano/transaction.{Transaction, OutputReference}

pub type MyDatum {
  message: ByteArray,
}

pub type MyRedeemer {
  action: ByteArray,
}

validator hello_world {
  spend(datum: Option<MyDatum>, redeemer: MyRedeemer, _utxo: OutputReference, _self: Transaction) {
    when datum is {
      Some(_d) -> redeemer.action == "hello"
      None -> False
    }
  }
}
