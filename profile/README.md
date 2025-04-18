# 📘 Profile Module on Move

This is a simple Move module named `profile` that defines a `User` struct and provides a function to create a user profile. It includes a test that prints out user profile values to verify that everything works as expected.

---

## 🚀 Features

- Defines a `User` struct with the following fields:
  - `name: String`
  - `email: String`
  - `dob: String` (date of birth)
- Provides a `create_profile` function to instantiate new user profiles.
- Includes a unit test using `#[test]` and `debug::print` to validate profile creation.

---

## 📦 Module Structure

```move
module profile::profile {
    struct User {
        name: String,
        email: String,
        dob: String,
    }

    public fun create_profile(name: String, email: String, dob: String): User
}
