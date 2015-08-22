module Database.MongoDB.Foreign.Version where
import Foreign
import Foreign.C
#include <mongoc.h>
#include <bindings.dsl.h> 


#num MONGOC_MAJOR_VERSION
#num MONGOC_MINOR_VERSION
#num MONGOC_MICRO_VERSION

-- #globalarray MONGOC_VERSION_S , CChar

#num MONGOC_VERSION_HEX

-- #cinline MONGOC_CHECK_VERSION , Word8 -> Word8 -> Word8 -> Word32
