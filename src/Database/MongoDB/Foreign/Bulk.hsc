module Database.MongoDB.Foreign.Bulk where
#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import
import Data.Bson.Foreign.Types
import Database.MongoDB.Foreign.WriteConcern

#opaque_t mongoc_bulk_operation_t

#ccall mongoc_bulk_operation_destroy , Ptr <mongoc_bulk_operation_t> -> IO ()

#ccall mongoc_bulk_operation_insert , Ptr <mongoc_bulk_operation_t> -> Ptr <bson_t> -> IO ()

#ccall mongoc_bulk_operation_remove , Ptr <mongoc_bulk_operation_t> -> Ptr <bson_t> -> IO ()

#ccall mongoc_bulk_operation_remove_one , Ptr <mongoc_bulk_operation_t> -> Ptr <bson_t> -> IO ()

#ccall mongoc_bulk_operation_replace_one , Ptr <mongoc_bulk_operation_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Int8 -> IO ()

#ccall mongoc_bulk_operation_update , Ptr <mongoc_bulk_operation_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Int8 -> IO ()

#ccall mongoc_bulk_operation_update_one , Ptr <mongoc_bulk_operation_t> -> Ptr <bson_t> -> Ptr <bson_t> -> Int8 -> IO ()

#ccall mongoc_bulk_operation_new , Int8 -> IO (Ptr <mongoc_bulk_operation_t>)

#ccall mongoc_bulk_operation_set_write_concern , Ptr <mongoc_bulk_operation_t> -> Ptr <mongoc_write_concern_t> -> IO ()

#ccall mongoc_bulk_operation_set_database , Ptr <mongoc_bulk_operation_t> -> CString -> IO ()

#ccall mongoc_bulk_operation_set_collection , Ptr <mongoc_bulk_operation_t> -> CString -> IO ()

#ccall mongoc_bulk_operation_set_client , Ptr <mongoc_bulk_operation_t> -> Ptr () -> IO ()

#ccall mongoc_bulk_operation_set_hint , Ptr <mongoc_bulk_operation_t> -> Word32 -> IO ()
