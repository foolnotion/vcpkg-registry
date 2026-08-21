vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO heal-research/pappus
    REF 4edb7a9c77419af67f7155538f07069c4f60ff3f
    SHA512 bd830edd6a6d59f4954e09c4a8e2c576b480dd169c2947c4a1f4d76780af4edd3e4172db932a6b9d8878f71e596185c484c31f5a29db49b873466b1032263d48
    HEAD_REF master
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
