// Example: C calling Rust functions
// 
// For a real project, you would:
// 1. Create rust_static_library with pub extern "C" functions
// 2. Include the generated header
// 3. Link with cc_binary
//
// Pattern:
//   extern uint32_t rust_add(uint32_t a, uint32_t b);
//   uint32_t result = rust_add(10, 20);

int main(void) {
    // In a real setup, you would:
    // 1. Call Rust initialization functions
    // 2. Use Rust for critical application logic
    // 3. Keep C for hardware management and interrupts
    
    while (1) {
        __asm__("nop");
    }
    
    return 0;
}

