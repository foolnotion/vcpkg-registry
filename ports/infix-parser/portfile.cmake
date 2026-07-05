vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO foolnotion/infix-parser
    REF 2e48507942f3c1c6c04385d688402bc1b76220e0
    SHA512 96353570a96ae6d667370272308ae93dfcf2a7d711ab1025f7b4a047a6ec4995a3b68c15a1168fac831af129616d6053847418713aa3c3664f3fb055b6b4fe9d
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release)

# infix-parser links lexy/fmt/fast_float PRIVATE and never find_dependency()s
# them, assuming consumers never need those symbols directly. That only
# holds if infix-parser itself is a shared library (its private deps get
# resolved at its own link time); a static build leaks them into the
# installed link interface and breaks find_package(infix-parser) for any
# consumer that doesn't also have lexy on CMAKE_PREFIX_PATH. Force shared
# regardless of the triplet.
set(VCPKG_LIBRARY_LINKAGE dynamic)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_EXAMPLES=OFF
        -DBUILD_SHARED_LIBS=ON
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME infix-parser CONFIG_PATH lib/cmake/infix-parser DO_NOT_DELETE_PARENT_CONFIG_PATH)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
