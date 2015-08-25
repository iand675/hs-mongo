module Database.MongoDB.Foreign.Cursor where
#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import
import Data.Bson.Foreign.Types
import Database.MongoDB.Foreign.HostList
#opaque_t mongoc_cursor_t

#ccall mongoc_cursor_clone , Ptr <mongoc_cursor_t> -> IO (Ptr <mongoc_cursor_t>)
#ccall mongoc_cursor_destroy , Ptr <mongoc_cursor_t> -> IO ()
#ccall mongoc_cursor_more , Ptr <mongoc_cursor_t> -> IO Int8
#ccall mongoc_cursor_next , Ptr <mongoc_cursor_t> -> Ptr (Ptr <bson_t>) -> IO Int8
#ccall mongoc_cursor_error , Ptr <mongoc_cursor_t> -> Ptr <bson_error_t> -> IO Int8
#ccall mongoc_cursor_get_host , Ptr <mongoc_cursor_t> -> Ptr <mongoc_host_list_t> -> IO ()
#ccall mongoc_cursor_is_alive , Ptr <mongoc_cursor_t> -> IO Int8
#ccall mongoc_cursor_current , Ptr <mongoc_cursor_t> -> IO (Ptr <bson_t>)
#ccall mongoc_cursor_set_batch_size , Ptr <mongoc_cursor_t> -> Word32 -> IO ()
#ccall mongoc_cursor_get_batch_size , Ptr <mongoc_cursor_t> -> IO Word32
#ccall mongoc_cursor_get_hint , Ptr <mongoc_cursor_t> -> IO Word32
#ccall mongoc_cursor_get_id , Ptr <mongoc_cursor_t> -> IO Int64
