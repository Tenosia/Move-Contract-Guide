module profile::profile {
    use std::string::String;

    public struct User has copy, drop, store {
        name: String,
        email: String,
        dob: String,
    }

    public fun create_profile(name: String, email: String, dob: String): User {
        User {
            name,
            email,
            dob,
        }
    }

#[test]

//  test the create_profile function
//  this test is used to check if the create_profile function works as expected
//  it creates a new user profile and prints the values of the profile
//  the test should pass if the create_profile function works as expected
//  the test should print the values of the profile


public fun test_create_profile() {
    use std::string;
    use std::debug;
    use profile::profile;

//  initialize the string values
    let name = string::utf8(b"nnamdi");
    let email = string::utf8(b"nnamdi@gmail.com");
    let dob = string::utf8(b"1st october 898bc");

//  create a new user profile with the initialized values
    let user = profile::create_profile(name, email, dob);

//  print the user profile values
    debug::print(&user.name);   //should print: nnamdi
    debug::print(&user.email);  //should print: nnamdi@gmail.com
    debug::print(&user.dob);    //should print: 1st october 898bc

}

}