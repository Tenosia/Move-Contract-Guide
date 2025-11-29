module profile::profile {
    use std::string;

    /// A user profile struct containing name, email, and date of birth
    public struct User has copy, drop, store {
        name: string::String,
        email: string::String,
        dob: string::String,
    }

    /// Creates a new user profile with the provided information
    public fun create_profile(
        name: string::String,
        email: string::String,
        dob: string::String
    ): User {
        User {
            name,
            email,
            dob,
        }
    }

    /// Returns the name of the user
    public fun get_name(user: &User): string::String {
        user.name
    }

    /// Returns the email of the user
    public fun get_email(user: &User): string::String {
        user.email
    }

    /// Returns the date of birth of the user
    public fun get_dob(user: &User): string::String {
        user.dob
    }
}