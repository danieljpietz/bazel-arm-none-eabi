mod c_interface;

fn main() {
    // Call C functions from Rust using wrappers
    let result1 = c_interface::call_c_add(15, 25);      // 40
    let result2 = c_interface::call_c_multiply(7, 8);   // 56
    
    // Rust logic
    let sum = result1 + result2;  // 96
    
    // In bare-metal, typically infinite loop
    loop {
        // Application logic
    }
}
