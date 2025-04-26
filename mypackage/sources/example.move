/*
/// Module: mypackage
module mypackage::mypackage;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module mypackage::example {
    // Part 1: These imports are provided by default
// use sui::object::{Self, UID};
// use sui::transfer;
// use sui::tx_context::{Self, TxContext};

public struct Sword has key, store {
    id: UID,
    magic: u64,
    strength: u64,
}

public struct Forge has key {
    id: UID,
    swords_created: u64,
}

fun init(ctx: &mut TxContext) {
    let admin = Forge {
        id: object::new(ctx),
        swords_created: 0,
    };
    transfer::transfer(admin, ctx.sender());

}



public fun magic(self: &Sword): u64 {
    self.magic
}

public fun strength(self: &Sword): u64 {
    self.strength
}
public fun swords_created(self: &Forge): u64 {
    self.swords_created
}


#[test]
fun test_sword_create() {
    let mut ctx = tx_context::dummy();

    //create a new sword
    let sword = Sword {
        id: object::new(&mut ctx),
        magic: 100,
        strength: 7,
    };

    //check if accessor function returns the correct value
    assert!(sword.magic() == 100 && sword.strength() == 7, 1);
    let dummy_address = @0xCAFE;
    transfer::public_transfer(sword, dummy_address);
    
}

// Part 5: Public/entry functions (introduced later in the tutorial)

public fun sword_create(magic: u64, strength: u64, ctx: &mut TxContext): Sword {
    Sword {
        id: object::new(ctx),
        magic: magic,
        strength: strength,
    }
}



// Part 6: Tests

#[test]

fun test_sword_transaction() {
    use sui::test_scenario;

    //create test addresses representing users 
    let nnamdi = @0xCAFE;
    let daniel = @0xFACE;

    //First transaction executed by nnamdi to create a sword object
    let mut scenario = test_scenario::begin(nnamdi);
    {
        //create the sword object and transfer it to nnamdi
        let sword = sword_create(42, 7, scenario.ctx());
        transfer::public_transfer(sword, nnamdi);
    };

    //secon transaction executed by nnamdi
    scenario.next_tx(nnamdi);
    {
        //extract the sword owned by nnamdi
        let sword = scenario.take_from_sender<Sword>();
        //transfe the sword to daniel
        transfer::public_transfer(sword, daniel);
    
    };

    //third transaction executed by daniel
    scenario.next_tx(daniel);
    {
        //extract the sword owned by daniel
        let sword = scenario.take_from_sender<Sword>();
        //check if the sword has the correct values
        assert!(sword.magic() == 42 && sword.strength() == 7, 1);
        //transfer the sword to nnamdi
        //transfer::public_transfer(sword, nnamdi);
        scenario.return_to_sender(sword)
    };
    scenario.end();
}

}