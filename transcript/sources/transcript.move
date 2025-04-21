/*
/// Module: transcript
module transcript::transcript;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module transcript::transcript {
    // A transcript that records a student's grades.

    public struct TranscriptObject has key {
        id: UID,
        history: u8,
        math: u8,
        literature: u8,
    }

    public fun create_transcript_object(history: u8, math: u8, literature: u8, ctx: &mut TxContext) {
        let transcriptObject = TranscriptObject {
            id: object::new(ctx),
            history,
            math,
            literature,
        };
        transfer::transfer(transcriptObject, tx_context::sender(ctx))
    }
}
