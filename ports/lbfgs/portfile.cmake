vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO foolnotion/lbfgs
    REF 2ccd9d9c173bec3b3ecd9580f3988ea9148dfeba
    SHA512 4baf99ab4f872f9b9a9301b3172df65352567db559f7e195502dc8edc766d16509d57dd18f31f469eacd68015e663ddd87d453da2128e7bd253b0ce7d5d83b9c
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
