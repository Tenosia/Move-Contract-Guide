#[test_only]
module todo_list::todo_list_tests;

use todo_list::todo_list::{Self, TodoList};
use sui::test_scenario;
use std::string;

#[test]
fun test_todo_list_operations() {
    let sender = @0xBABE;
    let mut scenario = test_scenario::begin(sender);
    
    {
        todo_list::create(test_scenario::ctx(&mut scenario));
    };
    
    scenario.next_tx(sender);
    {
        let list = test_scenario::take_from_sender<TodoList>(&scenario);
        assert!(todo_list::length(&list) == 0, 0);
        todo_list::add(&mut list, b"Buy groceries");
        todo_list::add(&mut list, b"Finish homework");
        assert!(todo_list::length(&list) == 2, 1);
        let item = todo_list::get_item(&list, 0);
        assert!(string::utf8(b"Buy groceries") == item, 2);
        test_scenario::return_to_sender(&mut scenario, list);
    };
    
    scenario.next_tx(sender);
    {
        let list = test_scenario::take_from_sender<TodoList>(&scenario);
        todo_list::remove(&mut list, 0);
        assert!(todo_list::length(&list) == 1, 3);
        let item = todo_list::get_item(&list, 0);
        assert!(string::utf8(b"Finish homework") == item, 4);
        todo_list::delete(list);
    };
    
    test_scenario::end(scenario);
}
