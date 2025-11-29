// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module messenger::messenger {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string;

    /// A messenger object that stores a message between two addresses
    public struct Messenger has key, store {
        id: UID,
        name: string::String,
        message: string::String,
        from: address,
        to: address,
    }

    /// Creates a new messenger object and transfers it to the sender
    public entry fun create_messenger(
        name: vector<u8>,
        message: vector<u8>,
        to: address,
        ctx: &mut TxContext
    ) {
        let messenger = Messenger {
            id: object::new(ctx),
            name: string::utf8(name),
            message: string::utf8(message),
            from: tx_context::sender(ctx),
            to,
        };
        transfer::public_transfer(messenger, tx_context::sender(ctx));
    }

    /// Returns the message content
    public fun get_message(messenger: &Messenger): string::String {
        messenger.message
    }

    /// Returns the sender address
    public fun get_from(messenger: &Messenger): address {
        messenger.from
    }

    /// Returns the recipient address
    public fun get_to(messenger: &Messenger): address {
        messenger.to
    }
}