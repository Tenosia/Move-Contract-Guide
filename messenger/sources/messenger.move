/*
/// Module: messenger
module messenger::messenger;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module messenger::messenger {
    use std::string::String;
 


    public struct Messenger has key {
        id: UID,
        name: String,
        message: String,
        from: address,
        to: address,
}

public entry fun create_messenger(name: vector<u8>, message: vector<u8>, from: address, ctx: &mut TxContext) {
    let messenger = Messenger {
        id: ctx.sender(),
        name: String::utf8(name),
        message: String::utf8(message),
        from: from,
        to: ctx.sender(),
    };
}

}