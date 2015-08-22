module Database.MongoDB.Foreign.Client where
import Foreign
import Foreign.C

import Database.MongoDB.Foreign.URI

#include <mongoc.h>
#include <bindings.dsl.h> 

#opaque_t mongoc_client_t

#ccall mongoc_client_new , CString -> IO (Ptr <mongoc_client_t>)

#ccall mongoc_client_new_from_uri , Ptr <mongoc_uri_t> -> IO (Ptr <mongoc_client_t>)

-- mongoc_client_set_stream_initiator


