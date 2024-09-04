use similar::{ChangeTag, TextDiff};

// Define the enum for the sign
#[derive(Debug, Clone)]
pub enum DiffSign {
    Delete,
    Insert,
    Equal,
}

// Define the struct for each diff element
#[derive(Debug, Clone)]
pub struct DiffElement {
    pub value: String,
    pub sign: DiffSign,
}

#[flutter_rust_bridge::frb(sync)]
pub fn diff(text1: String, text2: String) -> Vec<DiffElement> {
    let diff = TextDiff::from_words(&text1, &text2);
    
    diff.iter_all_changes()
        .map(|change| DiffElement {
            value: change.to_string(),
            sign: match change.tag() {
                ChangeTag::Delete => DiffSign::Delete,
                ChangeTag::Insert => DiffSign::Insert,
                ChangeTag::Equal => DiffSign::Equal,
            },
        })
        .collect()
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}