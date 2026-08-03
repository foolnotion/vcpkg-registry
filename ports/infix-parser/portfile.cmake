vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO foolnotion/infix-parser
    REF a423216ed6aa329c2989b2e8686c75faab46ee66
    SHA512 d8866d0270046e07a602bda64a3c72d5cb8e4513471b49f61bb264cc45accb49e72a84a63c8e361b869ed3b62c970869acafa8454359bd7d485c5f22d1820049
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
