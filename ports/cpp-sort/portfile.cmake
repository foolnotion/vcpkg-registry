vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO morwenn/cpp-sort
  REF 3f4044e239397eb4b34b57caca0885ff80b6f15b
  SHA512 ab1fc0b50663d861a7d71cca57f5851e89539d571a402a7a061d12683ae0b34ba9017e02d1d7e7ec2db4def47f8060098a444ffb7b05ef676fb70391b248563a
  HEAD_REF main
)

include("${VCPKG_ROOT_DIR}/ports/vcpkg-cmake/vcpkg_cmake_build.cmake")
include("${VCPKG_ROOT_DIR}/ports/vcpkg-cmake/vcpkg_cmake_install.cmake")
include("${VCPKG_ROOT_DIR}/ports/vcpkg-cmake-config/vcpkg_cmake_config_fixup.cmake")

set(VCPKG_BUILD_TYPE release)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS
        -DCPPSORT_BUILD_TESTING=OFF
        -DCPPSORT_BUILD_EXAMPLES=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME cpp-sort CONFIG_PATH lib/cmake/cpp-sort DO_NOT_DELETE_PARENT_CONFIG_PATH)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share"
                    "${CURRENT_PACKAGES_DIR}/lib")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
