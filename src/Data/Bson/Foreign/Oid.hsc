module Data.Bson.Foreign.Oid where
import Data.Bson.Foreign.Types

#include <bson.h>
#include <bindings.dsl.h>
#strict_import

#ccall bson_oid_compare , Ptr <bson_oid_t> -> Ptr <bson_oid_t> -> IO CInt

#ccall bson_oid_copy , Ptr <bson_oid_t> -> Ptr <bson_oid_t> -> IO ()

#ccall bson_oid_equal , Ptr <bson_oid_t> -> Ptr <bson_oid_t> -> IO Int8

#ccall bson_oid_is_valid , CString -> CSize -> IO Int8

#ccall bson_oid_get_time_t , Ptr <bson_oid_t> -> IO CTime

#ccall bson_oid_hash , Ptr <bson_oid_t> -> IO Word32

#ccall bson_oid_init , Ptr <bson_oid_t> -> Ptr <bson_context_t> -> IO ()

#ccall bson_oid_init_from_data , Ptr <bson_oid_t> -> Ptr Word8 -> IO ()

#ccall bson_oid_init_from_string , Ptr <bson_oid_t> -> CString -> IO ()

#ccall bson_oid_init_sequence , Ptr <bson_oid_t> -> Ptr <bson_context_t> -> IO ()

#ccall bson_oid_to_string , Ptr <bson_oid_t> -> CString -> IO ()

