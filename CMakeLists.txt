CMAKE_MINIMUM_REQUIRED(VERSION 3.22)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

project(Oiskis)

# /.get config variables
include(${CMAKE_SOURCE_DIR}/cmake/config.cmake)

find_package(OpenGL REQUIRED)
link_directories(${OPENGL_gl_LIBRARY})

# /.add library
include(${CMAKE_SOURCE_DIR}/cmake/install_glew.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/install_sfml.cmake)

# /.main executable entry
add_executable(${OISK_NAME} ${OISK_SOURCE})

# /.linking
target_link_libraries(${OISK_NAME} ${GLEW_DLLS_OUT} ${SFML_DLLS_OUT})

install(TARGETS ${OISK_NAME} DESTINATION ${TARGET_DIR})