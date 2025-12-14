// C function declarations linking to C implementation
extern "C" {
    pub fn c_multiply(a: u32, b: u32) -> u32;
    pub fn c_add(a: u32, b: u32) -> u32;
}

// Safe Rust wrappers around C functions
pub fn call_c_multiply(a: u32, b: u32) -> u32 {
    unsafe { c_multiply(a, b) }
}

pub fn call_c_add(a: u32, b: u32) -> u32 {
    unsafe { c_add(a, b) }
}



