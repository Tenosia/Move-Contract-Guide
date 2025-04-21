/*
/// Module: hello_world
module hello_world::hello_world;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


// The module `hello_world` under named address `hello_world`.
// The named address is set in the `Move.toml`.

// The module `hello_world` under named address `hello_world`.
// The named address is set in the `Move.toml`.
// module hello_world::hello_world;

// use std::string;
// use sui::object::{Self, UID};
// use sui::transfer;
// use sui::tx_context::{Self, TxContext};


// public struct HelloWorldObject has key, store {
//     id: UID,
//     text: string::string,
// }

// // Imports the `String` type from the Standard Library
// use std::string::String;

// /// Returns the "Hello, World!" as a `String`.
// public fun hello_world(): String {
//     b"Hello, World!".to_string()
// }


module hello_world::hello_world {
    use std::string;

   

    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String,
    }

    // Imports the `String` type from the Standard Library
    use std::string::String;

    /// Returns the "Hello, World!" as a `String`.
    #[allow(lint(self_transfer))]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello, World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}