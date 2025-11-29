// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module transcript::transcript {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// A transcript that records a student's grades.
    public struct TranscriptObject has key {
        id: UID,
        history: u8,
        math: u8,
        literature: u8,
    }

    /// Creates a new transcript object and transfers it to the sender.
    public entry fun create_transcript_object(
        history: u8,
        math: u8,
        literature: u8,
        ctx: &mut TxContext
    ) {
        let transcript_object = TranscriptObject {
            id: object::new(ctx),
            history,
            math,
            literature,
        };
        transfer::public_transfer(transcript_object, tx_context::sender(ctx));
    }

    /// Returns the literature score from the transcript.
    public fun get_literature_score(transcript: &TranscriptObject): u8 {
        transcript.literature
    }

    /// Returns the math score from the transcript.
    public fun get_math_score(transcript: &TranscriptObject): u8 {
        transcript.math
    }

    /// Returns the history score from the transcript.
    public fun get_history_score(transcript: &TranscriptObject): u8 {
        transcript.history
    }

    /// Updates the literature score in the transcript.
    public entry fun update_literature_score(transcript: &mut TranscriptObject, new_score: u8) {
        transcript.literature = new_score;
    }

    /// Updates the math score in the transcript.
    public entry fun update_math_score(transcript: &mut TranscriptObject, new_score: u8) {
        transcript.math = new_score;
    }

    /// Updates the history score in the transcript.
    public entry fun update_history_score(transcript: &mut TranscriptObject, new_score: u8) {
        transcript.history = new_score;
    }

    /// Deletes the transcript object.
    public entry fun delete_transcript(transcript: TranscriptObject) {
        let TranscriptObject { id, history: _, math: _, literature: _ } = transcript;
        object::delete(id);
    }
}
