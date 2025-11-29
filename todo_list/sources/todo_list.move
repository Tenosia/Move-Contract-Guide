// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module todo_list::todo_list {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string;
    use std::vector;

    /// List of todos. Can be managed by the owner and shared with others.
    public struct TodoList has key, store {
        id: UID,
        items: vector<string::String>
    }

    /// Create a new todo list and transfer it to the sender.
    public entry fun create(ctx: &mut TxContext) {
        let list = TodoList {
            id: object::new(ctx),
            items: vector[]
        };
        transfer::public_transfer(list, tx_context::sender(ctx));
    }

    /// Add a new todo item to the list.
    public entry fun add(list: &mut TodoList, item: vector<u8>) {
        list.items.push_back(string::utf8(item));
    }

    /// Remove a todo item from the list by index.
    public entry fun remove(list: &mut TodoList, index: u64) {
        vector::remove(&mut list.items, index);
    }

    /// Delete the list and the capability to manage it.
    public entry fun delete(list: TodoList) {
        let TodoList { id, items: _ } = list;
        object::delete(id);
    }

    /// Get the number of items in the list.
    public fun length(list: &TodoList): u64 {
        vector::length(&list.items)
    }

    /// Get an item at a specific index.
    public fun get_item(list: &TodoList, index: u64): string::String {
        *vector::borrow(&list.items, index)
    }
}
