#[test_only]
module transcript::transcript_tests;

use transcript::transcript::{Self, TranscriptObject};
use sui::test_scenario;

#[test]
fun test_transcript_operations() {
    let sender = @0xBABE;
    let mut scenario = test_scenario::begin(sender);
    
    {
        transcript::create_transcript_object(85, 90, 88, test_scenario::ctx(&mut scenario));
    };
    
    scenario.next_tx(sender);
    {
        let transcript = test_scenario::take_from_sender<TranscriptObject>(&scenario);
        assert!(transcript::get_history_score(&transcript) == 85, 0);
        assert!(transcript::get_math_score(&transcript) == 90, 1);
        assert!(transcript::get_literature_score(&transcript) == 88, 2);
        test_scenario::return_to_sender(&mut scenario, transcript);
    };
    
    scenario.next_tx(sender);
    {
        let transcript = test_scenario::take_from_sender<TranscriptObject>(&scenario);
        transcript::update_literature_score(&mut transcript, 95);
        assert!(transcript::get_literature_score(&transcript) == 95, 3);
        transcript::update_math_score(&mut transcript, 92);
        assert!(transcript::get_math_score(&transcript) == 92, 4);
        transcript::delete_transcript(transcript);
    };
    
    test_scenario::end(scenario);
}
