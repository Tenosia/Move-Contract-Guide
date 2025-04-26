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
//function to create a new transcript object
    public fun create_transcript_object(history: u8, math: u8, literature: u8, ctx: &mut TxContext) {
        let transcriptObject = TranscriptObject {
            id: object::new(ctx),
            history,
            math,
            literature,
        };
        transfer::transfer(transcriptObject, tx_context::sender(ctx))
    }

// Function to get the literature score from the transcript
    public fun get_score(transcript: &TranscriptObject): u8 {
        transcript.literature
    }

// Function to update the literature score in the transcript
    public fun update_score(transcript: &mut TranscriptObject, new_score: u8) {
        transcript.literature = new_score;
    }

// Function to perform delete operations on the transcript
    public fun delete_transcript(transcript: TranscriptObject){
        // unpack the transcript obejct and take the id 
        let TranscriptObject{id, history: _, math: _, literature: _} = transcript;
        object::delete(id);
    }

}
