module Database.MongoDB.Foreign.Database where

import Data.Int
import Data.Word
import Foreign
import Foreign.C

import Data.Bson.Foreign.Types
import Database.MongoDB.Foreign.Collection
import Database.MongoDB.Foreign.Cursor
import Database.MongoDB.Foreign.Flags
import Database.MongoDB.Foreign.ReadPrefs
import Database.MongoDB.Foreign.WriteConcern

#include <mongoc.h>
#include <bindings.dsl.h> 

#opaque_t mongoc_database_t

#ccall mongoc_database_get_name , Ptr <mongoc_database_t> -> IO CString

#ccall mongoc_database_remove_user , Ptr <mongoc_database_t> -> CString -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_database_remove_all_users , Ptr <mongoc_database_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_database_add_user , Ptr <mongoc_database_t> -> CString -> CString -> Ptr <bson_t> -> Ptr <bson_t> -> IO Int8

#ccall mongoc_database_destroy , Ptr <mongoc_database_t> -> IO ()

#ccall mongoc_database_command , Ptr <mongoc_database_t> -> <mongoc_query_flags_t> -> Word32 -> Word32 -> Word32 -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> IO (Ptr <mongoc_cursor_t>)

#ccall mongoc_database_command_simple , Ptr <mongoc_database_t> -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_database_drop , Ptr <mongoc_database_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_database_has_collection , Ptr <mongoc_database_t> -> CString -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_database_create_collection , Ptr <mongoc_database_t> -> CString -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO (Ptr <mongoc_collection_t>)

#ccall mongoc_database_get_read_prefs , Ptr <mongoc_database_t> -> IO (Ptr <mongoc_read_prefs_t>)

#ccall mongoc_database_set_read_prefs , Ptr <mongoc_database_t> -> Ptr <mongoc_read_prefs_t> -> IO ()

#ccall mongoc_database_get_write_concern , Ptr <mongoc_database_t> -> IO (Ptr <mongoc_write_concern_t>)

#ccall mongoc_database_set_write_concern , Ptr <mongoc_database_t> -> Ptr <mongoc_write_concern_t> -> IO ()

#ccall mongoc_database_find_collections , Ptr <mongoc_database_t> -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO (Ptr <mongoc_cursor_t>)

#ccall mongoc_database_get_collection_names , Ptr <mongoc_database_t> -> Ptr <bson_error_t> -> IO (Ptr CString)

#ccall mongoc_database_get_collection , Ptr <mongoc_database_t> -> CString -> IO (Ptr <mongoc_collection_t>)

