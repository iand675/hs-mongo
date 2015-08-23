module Data.Bson.Foreign.Version where
import Foreign
import Foreign.C
#include <bson.h>
#include <bindings.dsl.h> 

#num BSON_MAJOR_VERSION
#num BSON_MINOR_VERSION
#num BSON_MICRO_VERSION

-- #globalarray MONGOC_VERSION_S , CChar

#num BSON_VERSION_HEX

