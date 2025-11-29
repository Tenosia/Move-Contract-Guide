# Move Language Learning Journal

A comprehensive collection of Move programming tutorials and examples for learning Sui Move development. This repository contains working code examples, practical exercises, and step-by-step tutorials covering fundamental to intermediate Move concepts.

## Overview

This repository serves as a learning resource for developers exploring Move language development on the Sui blockchain. Each tutorial project demonstrates specific Move concepts through practical, runnable examples with accompanying tests.

## Prerequisites

Before getting started, ensure you have:
- Rust installed (see Installation guide)
- Sui CLI installed
- Basic understanding of blockchain concepts
- Familiarity with programming fundamentals

For detailed installation instructions, see the [Installation](Installation) guide.

## Project Structure

The repository is organized into multiple tutorial projects, each focusing on different Move concepts:

### Tutorial Projects

#### 1. Hello World
**Location:** `hello_world/`

A basic introduction to Move programming on Sui. This tutorial demonstrates:
- Module structure and organization
- Object creation using `UID`
- String handling with `std::string`
- Object transfer using `transfer::public_transfer`
- Basic Sui object capabilities (`key`, `store`)

**Key Concepts:**
- Creating Sui objects with `key` and `store` abilities
- Using `object::new()` to generate unique identifiers
- Transferring objects to users

#### 2. Messenger
**Location:** `messenger/`

A messaging module that shows how to create and manage message objects. This tutorial covers:
- Struct definition with multiple fields
- Entry functions for transaction execution
- Address handling and sender context
- Vector to String conversion

**Key Concepts:**
- Entry functions for on-chain transactions
- Working with addresses and transaction context
- String creation from byte vectors

#### 3. MyPackage (Example)
**Location:** `mypackage/`

An example package demonstrating object-oriented patterns in Move. This tutorial includes:
- Multiple struct definitions (Sword, Forge)
- Module initialization with `init` function
- Accessor functions (getters)
- Public and private function visibility
- Comprehensive testing with `test_scenario`

**Key Concepts:**
- Module initialization patterns
- Accessor functions for struct fields
- Test scenarios for multi-transaction testing
- Object ownership and transfer patterns

#### 4. Profile
**Location:** `profile/`

A user profile management module. This tutorial teaches:
- Struct definition with `copy`, `drop`, and `store` abilities
- Function return types
- Unit testing with `#[test]`
- Debug printing for testing

**Key Concepts:**
- Struct abilities (`copy`, `drop`, `store`)
- Value types vs. resource types
- Testing and debugging in Move

#### 5. Todo List
**Location:** `todo_list/`

A practical todo list application demonstrating collection management. This tutorial covers:
- Vector operations (add, remove, length)
- Mutable references (`&mut`)
- Object deletion
- List management patterns

**Key Concepts:**
- Working with vectors
- Mutable references and state modification
- Object lifecycle management
- CRUD operations in Move

#### 6. Transcript
**Location:** `transcript/`

A student transcript system for managing grades. This tutorial demonstrates:
- Multi-field object management
- Score retrieval and updates
- Object deletion patterns
- Struct destructuring

**Key Concepts:**
- Reading and updating object fields
- Mutable object references
- Object deletion with destructuring
- Data management patterns

## Getting Started

### Installation

1. Follow the installation guide in the [Installation](Installation) file to set up:
   - Rust toolchain
   - Sui CLI
   - Sui Move Analyzer
   - VSCode extensions (optional but recommended)

### Running Tutorials

Each tutorial project is a standalone Move package. To work with a specific tutorial:

```bash
# Navigate to a tutorial directory
cd hello_world

# Build the package
sui move build

# Run tests
sui move test

# For packages with tests, you can also run specific tests
sui move test --filter test_name
```

### Recommended Learning Path

1. **Start with Hello World** - Understand basic object creation
2. **Move to Profile** - Learn about struct abilities and value types
3. **Try Messenger** - Explore entry functions and transaction context
4. **Study MyPackage** - Understand initialization and accessor patterns
5. **Build Todo List** - Practice with collections and mutable state
6. **Complete Transcript** - Master object management and updates

## Key Move Concepts Covered

- **Structs and Abilities**: Understanding `key`, `store`, `copy`, `drop`
- **Objects**: Creating and managing Sui objects
- **Functions**: Public, private, and entry functions
- **Ownership**: Object ownership and transfer patterns
- **Collections**: Working with vectors
- **Testing**: Unit tests and test scenarios
- **Transaction Context**: Using `TxContext` for sender information
- **Object Lifecycle**: Creation, modification, and deletion

## Development Tools

Recommended VSCode extensions:
- Sui Move Analyzer
- Even Better TOML
- Move by MystenLabs
- Move Syntax by Damir Shamanaev

## Resources

- [Sui Move Documentation](https://docs.sui.io/concepts/sui-move-concepts)
- [Move Coding Conventions](https://docs.sui.io/concepts/sui-move-concepts/conventions)
- [Sui Developer Portal](https://sui.io/developers)

## Notes

This repository is a learning journal - the code examples are working implementations but may include commented code, experimental patterns, and learning annotations. Each tutorial builds upon previous concepts while introducing new Move language features.

## Contributing

This is a personal learning repository, but suggestions and improvements are welcome. Feel free to open issues or submit pull requests if you find errors or have ideas for additional tutorials.

## License

Check individual project files for license information.
