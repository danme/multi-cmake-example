# CMakeLists.txt Coding Style

## CMake
From CMake docs: [link](http://www.cmake.org/cmake/help/git-master/manual/cmake-packages.7.html#creating-packages)

### Example

#### Creating Packages
CMakeLists.txt:

	project(UpstreamLib)
	
	set(CMAKE_INCLUDE_CURRENT_DIR ON)
	set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)
	
	set(Upstream_VERSION 3.4.1)
	
	include(GenerateExportHeader)
	
	add_library(ClimbingStats SHARED climbingstats.cpp)
	generate_export_header(ClimbingStats)
	set_property(TARGET ClimbingStats PROPERTY VERSION ${Upstream_VERSION})
	set_property(TARGET ClimbingStats PROPERTY SOVERSION 3)
	set_property(TARGET ClimbingStats PROPERTY
	  INTERFACE_ClimbingStats_MAJOR_VERSION 3)
	set_property(TARGET ClimbingStats APPEND PROPERTY
	  COMPATIBLE_INTERFACE_STRING ClimbingStats_MAJOR_VERSION
	)
	
	find_package(Stats 2.6.4 REQUIRED)
    target_link_libraries(ClimbingStats PUBLIC Stats::Types)
	
	install(TARGETS ClimbingStats EXPORT ClimbingStatsTargets
	  LIBRARY DESTINATION lib
	  ARCHIVE DESTINATION lib
	  RUNTIME DESTINATION bin
	  INCLUDES DESTINATION include
	)
	install(
	  FILES
	    climbingstats.h
	    "${CMAKE_CURRENT_BINARY_DIR}/climbingstats_export.h"
	  DESTINATION
	    include
	  COMPONENT
	    Devel
	)
	
	include(CMakePackageConfigHelpers)
	write_basic_package_version_file(
	  "${CMAKE_CURRENT_BINARY_DIR}/ClimbingStats/ClimbingStatsConfigVersion.cmake"
	  VERSION ${Upstream_VERSION}
	  COMPATIBILITY AnyNewerVersion
	)
	
	export(EXPORT ClimbingStatsTargets
	  FILE "${CMAKE_CURRENT_BINARY_DIR}/ClimbingStats/ClimbingStatsTargets.cmake"
	  NAMESPACE Upstream::
	)
	configure_file(cmake/ClimbingStatsConfig.cmake
	  "${CMAKE_CURRENT_BINARY_DIR}/ClimbingStats/ClimbingStatsConfig.cmake"
	  COPYONLY
	)
	
	set(ConfigPackageLocation lib/cmake/ClimbingStats)
	install(EXPORT ClimbingStatsTargets
	  FILE
	    ClimbingStatsTargets.cmake
	  NAMESPACE
	    Upstream::
	  DESTINATION
	    ${ConfigPackageLocation}
	)
	install(
	  FILES
	    cmake/ClimbingStatsConfig.cmake
	    "${CMAKE_CURRENT_BINARY_DIR}/ClimbingStats/ClimbingStatsConfigVersion.cmake"
	  DESTINATION
	    ${ConfigPackageLocation}
	  COMPONENT
	    Devel
	)

#### Create a Package Configuration File
ClimbingStatsConfig.cmake:

    include(CMakeFindDependencyMacro)
	find_dependency(Stats 2.6.4)
	
	include("${CMAKE_CURRENT_LIST_DIR}/ClimbingStatsTargets.cmake")
	include("${CMAKE_CURRENT_LIST_DIR}/ClimbingStatsMacros.cmake")



## Daniel Pfeifer
From best practices slides: [link](http://de.slideshare.net/DanielPfeifer1/cmake-48475415)

### Dos / Don'ts
* DON'T make assumptions about the platform or compiler.
* DO script with cmake commands itself (multi-platform):
    
        cmake --build build-dir \
              --target mylibrary \
              --config Release \
              --clean-first
* DON'T assume that your project root is the build root.
* DON'T modify global compile/link flags.
* DON'T make any global changes!
* DO add namespaced aliases for libraries
* DON'T make libraries STATIC/SHARED unless they cannot be built otherwise.  
  Leave the control of BUILD_SHARED_LIBS to your clients.
* DO preffer to link against namespaced targets.
* DO specify the dependencies as private or public
* DON'T use global commands like  
  *link_libraries()*, *include_directories()* or *add_definitions()*
* DO use per target commands like  
  *target\_link_libraries()*, *target\_include_directories()* or *target\_compile_definitions()*
* DO wrap compiler specific options in appropriate condition.
* DON'T set --std=c++11 as an option use *target\_comile_features()* instead.
* DON'T use custom variables: hard to diagnose. Prefer per target commands.
* DON'T use file(GLOB)!
* DON'T use custom functions (Maintenance).
* 

## KDE
From KDE: [link](https://techbase.kde.org/Policies/CMake_Coding_Style)

### General
To put in in one sentence: be as careful when writing the CMake files as when you are writing C++ code.

### Indentation
Indent all code correctly, i.e. the body of

* if/else/endif
* foreach/endforeach
* while/endwhile
* macro/endmacro
* function/endfunction

Use spaces for indenting, 2, 3 or 4 spaces preferably. Use the same amount of spaces for indenting as is used in the rest of the file. Do not use tabs.

### Upper/lower casing
Most important: use consistent upper- or lowercasing within one file !

The all-lowercase style is preferred.

    add_executable(foo foo.c)

### End commands
To make the code easier to read, use empty commands for endforeach(), endif(), endfunction(), endmacro() and endwhile(). Also, use empty else() commands.

For example, do this:

    if(FOOVAR)
      some_command(...)
    else()
      another_command(...)
    endif()
    
and not this:

    if(BARVAR)
      some_other_command(...)
    endif(BARVAR)

### Writing CMake Find-modules
#### (Not) Using pkg-config
You are free to use pkg-config in FindXXX.cmake modules, as long as the following conditions are met:

* the FindXXX.cmake must also work without pkg-config, as long as the package is either installed to one of the default locations (as /usr or /usr/local) or if CMAKE_PREFIX_PATH is set accordingly
* use only find_package(PkgConfig), don't use include(UsePkgConfig), this one is deprecated
* make sure the variables created by pkg_check_modules() are all prefixed with "PC_", so they don't mix up with other variables, e.g. set via find_path() etc.
* FindLibXml2.cmake as shipped with CMake 2.8.5 is a good example how pkg-config should be handled
* putting something like if(NOT WIN32) around the pkg-config stuff is not necessary (and should be removed if it is somewhere). If pkg-config is not found, e.g. on Windows, the macros simply do nothing.

#### Follow CMake's readme.txt
Follow the style guide from CMake when writing some FindFoo.cmake module: readme.txt

#### Use FindPackageHandleStandardArgs.cmake
For checking the results inside the Find-module, the macro find_package_handle_standard_args() (coming with CMake) should be used, using the new extended syntax, which supports also version checking.

#### Avoid Micro-Optimizations
Micro-optimizations like

    if(FOO_LIBRARY AND FOO_INCLUDE_DIR)
      set(FOO_FOUND TRUE)
    else()
      ... execute the whole find-logic
    endif()

should be removed, the find-logic should be executed always. These shortcuts can cause problems e.g. when the same file is used from multiple directories but e.g. with different required versions or components etc.

Also manually quieting the module should not be done:

    if ( SQLITE_INCLUDE_DIR AND SQLITE_LIBRARIES )
      set(Sqlite_FIND_QUIETLY TRUE)
    endif ()

If find_package_handle_standard_args() is used, this is completely unnecessary, since find_package_handle_standard_args() only prints something if the result has changed compared to the previous run. So if, as in this example, sqlite has already been found, find_package_handle_standard_args() will only print this information during the first CMake run, but not on successive runs.

So, do not add such code. It is unnecessary and makes the modules look more complicated than necessary.

### Writing FooConfig.cmake files
* See http://quickgit.kde.org/?p=kdeexamples.git&a=tree&hb=HEAD&f=buildsystem/HowToInstallALibrary for a fully commented example
* See also:  
  http://www.cmake.org/Wiki/CMake/Tutorials/Exporting_and_Importing_Targets
  http://www.cmake.org/Wiki/CMake/Tutorials/How_to_create_a_ProjectConfig.cmake_file
  http://www.cmake.org/Wiki/CMake/Tutorials/Packaging