# CPack properties for libA

# TODO not visible in root !!!

# components
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} Lib LibDevel)

# name & description
set(CPACK_COMPONENT_LIB_DISPLAY_NAME "Lib")
set(CPACK_COMPONENT_LIBDEVEL_DISPLAY_NAME "Lib Development")

# required
set(CPACK_COMPONENT_LIB_REQUIRED ON)

# dependencies
set(CPACK_COMPONENT_LIBDEVEL_DEPENDS UpstreamADevel Lib)

# groups
# Runtime
set(CPACK_COMPONENT_LIB_GROUP "Runtime")

# Development
set(CPACK_COMPONENT_LIBDEVEL_GROUP "Development")

