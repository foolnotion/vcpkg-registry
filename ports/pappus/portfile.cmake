vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO heal-research/pappus
    REF 946f0f908ea3425a883fff925e26a96a2b7b56bd
    SHA512 ce410390d1ecac34c35359304f9d4c5e7af6526c7a37b2cef890cb0318da9a478de51d5278ca2dc69f438912bab2c88932363596d1ed01c18d6e63c93f66e73d
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release) # header-only port

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME pappus CONFIG_PATH share/pappus)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
