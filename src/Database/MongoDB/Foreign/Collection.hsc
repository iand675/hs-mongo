module Database.MongoDB.Foreign.Collection where

import Data.Int
import Data.Word
import Foreign
import Foreign.C

import Data.Bson.Foreign.Types
import Database.MongoDB.Foreign.Bulk
import Database.MongoDB.Foreign.Cursor
import Database.MongoDB.Foreign.Flags
import Database.MongoDB.Foreign.Index
import Database.MongoDB.Foreign.ReadPrefs
import Database.MongoDB.Foreign.WriteConcern

#include <mongoc.h>
#include <bindings.dsl.h> 

#opaque_t mongoc_collection_t


#ccall mongoc_collection_aggregate , Ptr <mongoc_collection_t> -> <mongoc_query_flags_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> IO (Ptr <mongoc_cursor_t)

#ccall mongoc_collection_destroy , Ptr <mongoc_collection_t> -> IO ()

#ccall mongoc_collection_command , Ptr <mongoc_collection_t> -> <mongoc_query_flags_t> -> Word32  -> Word32 -> Word32 -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> IO (Ptr <mongoc_cursor_t>)


#ccall mongoc_collection_command_simple , Ptr <mongoc_collection_t> -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> Ptr <bson_t> -> Ptr <bson_error_t>  -> IO Int8

#ccall mongoc_collection_count , Ptr <mongoc_collection_t> -> <mongoc_query_flags_t> -> Ptr <bson_t> -> Int64 -> Int64 -> Ptr <mongoc_read_prefs_t> -> Ptr <bson_error_t> -> IO Int64

#ccall mongoc_collection_count_with_opts , Ptr <mongoc_collection_t> -> <mongoc_query_flags_t> -> Ptr <bson_t> -> Int64 -> Int64 -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> Ptr <bson_error_t> -> IO Int64

#ccall mongoc_collection_drop , Ptr <mongoc_collection_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_drop_index , Ptr <mongoc_collection_t> -> CString -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_create_index , Ptr <mongoc_collection_t> -> Ptr <bson_t> -> Ptr <mongoc_index_opt_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_find_indexes , Ptr <mongoc_collection_t> -> Ptr <bson_error_t> -> IO (Ptr <mongoc_cursor_t>)

#ccall mongoc_collection_find , Ptr <mongoc_collection_t> -> <mongoc_query_flags_t> -> Word32 -> Word32 -> Word32 -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> IO (Ptr <mongoc_cursor_t>)

#ccall mongoc_collection_insert , Ptr <mongoc_collection_t> -> <mongoc_insert_flags_t> -> Ptr <bson_t> -> Ptr <mongoc_write_concern_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_update , Ptr <mongoc_collection_t> -> <mongoc_update_flags_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <mongoc_write_concern_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_save , Ptr <mongoc_collection_t> -> Ptr <bson_t> -> Ptr <mongoc_write_concern_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_remove , Ptr <mongoc_collection_t> -> <mongoc_remove_flags_t> -> Ptr <bson_t> -> Ptr <mongoc_write_concern_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_rename , Ptr <mongoc_collection_t> -> CString -> CString -> Int8 -> IO Int8

#ccall mongoc_collection_find_and_modify , Ptr <mongoc_collection_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Int8 -> Int8 -> Int8 -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_stats , Ptr <mongoc_collection_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_collection_create_bulk_operation , Ptr <mongoc_collection_t> -> Int8 -> Ptr <mongoc_write_concern_t> -> IO (Ptr <mongoc_bulk_operation_t>)

#ccall mongoc_collection_get_read_prefs , Ptr <mongoc_collection_t> -> IO (Ptr <mongoc_read_prefs_t>)

#ccall mongoc_collection_set_read_prefs , Ptr <mongoc_collection_t> -> Ptr <mongoc_read_prefs_t> -> IO ()

#ccall mongoc_collection_get_write_concern , Ptr <mongoc_collection_t> -> IO (Ptr <mongoc_write_concern_t>)

#ccall mongoc_collection_set_write_concern , Ptr <mongoc_collection_t> -> Ptr <mongoc_write_concern_t> -> IO ()

#ccall mongoc_collection_get_name , Ptr <mongoc_collection_t> -> Ptr <mongoc_write_concern_t> -> IO CString

#ccall mongoc_collection_get_last_error , Ptr <mongoc_collection_t> -> IO (Ptr <bson_t>)

#ccall mongoc_collection_keys_to_index_string , Ptr <mongoc_collection_t> -> Ptr <bson_t> -> IO CString

#ccall mongoc_collection_validate , Ptr <mongoc_collection_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO Int8



