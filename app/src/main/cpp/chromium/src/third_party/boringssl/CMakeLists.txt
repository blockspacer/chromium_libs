cmake_minimum_required(VERSION 3.6)
project(boringssl)

string(TOLOWER "${CMAKE_BUILD_TYPE}" CMAKE_BUILD_TYPE_LOWER)

if(CMAKE_SYSTEM_NAME MATCHES "Android")
  set(LIB_NAME boringssl)
  enable_language(ASM)
  if("${ANDROID_ABI}" STREQUAL "arm64-v8a")
    set(BORING_SSL_ASM_SRC
        linux-aarch64/crypto/chacha/chacha-armv8.S
        linux-aarch64/crypto/fipsmodule/aesv8-armx64.S
        linux-aarch64/crypto/fipsmodule/armv8-mont.S
        linux-aarch64/crypto/fipsmodule/ghash-neon-armv8.S
        linux-aarch64/crypto/fipsmodule/ghashv8-armx64.S
        linux-aarch64/crypto/fipsmodule/sha1-armv8.S
        linux-aarch64/crypto/fipsmodule/sha256-armv8.S
        linux-aarch64/crypto/fipsmodule/sha512-armv8.S
        linux-aarch64/crypto/fipsmodule/vpaes-armv8.S
        linux-aarch64/crypto/test/trampoline-armv8.S
        linux-aarch64/crypto/third_party/sike/asm/fp-armv8.S
       )
  elseif("${ANDROID_ABI}" STREQUAL "armeabi-v7a")
    set(BORING_SSL_ASM_SRC
        linux-arm/crypto/chacha/chacha-armv4.S
        linux-arm/crypto/fipsmodule/aes-armv4.S
        linux-arm/crypto/fipsmodule/aesv8-armx32.S
        linux-arm/crypto/fipsmodule/armv4-mont.S
        linux-arm/crypto/fipsmodule/bsaes-armv7.S
        linux-arm/crypto/fipsmodule/ghash-armv4.S
        linux-arm/crypto/fipsmodule/ghashv8-armx32.S
        linux-arm/crypto/fipsmodule/sha1-armv4-large.S
        linux-arm/crypto/fipsmodule/sha256-armv4.S
        linux-arm/crypto/fipsmodule/sha512-armv4.S
        linux-arm/crypto/test/trampoline-armv4.S
        src/crypto/curve25519/asm/x25519-asm-arm.S
        src/crypto/poly1305/poly1305_arm_asm.S
       )
  endif()

  # load boring source files into variable BORING_SSL_SRC
  include(boringssl_sources.cmake)

  add_library(${LIB_NAME} SHARED ${BORING_SSL_SRC})

  target_include_directories(${LIB_NAME} PUBLIC src/include)

  target_compile_definitions(${LIB_NAME} PUBLIC BORINGSSL_SHARED_LIBRARY)
  target_compile_definitions(${LIB_NAME} PRIVATE
                             BORINGSSL_ALLOW_CXX_RUNTIME
                             BORINGSSL_IMPLEMENTATION
                             BORINGSSL_NO_STATIC_INITIALIZER
                             OPENSSL_SMALL
                             _XOPEN_SOURCE=700
                            )
  # build flags for debug build only
  if("${CMAKE_BUILD_TYPE_LOWER}" STREQUAL "debug")
    target_compile_definitions(${LIB_NAME} PRIVATE _DEBUG)
  else()
    target_compile_definitions(${LIB_NAME} PRIVATE NDEBUG)
  endif()

  target_compile_options(${LIB_NAME} PRIVATE $<$<OR:$<COMPILE_LANGUAGE:C>,$<COMPILE_LANGUAGE:CXX>>:
                         -fno-strict-aliasing
                         --param=ssp-buffer-size=4
                         -fstack-protector
                         -funwind-tables
                         -fPIC
                         -fcolor-diagnostics
                         -fmerge-all-constants
                         #-fcrash-diagnostics-dir=../../tools/clang/crashreports
                         #-Xclang -mllvm
                         #-Xclang -instcombine-lower-dbg-declare=0
                         -fcomplete-member-pointers
                         -ffunction-sections
                         -fno-short-enums
                         #--target=aarch64-linux-android
                         #-isystem../../third_party/android_ndk/sysroot/usr/include/aarch64-linux-android
                         #-D__ANDROID_API__=21
                         #-mno-outline
                         -Wno-builtin-macro-redefined
                         -D__DATE__=
                         -D__TIME__=
                         -D__TIMESTAMP__=
                         #-Xclang -fdebug-compilation-dir
                         #-Xclang .
                         -no-canonical-prefixes
                         -Oz
                         -fno-ident
                         -fdata-sections
                         -ffunction-sections
                         #-fno-omit-frame-pointer
                         -g2
                         -ggnu-pubnames
                         -fvisibility=hidden
                         #-Xclang -add-plugin
                         #-Xclang find-bad-constructs
                         #-Xclang -plugin-arg-find-bad-constructs
                         #-Xclang check-ipc
                         -Wheader-hygiene
                         -Wstring-conversion
                         -Wtautological-overlap-compare
                         #-Wno-shorten-64-to-32
                         -Werror
                         -Wall
                         -Wno-unused-variable
                         -Wno-missing-field-initializers
                         -Wno-unused-parameter
                         -Wno-c++11-narrowing
                         -Wno-unneeded-internal-declaration
                         -Wno-undefined-var-template
                         -Wno-ignored-pragma-optimize
                       >)

  if("${ANDROID_ABI}" STREQUAL "arm64-v8a")
    target_compile_options(${LIB_NAME} PRIVATE $<$<OR:$<COMPILE_LANGUAGE:C>,$<COMPILE_LANGUAGE:CXX>>:
                           -mno-outline
                           -fno-omit-frame-pointer
                           -Wno-shorten-64-to-32
                         >)
  elseif("${ANDROID_ABI}" STREQUAL "armeabi-v7a")
    target_compile_options(${LIB_NAME} PRIVATE $<$<OR:$<COMPILE_LANGUAGE:C>,$<COMPILE_LANGUAGE:CXX>>:
                           -DHAVE_PTHREAD_COND_TIMEDWAIT_MONOTONIC=1
                           -march=armv7-a
                           -mfloat-abi=softfp
                           -mtune=generic-armv7-a
                           -mfpu=neon
                           -mthumb
                           -fomit-frame-pointer
                           -gdwarf-3
                         >)
  endif()

  target_compile_options(${LIB_NAME} PRIVATE $<$<COMPILE_LANGUAGE:ASM>:
                         -fPIC
                         -fno-strict-aliasing
                         --param=ssp-buffer-size=4
                         -fstack-protector
                         -funwind-tables
                         -fPIC
                         -fcolor-diagnostics
                         -fmerge-all-constants
                         #-fcrash-diagnostics-dir=../../tools/clang/crashreports
                         #-Xclang -mllvm
                         #-Xclang -instcombine-lower-dbg-declare=0
                         -fcomplete-member-pointers
                         -std=c11
                         -ffunction-sections
                         -fno-short-enums
                         #--target=aarch64-linux-android
                         #-isystem../../third_party/android_ndk/sysroot/usr/include/aarch64-linux-android
                         #-D__ANDROID_API__=21
                         #-mno-outline
                         #-Wa,-fdebug-compilation-dir,.
                         -g2
                         #--sysroot=../../third_party/android_ndk/sysroot
                       >)

  if("${ANDROID_ABI}" STREQUAL "arm64-v8a")
    target_compile_options(${LIB_NAME} PRIVATE $<$<COMPILE_LANGUAGE:ASM>:-mno-outline>)
  elseif("${ANDROID_ABI}" STREQUAL "armeabi-v7a")
    target_compile_options(${LIB_NAME} PRIVATE $<$<COMPILE_LANGUAGE:ASM>:
                           -DHAVE_PTHREAD_COND_TIMEDWAIT_MONOTONIC=1
                           -march=armv7-a
                           -mfloat-abi=softfp
                           -mtune=generic-armv7-a
                           -mfpu=neon
                           -gdwarf-3
                         >)
  endif()

  target_compile_options(${LIB_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:-std=c11 -std=c99>)

  # build flags for debug build only
  if("${CMAKE_BUILD_TYPE_LOWER}" STREQUAL "debug")
    target_compile_options(${LIB_NAME} PRIVATE $<$<COMPILE_LANGUAGE:CXX>:
                           -Wno-undefined-bool-conversion
                           -Wno-tautological-undefined-compare
                         >)
  endif()

  target_compile_options(${LIB_NAME} PRIVATE $<$<COMPILE_LANGUAGE:CXX>:
                         -std=c++14
                         -fno-exceptions
                         -fno-rtti
                         #-nostdinc++
                         #-isystem../../buildtools/third_party/libc++/trunk/include
                         #-isystem../../buildtools/third_party/libc++abi/trunk/include
                         #--sysroot=../../third_party/android_ndk/sysroot
                         #-isystem../../third_party/android_ndk/sources/android/support/include
                         -fvisibility-inlines-hidden
                       >)

  set_property(TARGET ${LIB_NAME} APPEND_STRING PROPERTY LINK_FLAGS
"-Wl,--fatal-warnings \
-fPIC \
-Wl,-z,noexecstack \
-Wl,-z,relro \
-Wl,-z,defs \
-Wl,--as-needed \
-fuse-ld=lld \
-Wl,--color-diagnostics \
-Wl,--no-rosegment \
-Wl,--exclude-libs=libgcc.a \
-Wl,--exclude-libs=libvpx_assembly_arm.a \
-Wl,--gdb-index \
-Wl,--warn-shared-textrel \
-Werror"
 #-Wl,-z,max-page-size=4096 \
 #-Wl,-mllvm,-enable-machine-outliner=never \
 #--gcc-toolchain=../../third_party/android_ndk/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64 \
 #--sysroot=../../third_party/android_ndk/platforms/android-21/arch-arm64 \
 #--target=aarch64-linux-android \
 #-nostdlib \
)

  if("${ANDROID_ABI}" STREQUAL "arm64-v8a")
    # linker flags for arm64-v8a only
    set_property(TARGET ${LIB_NAME} APPEND_STRING PROPERTY LINK_FLAGS
"-Wl,-z,max-page-size=4096 \
-Wl,-mllvm,-enable-machine-outliner=never"
)
  endif()

  # linker flags for release build only
  if(NOT "${CMAKE_BUILD_TYPE_LOWER}" STREQUAL "debug")
    set_property(TARGET ${LIB_NAME} APPEND_STRING PROPERTY LINK_FLAGS
"-Wl,--warn-shared-textrel \
-Wl,-O2"
#-Wl,--gc-sections"
)
  endif()

endif()
