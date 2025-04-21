# 📘 Transcript Module — Move on Sui

This module defines a simple on-chain **Transcript** object that stores a student's grades for multiple subjects, and allows users to create and own their personal transcript.

---

## 📦 Module: `transcript::transcript`

### 🧱 Structs

#### `TranscriptObject`

A resource that stores grades for a student:

```move
public struct TranscriptObject has key {
    id: UID,
    history: u8,
    math: u8,
    literature: u8,
}
