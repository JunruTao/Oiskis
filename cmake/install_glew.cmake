# /.get config variables
include(${CMAKE_SOURCE_DIR}/cmake/config.cmake)
include_directories(${GLEW_PACKAGE_DIR}/include)

set(GLEW_BIN ${GLEW_PACKAGE_DIR}/bin)
set(GLEW_LIBRARY, ${GLEW_PACKAGE_DIR}/lib)
set(GLEW_LIB_LIST
    glew32
)

list(APPEND GLEW_DLLS "${CMAKE_SOURCE_DIR}/extern/OPENGL/opengl32.dll")
list(APPEND GLEW_DLLS_OUT "${TARGET_DIR}/opengl32.dll")

foreach(GLEW_LIB IN LISTS GLEW_LIB_LIST)
    if(${BUILD_X32})
        list(APPEND GLEW_LIBS "${GLEW_BIN}/Win32/${GLEW_LIB}.lib")
        list(APPEND GLEW_DLLS "${GLEW_BIN}/Win32/${GLEW_LIB}.dll")
        list(APPEND GLEW_DLLS_OUT "${TARGET_DIR}/${GLEW_LIB}.dll")
    else()
        list(APPEND GLEW_LIBS "${GLEW_BIN}/x64/${GLEW_LIB}.lib")
        list(APPEND GLEW_DLLS "${GLEW_BIN}/x64/${GLEW_LIB}.dll")
        list(APPEND GLEW_DLLS_OUT "${TARGET_DIR}/${GLEW_LIB}.dll")
    endif()
endforeach()

file(INSTALL ${GLEW_DLLS}
    DESTINATION ${TARGET_DIR})

link_directories(${OISK_NAME} ${GLEW_LIBRARY})
