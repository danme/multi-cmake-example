# CPack properties
set(CPACK_ARCHIVE_COMPONENT_INSTALL ON)
set(CPACK_COMPONENTS_GROUPING ONE_PER_GROUP)

# coponents
set(CPACK_COMPONENTS_ALL BaseDevel Core CoreDevel A ADevel B BDevel)

# names & descriptions
set(CPACK_COMPONENT_BASEDEVEL_DISPLAY_NAME "Base Development")
set(CPACK_COMPONENT_BASEDEVEL_DESCRIPTION "CMake support for Base package.")

set(CPACK_COMPONENT_A_DISPLAY_NAME "Core Adapter A")
set(CPACK_COMPONENT_A_DESCRIPTION "Adpater for the Base core library conforming to the A interface.")

# requireds
set(CPACK_COMPONENT_CORE_REQUIRED ON)

# dependencies
set(CPACK_COMPONENT_COREDEVEL_DEPENDS BaseDevel)

set(CPACK_COMPONENT_A_DEPENDS Core)
set(CPACK_COMPONENT_ADEVEL_DEPENDS CoreDevel A)

set(CPACK_COMPONENT_B_DEPENDS Core)
set(CPACK_COMPONENT_BDEVEL_DEPENDS CoreDevel B)

# groups
# Runtime
set(CPACK_COMPONENT_CORE_GROUP "Runtime")
set(CPACK_COMPONENT_A_GROUP "Runtime")
set(CPACK_COMPONENT_B_GROUP "Runtime")

# Development
set(CPACK_COMPONENT_BASEDEVEL_GROUP "Development")
set(CPACK_COMPONENT_COREDEVEL_GROUP "Development")
set(CPACK_COMPONENT_ADEVEL_GROUP "Development")
set(CPACK_COMPONENT_BDEVEL_GROUP "Development")

