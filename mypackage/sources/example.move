// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module mypackage::example {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// A sword object with magic and strength attributes
    public struct Sword has key, store {
        id: UID,
        magic: u64,
        strength: u64,
    }

    /// A forge that tracks the number of swords created
    public struct Forge has key {
        id: UID,
        swords_created: u64,
    }

    /// Initializes the module by creating a Forge object
    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            swords_created: 0,
        };
        transfer::public_transfer(admin, tx_context::sender(ctx));
    }



    /// Returns the magic value of a sword
    public fun magic(self: &Sword): u64 {
        self.magic
    }

    /// Returns the strength value of a sword
    public fun strength(self: &Sword): u64 {
        self.strength
    }

    /// Returns the number of swords created by the forge
    public fun swords_created(self: &Forge): u64 {
        self.swords_created
    }


    /// Creates a new sword with specified magic and strength values
    public fun sword_create(magic: u64, strength: u64, ctx: &mut TxContext): Sword {
        Sword {
            id: object::new(ctx),
            magic,
            strength,
        }
    }

    #[test]
    fun test_sword_create() {
        let mut ctx = tx_context::dummy();

        // Create a new sword
        let sword = Sword {
            id: object::new(&mut ctx),
            magic: 100,
            strength: 7,
        };

        // Check if accessor function returns the correct value
        assert!(magic(&sword) == 100 && strength(&sword) == 7, 1);
        let dummy_address = @0xCAFE;
        transfer::public_transfer(sword, dummy_address);
    }



    #[test]
    fun test_sword_transaction() {
        use sui::test_scenario;

        // Create test addresses representing users
        let nnamdi = @0xCAFE;
        let daniel = @0xFACE;

        // First transaction executed by nnamdi to create a sword object
        let mut scenario = test_scenario::begin(nnamdi);
        {
            // Create the sword object and transfer it to nnamdi
            let sword = sword_create(42, 7, test_scenario::ctx(&mut scenario));
            transfer::public_transfer(sword, nnamdi);
        };

        // Second transaction executed by nnamdi
        scenario.next_tx(nnamdi);
        {
            // Extract the sword owned by nnamdi
            let sword = test_scenario::take_from_sender<Sword>(&scenario);
            // Transfer the sword to daniel
            transfer::public_transfer(sword, daniel);
        };

        // Third transaction executed by daniel
        scenario.next_tx(daniel);
        {
            // Extract the sword owned by daniel
            let sword = test_scenario::take_from_sender<Sword>(&scenario);
            // Check if the sword has the correct values
            assert!(magic(&sword) == 42 && strength(&sword) == 7, 1);
            // Return the sword to the scenario
            test_scenario::return_to_sender(&mut scenario, sword);
        };
        test_scenario::end(scenario);
    }

}