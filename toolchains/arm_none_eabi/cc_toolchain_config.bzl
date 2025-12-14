"""CC Toolchain configuration for arm-none-eabi targets using GNU GCC 14.3."""

load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
     "feature",
     "flag_group",
     "flag_set",
     "tool_path",
)

def _tool(ctx, exe):
    """Construct tool path from the bin_dir."""
    return "%s/%s" % (ctx.attr.bin_dir, exe)

def _impl(ctx):
    """Implementation of the ARM none-EABI GCC toolchain configuration."""
    gcc = _tool(ctx, "arm-none-eabi-gcc")
    gxx = _tool(ctx, "arm-none-eabi-g++")

    # Using gcc as the linker driver is typically best for bare-metal/newlib.
    tool_paths = [
        tool_path(name = "gcc",     path = gcc),
        tool_path(name = "g++",     path = gxx),
        tool_path(name = "ld",      path = gcc),
        tool_path(name = "ar",      path = _tool(ctx, "arm-none-eabi-ar")),
        tool_path(name = "as",      path = _tool(ctx, "arm-none-eabi-as")),
        tool_path(name = "nm",      path = _tool(ctx, "arm-none-eabi-nm")),
        tool_path(name = "objcopy", path = _tool(ctx, "arm-none-eabi-objcopy")),
        tool_path(name = "objdump", path = _tool(ctx, "arm-none-eabi-objdump")),
        tool_path(name = "strip",   path = _tool(ctx, "arm-none-eabi-strip")),
        tool_path(name = "cpp",     path = _tool(ctx, "arm-none-eabi-cpp")),
    ]

    sysroot = ctx.attr.sysroot.strip()

    # Default compilation flags for bare-metal embedded systems
    common_copts = [
        "-ffreestanding",
        "-fno-builtin",
        "-fdata-sections",
        "-ffunction-sections",
        "-g",
    ]
    
    # Default linker flags for bare-metal embedded systems
    common_linkopts = [
        "-Wl,--gc-sections",
    ]

    if sysroot:
        common_copts.append("--sysroot=" + sysroot)
        common_linkopts.append("--sysroot=" + sysroot)

    features = [
        feature(
            name = "default_compile_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [
                        "c-compile",
                        "c++-compile",
                        "assemble",
                        "preprocess-assemble",
                        "c++-header-parsing",
                    ],
                    flag_groups = [flag_group(flags = common_copts)],
                ),
            ],
        ),
        feature(
            name = "default_link_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [
                        "c++-link-executable",
                        "c++-link-dynamic-library",
                        "c++-link-nodeps-dynamic-library",
                    ],
                    flag_groups = [flag_group(flags = common_linkopts)],
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "arm-none-eabi-gcc-14.3",
        host_system_name = "darwin",
        target_system_name = "arm-none-eabi",
        target_cpu = "arm",
        target_libc = "newlib",
        compiler = "gcc",
        abi_version = "eabi",
        abi_libc_version = "newlib",
        tool_paths = tool_paths,
        features = features,
        cxx_builtin_include_directories = list(ctx.attr.builtin_include_dirs),
    )

# Define the rule at TOP LEVEL (required).
arm_none_eabi_cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "bin_dir": attr.string(mandatory = True),
        "sysroot": attr.string(default = ""),
        "builtin_include_dirs": attr.string_list(default = []),
    },
    provides = [CcToolchainConfigInfo],
)
