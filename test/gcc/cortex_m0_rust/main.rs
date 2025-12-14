#![no_std]
#![no_main]

// Cortex-M0 Rust bare-metal example
#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}
