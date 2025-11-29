// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module hello_world::hello_world {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string;

    /// A simple Hello World object that stores a greeting message
    public struct HelloWorldObject has key, store {
        id: UID,
        text: string::String,
    }

    /// Creates and transfers a new HelloWorldObject to the sender
    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello, World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

    /// Returns the text content of a HelloWorldObject
    public fun get_text(obj: &HelloWorldObject): string::String {
        obj.text
    }
}