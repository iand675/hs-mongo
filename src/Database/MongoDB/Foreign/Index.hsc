module Database.MongoDB.Foreign.Index where

#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import
import Data.Bson.Foreign.Types

#starttype mongoc_index_opt_geo_t
#field twod_sphere_version , Word8
#field twod_bits_precision , Word8
#field twod_location_min , Double
#field twod_location_max , Double
#field haystack_bucket_size , Double
#array_field padding  , Word8
#stoptype

#starttype mongoc_index_opt_storage_t
#field type , CInt
#stoptype

#integral_t mongoc_index_storage_opt_type_t
#num MONGOC_INDEX_STORAGE_OPT_MMAPV1
#num MONGOC_INDEX_STORAGE_OPT_WIREDTIGER

#starttype mongoc_index_opt_wt_t
#field base , <mongoc_index_opt_storage_t>
#field config_str , CString
#array_field padding , Word8
#stoptype

#starttype mongoc_index_opt_t
#field is_initialized , Int8
#field background , Int8
#field unique , Int8
#field name , CString
#field drop_dups , Int8
#field sparse , Int8
#field expire_after_seconds , Int32
#field v , Int32
#field weights , Ptr <bson_t>
#field default_language , CString
#field language_override , CString
#field geo_options , <mongoc_index_opt_geo_t>
#field storage_options , <mongoc_index_opt_storage_t>
#array_field padding , Word8
#stoptype

#ccall mongoc_index_opt_get_default , IO (Ptr <mongoc_index_opt_t>)
#ccall mongoc_index_opt_geo_get_default , IO (Ptr <mongoc_index_opt_geo_t>)
#ccall mongoc_index_opt_wt_get_default , IO (Ptr <mongoc_index_opt_wt_t>)
#ccall mongoc_index_opt_init , Ptr <mongoc_index_opt_t> -> IO ()
#ccall mongoc_index_opt_geo_init , Ptr <mongoc_index_opt_geo_t> -> IO ()
#ccall mongoc_index_opt_wt_init , Ptr <mongoc_index_opt_wt_t> -> IO ()


