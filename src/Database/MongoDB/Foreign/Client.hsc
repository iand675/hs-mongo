module Database.MongoDB.Foreign.Client where
#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import
import Data.Bson.Foreign.Types
import Database.MongoDB.Foreign.Collection
import Database.MongoDB.Foreign.Cursor
import Database.MongoDB.Foreign.Database
import Database.MongoDB.Foreign.Flags
import Database.MongoDB.Foreign.GridFS
import Database.MongoDB.Foreign.ReadPrefs
import Database.MongoDB.Foreign.SSL
import Database.MongoDB.Foreign.URI
import Database.MongoDB.Foreign.WriteConcern

#opaque_t mongoc_client_t

#ccall mongoc_client_new , CString -> IO (Ptr <mongoc_client_t>)

#ccall mongoc_client_new_from_uri , Ptr <mongoc_uri_t> -> IO (Ptr <mongoc_client_t>)

-- mongoc_client_set_stream_initiator

#ccall mongoc_client_command , Ptr <mongoc_uri_t> -> <mongoc_query_flags_t> -> CString -> Word32 -> Word32 -> Word32 -> Ptr <bson_t> -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> IO (Ptr <mongoc_cursor_t>)

#ccall mongoc_client_kill_cursor , Ptr <mongoc_client_t> -> Word64 -> IO ()

#ccall mongoc_client_command_simple , Ptr <mongoc_client_t> -> CString -> Ptr <bson_t> -> Ptr <mongoc_read_prefs_t> -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_client_destroy , Ptr <mongoc_client_t> -> IO ()

#ccall mongoc_client_get_database , Ptr <mongoc_client_t> -> CString -> IO (Ptr <mongoc_database_t>)

#ccall mongoc_client_get_gridfs , Ptr <mongoc_client_t> -> CString -> CString -> Ptr <bson_error_t> -> IO (Ptr <mongoc_gridfs_t>)

#ccall mongoc_client_get_collection , Ptr <mongoc_client_t> -> CString -> CString -> Ptr <mongoc_collection_t>

#ccall mongoc_client_get_database_names , Ptr <mongoc_client_t> -> Ptr <bson_error_t> -> IO (Ptr CString)

#ccall mongoc_client_find_databases , Ptr <mongoc_client_t> -> Ptr <bson_error_t> -> IO (Ptr <mongoc_cursor_t>)

#ccall mongoc_client_get_server_status , Ptr <mongoc_client_t> -> Ptr <mongoc_read_prefs_t> -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO Int8

#ccall mongoc_client_get_max_message_size , Ptr <mongoc_client_t> -> IO Int32

#ccall mongoc_client_get_max_bson_size , Ptr <mongoc_client_t> -> IO Int32

#ccall mongoc_client_get_write_concern , Ptr <mongoc_client_t> -> IO (Ptr <mongoc_write_concern_t>)

#ccall mongoc_client_set_write_concern , Ptr <mongoc_client_t> -> Ptr <mongoc_write_concern_t> -> IO ()

#ccall mongoc_client_get_read_prefs , Ptr <mongoc_client_t> -> IO (Ptr <mongoc_read_prefs_t>)

#ccall mongoc_client_set_read_prefs , Ptr <mongoc_client_t> -> Ptr <mongoc_read_prefs_t> -> IO ()

#ccall mongoc_client_set_ssl_opts , Ptr <mongoc_client_t> -> Ptr <mongoc_ssl_opt_t> -> IO ()

