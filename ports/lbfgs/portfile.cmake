vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO foolnotion/lbfgs
    REF 7f0dc16193fe2dc05b866fd71d620c1badabe19e
    SHA512 9528ac06896ac68e992a82a9b8368fe4d8249c58c8b047e569eb1e1fca805aea784c0d940d6f6352d7acf4affce933ee5097c9eabd073523cf5a12016eba8a88
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release) # header-only port
set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled) # foolnotion/lbfgs has no license file

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
