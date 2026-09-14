vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO heal-research/pappus
    REF 1d9626a62d5961fb04abaf69968b514fc800ebc6
    SHA512 83f62a6d4710bf1dd873f473153db4f8b7f33dad3684204fb510ac23bc4b8f1410408c64b28b8be5353dcadbdc85396b91e85fee0a2a63932664eba23fc6a482
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
