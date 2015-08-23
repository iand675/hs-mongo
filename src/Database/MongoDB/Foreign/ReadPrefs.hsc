module Database.MongoDB.Foreign.ReadPrefs where
import Foreign
import Foreign.C

import Data.Bson.Foreign.Types
import Database.MongoDB.Foreign.URI

#include <mongoc.h>
#include <bindings.dsl.h> 

#opaque_t mongoc_read_prefs_t

#num MONGOC_READ_PRIMARY
#num MONGOC_READ_SECONDARY
#num MONGOC_READ_PRIMARY_PREFERRED
#num MONGOC_READ_SECONDARY_PREFERRED
#num MONGOC_READ_NEAREST

#ccall mongoc_read_prefs_new , CSize -> IO (Ptr <mongoc_read_prefs_t>)

#ccall mongoc_read_prefs_copy , Ptr <mongoc_read_prefs_t> -> IO (Ptr <mongoc_read_prefs_t>)

#ccall mongoc_read_prefs_destroy , Ptr <mongoc_read_prefs_t> -> IO ()

#ccall mongoc_read_prefs_get_mode , Ptr <mongoc_read_prefs_t> -> IO CSize

#ccall mongoc_read_prefs_set_mode , Ptr <mongoc_read_prefs_t> -> CSize -> IO ()

#ccall mongoc_read_prefs_get_tags , Ptr <mongoc_read_prefs_t> -> IO (Ptr <bson_t>)

#ccall mongoc_read_prefs_set_tags , Ptr <mongoc_read_prefs_t> -> Ptr <bson_t> -> IO ()

#ccall mongoc_read_prefs_add_tag , Ptr <mongoc_read_prefs_t> -> Ptr <bson_t> -> IO ()

#ccall mongoc_read_prefs_is_valid , Ptr <mongoc_read_prefs_t> -> IO Int8

