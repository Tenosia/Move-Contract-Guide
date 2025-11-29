#[test_only]
module profile::profile_tests;

use profile::profile::{Self, User};
use std::string;
use std::debug;

#[test]
fun test_create_profile() {
    // Initialize the string values
    let name = string::utf8(b"nnamdi");
    let email = string::utf8(b"nnamdi@gmail.com");
    let dob = string::utf8(b"1st october 898bc");

    // Create a new user profile with the initialized values
    let user = profile::create_profile(name, email, dob);

    // Verify the user profile values
    assert!(user.name == string::utf8(b"nnamdi"), 0);
    assert!(user.email == string::utf8(b"nnamdi@gmail.com"), 1);
    assert!(user.dob == string::utf8(b"1st october 898bc"), 2);

    // Print the user profile values (for debugging)
    debug::print(&user.name);   // Should print: nnamdi
    debug::print(&user.email);  // Should print: nnamdi@gmail.com
    debug::print(&user.dob);    // Should print: 1st october 898bc
}