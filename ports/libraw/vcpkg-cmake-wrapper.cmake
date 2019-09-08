_find_package(${ARGS})
find_package(Jasper REQUIRED)
if (Jasper_FOUND)
   list(APPEND LibRaw_LIBRARIES ${JASPER_LIBRARIES})
   list(APPEND LibRaw_r_LIBRARIES ${JASPER_LIBRARIES})
endif ()

IF(LibRaw_FOUND AND NOT TARGET LibRaw::LibRaw)
   add_library(LibRaw::LibRaw INTERFACE IMPORTED)
   set_target_properties(LibRaw::LibRaw PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${LibRaw_INCLUDE_DIR}"
      INTERFACE_LINK_LIBRARIES "${LibRaw_LIBRARIES}"
   )
ENDIF()