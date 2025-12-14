"""Rust toolchain configuration for ARM none-EABI targets."""

def rustc_arm_none_eabi_toolchain():
    """Configure Rust toolchain for ARM none-EABI bare-metal development."""
    # Default flags for bare-metal Rust compilation
    return {
        "common_flags": [
            "-C", "opt-level=z",           # Optimize for size
            "-C", "lto=thin",              # Enable Link Time Optimization
            "-C", "panic=abort",           # Abort on panic (no unwinding)
            "-C", "relocation-model=static",
            "--edition", "2021",
        ],
        "common_linkopts": [
            "-Wl,--gc-sections",           # Remove unused sections
            "-Wl,-z,relro",                # RELRO support
        ],
        "target_triples": {
            "cortex_m0": "thumbv6m-none-eabi",
            "cortex_m3": "thumbv7m-none-eabi",
            "cortex_m33": "thumbv8m.main-none-eabi",
            "cortex_m7": "thumbv7em-none-eabihf",
        },
    }
