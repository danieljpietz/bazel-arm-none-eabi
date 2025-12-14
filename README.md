# ARM Bazel Toolchain

Bazel toolchain for bare-metal ARM development with GCC 14.3.

## Quick Start

```bash
bazel build //test/hello:hello.elf
```

## Example

```python
cc_binary(
    name = "app.elf",
    srcs = ["main.c"],
    additional_linker_inputs = ["link.ld"],
    linkopts = [
        "-nostdlib",
        "-Wl,-T,$(location link.ld)",
        "-Wl,--gc-sections",
    ],
    copts = ["-mcpu=cortex-m4", "-mthumb"],
)
```

## Processor Flags

| CPU | Flags |
|-----|-------|
| M0 | `-mcpu=cortex-m0 -mthumb` |
| M3 | `-mcpu=cortex-m3 -mthumb` |
| M4 | `-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard` |
| M7 | `-mcpu=cortex-m7 -mthumb -mfpu=fpv5-d16 -mfloat-abi=hard` |
| M33 | `-mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=hard` |

Default: `-ffreestanding -fno-builtin -fdata-sections -ffunction-sections -g -Wl,--gc-sections`

## Build

```bash
bazel build //test/hello:hello.elf --platforms=//platforms:arm_none_eabi
```

Toolchain: GCC 14.3 for arm-none-eabi  
Sysroot: third_party/arm_gnu_toolchain/arm-gnu-toolchain-14.3.rel1-darwin-arm64-arm-none-eabi/
