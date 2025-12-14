"""Root BUILD file for bazel-toolchains repository."""

load("//toolchains/gcc_arm_none_eabi:cc_toolchain_config.bzl", "arm_none_eabi_cc_toolchain_config")

package(default_visibility = ["//visibility:public"])

# Reference all files in the third-party toolchain
filegroup(
    name = "toolchain_all_files",
    srcs = ["//third_party/arm_gnu_toolchain:all_files"],
)

# Configuration for the CC toolchain - using absolute paths from root
arm_none_eabi_cc_toolchain_config(
    name = "arm_none_eabi_config_impl",
    bin_dir = "third_party/arm_gnu_toolchain/arm-gnu-toolchain-14.3.rel1-darwin-arm64-arm-none-eabi/bin",
    sysroot = "third_party/arm_gnu_toolchain/arm-gnu-toolchain-14.3.rel1-darwin-arm64-arm-none-eabi/arm-none-eabi",
    builtin_include_dirs = [
        "third_party/arm_gnu_toolchain/arm-gnu-toolchain-14.3.rel1-darwin-arm64-arm-none-eabi/arm-none-eabi/include",
    ],
)

# The CC toolchain rule
cc_toolchain(
    name = "arm_none_eabi_cc_toolchain",
    toolchain_identifier = "arm-none-eabi-gcc-14.3",
    toolchain_config = ":arm_none_eabi_config_impl",
    all_files = ":toolchain_all_files",
    compiler_files = ":toolchain_all_files",
    linker_files = ":toolchain_all_files",
    ar_files = ":toolchain_all_files",
    as_files = ":toolchain_all_files",
    objcopy_files = ":toolchain_all_files",
    strip_files = ":toolchain_all_files",
    dwp_files = ":toolchain_all_files",
    supports_param_files = 1,
)

# The toolchain wrapper that registers this CC toolchain
# for the ARM none-EABI target
toolchain(
    name = "arm_none_eabi_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    toolchain = ":arm_none_eabi_cc_toolchain",
    target_compatible_with = [
        "@platforms//os:none",
        "@platforms//cpu:arm",
    ],
)
