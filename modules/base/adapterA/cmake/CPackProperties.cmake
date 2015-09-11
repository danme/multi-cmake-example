# CPack properties

# coponents
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} A ADevel PARENT_SCOPE)

# names & descriptions
set(CPACK_COMPONENT_A_DISPLAY_NAME "Core Adapter A" PARENT_SCOPE)
set(CPACK_COMPONENT_A_DESCRIPTION "Adpater for the Base core library conforming to the A interface." PARENT_SCOPE)

# requireds

# dependencies
set(CPACK_COMPONENT_A_DEPENDS Core PARENT_SCOPE)
set(CPACK_COMPONENT_ADEVEL_DEPENDS CoreDevel A PARENT_SCOPE)

# groups
# Runtime
set(CPACK_COMPONENT_A_GROUP "Runtime" PARENT_SCOPE)

# Development
set(CPACK_COMPONENT_ADEVEL_GROUP "Development" PARENT_SCOPE)

