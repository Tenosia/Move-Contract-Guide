#[test_only]
module hello_world::hello_world_tests;

use hello_world::hello_world::{Self, HelloWorldObject};
use sui::test_scenario;
use sui::transfer;
use std::string;

#[test]
fun test_mint_and_get_text() {
    let sender = @0xBABE;
    let mut scenario = test_scenario::begin(sender);
    
    {
        hello_world::mint(test_scenario::ctx(&mut scenario));
    };
    
    scenario.next_tx(sender);
    {
        let obj = test_scenario::take_from_sender<HelloWorldObject>(&scenario);
        let text = hello_world::get_text(&obj);
        assert!(string::utf8(b"Hello, World!") == text, 0);
        test_scenario::return_to_sender(&mut scenario, obj);
    };
    
    test_scenario::end(scenario);
}
