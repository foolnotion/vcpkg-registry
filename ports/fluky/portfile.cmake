vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO foolnotion/fluky
    REF 72dd16f38f9e7a76f3a81a2c65cd2bc616b65502
    SHA512 81c73c06c7e8d780dae22124ccbc7d247abf3825a2500dcb8e773842283c424d8793e636d83373478a3749bef928f1bc86710ce590e19914203ba89b89834b2a
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
