# /.get config variables
include(${CMAKE_SOURCE_DIR}/cmake/config.cmake)
include_directories(${SFML_PACKAGE_DIR}/include)
set(SFML_BIN ${SFML_PACKAGE_DIR}/bin)

set(SFML_LIB_LIST
    window
    system
    graphics
    audio
)

list(APPEND SFML_DLLS ${SFML_BIN}/openal32.dll)
list(APPEND SFML_DLLS_OUT ${TARGET_DIR}/openal32.dll)

foreach(SFML_LIB IN LISTS SFML_LIB_LIST)
    if(${TARGET_BUILD} MATCHES "RELEASE")
        list(APPEND SFML_DLLS "${SFML_BIN}/sfml-${SFML_LIB}-2.dll")
        list(APPEND SFML_DLLS_OUT "${TARGET_DIR}/sfml-${SFML_LIB}-2.dll")
    else()
        list(APPEND SFML_DLLS "${SFML_BIN}/sfml-${SFML_LIB}-d-2.dll")
        list(APPEND SFML_DLLS_OUT "${TARGET_DIR}/sfml-${SFML_LIB}-d-2.dll")
    endif()
endforeach()

file(INSTALL ${SFML_DLLS}
    DESTINATION ${TARGET_DIR})
