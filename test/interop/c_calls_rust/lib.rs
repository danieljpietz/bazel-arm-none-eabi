// Rust function to be called from C
pub extern "C" fn rust_add(a: u32, b: u32) -> u32 {
    a + b
}

pub extern "C" fn rust_multiply(a: u32, b: u32) -> u32 {
    a * b
}
