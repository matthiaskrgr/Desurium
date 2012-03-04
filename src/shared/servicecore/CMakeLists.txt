include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/code
  ${GLOBAL_INCLUDE_DIRS}
  ${COMMON_INCLUDE_DIRS}
  ${CEF_INCLUDE_DIRS}
  ${IPC_PIPE_INCLUDE_DIRS}
  ${SQLITE3X_INCLUDE_DIRS}
  ${TINYXML_INCLUDE_DIRS}
)

file(GLOB Headers code/*.h)
file(GLOB Sources code/ComplexLaunchProcess.cpp
                  code/InstallProcess.cpp
                  code/InstallScriptRunTime.cpp
                  code/Log.cpp
                  code/McfInit.cpp
                  code/ServiceCore.cpp
                  code/ServiceCoreMain.cpp
                  code/ServiceMainThread.cpp
                  code/UnInstallBranchProcess.cpp
                  code/UnInstallProcess.cpp
                  code/UnInstallRegKey.cpp
                  code/UpdateProcess.cpp
                  code/UpdateShortcuts.cpp
)

if(DEFINED WIN32)
  file(GLOB PlattformSources
                  code/WindowsGameExplorer.cpp
)
else()
  file(GLOB PlattformSources)
endif()

add_library(servicecore SHARED ${Sources} ${PlattformSources})
target_link_libraries(servicecore
    tinyxml
)