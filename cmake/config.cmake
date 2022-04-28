
# /.packages
set(SFML_PACKAGE_DIR ${CMAKE_SOURCE_DIR}/extern/SFML)
set(GLEW_PACKAGE_DIR ${CMAKE_SOURCE_DIR}/extern/GLEW)
set(OISK_RESOURCE_DIR ${CMAKE_SOURCE_DIR}/resource)

# /.version
set(OISK_VERSION_MAJOR 1)
set(OISK_VERSION_MINOR 0)
set(OISK_VERSION_PATCH 1)
set(OISK_VERSION_TEXTS "${OISK_VERSION_MAJOR}.${OISK_VERSION_MINOR}.${OISK_VERSION_PATCH}")

# /.build config
set(BUILD_X32 OFF)

# /.source
set(OISK_SOURCE_DIR ${CMAKE_SOURCE_DIR}/source)
set(OISK_SOURCE ${OISK_SOURCE_DIR}/main.cpp)

# /.target
set(OISK_NAME Oiskis_${OISK_VERSION_TEXTS})
if(CMAKE_BUILD_TYPE MATCHES Release)
    set(TARGET_DIR ${CMAKE_SOURCE_DIR}/release/${OISK_NAME}_release)
    set(TARGET_BUILD "RELEASE")
else()
    add_definitions(-DDEBUG)
    set(TARGET_DIR ${CMAKE_SOURCE_DIR}/build)
    set(TARGET_BUILD "DEBUG")
endif()