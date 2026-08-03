vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO foolnotion/ndsort
    REF bd3b323b8d4373287e8cf303bc6304b929bc8ab1
    SHA512 de6d5cd4f13039a13823ece60798d21b6e78fecd846b50fb92a48debf2392cde0efb3d767c7c699020f70f81334ad0b5c1ce3246d6d28d7f08f774d43d78e1ea
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_EXAMPLES=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ndsort CONFIG_PATH lib/cmake/ndsort)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
