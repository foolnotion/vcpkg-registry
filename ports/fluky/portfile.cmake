vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO foolnotion/fluky
    REF bc7fd453f0cdf900b17b20bb6d22aff1b9dc6d98
    SHA512 5508490533885588278cb7d554298f999667f6cecf74f2d517190607ea34017cf4b216dabfda9f5ce81f429fdb50376d5f800c5e3387250688b2669e06457091
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
