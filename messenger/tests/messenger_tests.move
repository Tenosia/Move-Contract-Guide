#[test_only]
module messenger::messenger_tests;

use messenger::messenger::{Self, Messenger};
use sui::test_scenario;
use std::string;

#[test]
fun test_create_messenger() {
    let sender = @0xBABE;
    let recipient = @0xCAFE;
    let mut scenario = test_scenario::begin(sender);
    
    {
        messenger::create_messenger(
            b"Alice",
            b"Hello, Bob!",
            recipient,
            test_scenario::ctx(&mut scenario)
        );
    };
    
    scenario.next_tx(sender);
    {
        let msg = test_scenario::take_from_sender<Messenger>(&scenario);
        assert!(messenger::get_from(&msg) == sender, 0);
        assert!(messenger::get_to(&msg) == recipient, 0);
        let message_text = messenger::get_message(&msg);
        assert!(string::utf8(b"Hello, Bob!") == message_text, 1);
        test_scenario::return_to_sender(&mut scenario, msg);
    };
    
    test_scenario::end(scenario);
}
