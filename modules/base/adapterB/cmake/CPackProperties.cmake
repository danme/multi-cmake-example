# CPack properties

# coponents
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} B BDevel PARENT_SCOPE)

# names & descriptions
set(CPACK_COMPONENT_B_DISPLAY_NAME "Core Adapter B" PARENT_SCOPE)
set(CPACK_COMPONENT_B_DESCRIPTION "Adpater for the Base core library conforming to the B interface." PARENT_SCOPE)

# requireds

# dependencies
set(CPACK_COMPONENT_B_DEPENDS Core PARENT_SCOPE)
set(CPACK_COMPONENT_BDEVEL_DEPENDS CoreDevel B PARENT_SCOPE)

# groups
# Runtime
set(CPACK_COMPONENT_B_GROUP "Runtime" PARENT_SCOPE)

# Development
set(CPACK_COMPONENT_BDEVEL_GROUP "Development" PARENT_SCOPE)

