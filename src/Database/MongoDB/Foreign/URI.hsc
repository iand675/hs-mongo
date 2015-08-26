module Database.MongoDB.Foreign.URI where
#include <mongoc.h>
#include <bindings.dsl.h> 
#strict_import
import Data.Bson.Foreign.Types
import Database.MongoDB.Foreign.HostList
import Database.MongoDB.Foreign.WriteConcern


#opaque_t mongoc_uri_t

#ccall mongoc_uri_copy , Ptr <mongoc_uri_t> -> IO (Ptr <mongoc_uri_t>)

#ccall mongoc_uri_destroy , Ptr <mongoc_uri_t> -> IO ()

#ccall mongoc_uri_new , CString -> IO (Ptr <mongoc_uri_t>)

#ccall mongoc_uri_new_for_host_port , CString -> Word16 -> IO (Ptr <mongoc_uri_t>)

#ccall mongoc_uri_get_hosts , Ptr <mongoc_uri_t> -> IO (Ptr <mongoc_host_list_t>)

#ccall mongoc_uri_get_database , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_options , Ptr <mongoc_uri_t> -> IO (Ptr <bson_t>)

#ccall mongoc_uri_get_password , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_read_prefs , Ptr <mongoc_uri_t> -> IO (Ptr <bson_t>)

#ccall mongoc_uri_get_replica_set , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_string , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_username , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_credentials , Ptr <mongoc_uri_t> -> IO (Ptr <bson_t>)

#ccall mongoc_uri_get_auth_source , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_auth_mechanism , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_mechanism_properties , Ptr <mongoc_uri_t> -> Ptr <bson_t> -> IO Int8

#ccall mongoc_uri_get_ssl , Ptr <mongoc_uri_t> -> IO Int8

#ccall mongoc_uri_unescape , Ptr <mongoc_uri_t> -> IO CString

#ccall mongoc_uri_get_write_concern , Ptr <mongoc_uri_t> -> IO (Ptr <mongoc_write_concern_t>)


