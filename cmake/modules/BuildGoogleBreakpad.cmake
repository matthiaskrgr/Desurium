set(BREAKPAD_EXCEPTION_HANDLER_INSTALL_DIR ${CMAKE_EXTERNAL_BINARY_DIR}/breakpad)

if(WIN32)
  set(CONFIGURE_COMMAND ${PYTHON_EXECUTABLE} ../breakpad/src/tools/gyp/gyp ../breakpad/src/client/windows/breakpad_client.gyp)
else()
  set(CONFIGURE_COMMAND <SOURCE_DIR>/configure --enable-shared=no --enable-static=yes --prefix=${BREAKPAD_EXCEPTION_HANDLER_INSTALL_DIR})
endif()

ExternalProject_Add(
    breakpad
    SVN_REPOSITORY http://google-breakpad.googlecode.com/svn/trunk -r 699
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${CONFIGURE_COMMAND}
)

set(BREAKPAD_EXCEPTION_HANDLER_LIBRARY ${BREAKPAD_EXCEPTION_HANDLER_INSTALL_DIR}/lib)
set(BREAKPAD_EXCEPTION_HANDLER_INCLUDE_DIR ${BREAKPAD_EXCEPTION_HANDLER_INSTALL_DIR}/include)
set(BREAKPAD_EXCEPTION_HANDLER_LIBRARIES "${BREAKPAD_EXCEPTION_HANDLER_LIBRARY}/libbreakpad.a;${BREAKPAD_EXCEPTION_HANDLER_LIBRARY}/libbreakpad_client.a")

ExternalProject_Add_Step(breakpad install_headers
    COMMAND cp -r <SOURCE_DIR>/src ${BREAKPAD_EXCEPTION_HANDLER_INCLUDE_DIR}
    DEPENDEES install
)
