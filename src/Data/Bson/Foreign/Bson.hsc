#include <bson.h>
#include <bindings.dsl.h>
module Data.Bson.Foreign.Bson where
#strict_import
import Data.Bson.Foreign.Types

-- bson_empty
-- bson_empty0
-- bson_clear

#num BSON_MAX_SIZE

#ccall bson_new , IO (Ptr <bson_t>)

#ccall bson_new_from_json , Ptr Word8 -> SSize -> Ptr <bson_error_t> -> IO (Ptr <bson_t>)

#ccall bson_init_from_json , Ptr <bson_t> -> CString -> SSize -> Ptr <bson_error_t> -> IO Int8

#ccall bson_init_static , Ptr <bson_t> -> Ptr Word8 -> CSize -> IO Int8

#ccall bson_init , Ptr <bson_t> -> IO ()

#ccall bson_reinit , Ptr <bson_t> -> IO ()

#ccall bson_new_from_data , Ptr Word8 -> CSize -> IO (Ptr <bson_t>)

#ccall bson_new_from_buffer , Ptr (Ptr Word8) -> Ptr CSize -> <bson_realloc_func> -> Ptr () -> IO (Ptr <bson_t>)

#ccall bson_sized_new , CSize -> IO (Ptr <bson_t>)

#ccall bson_copy , Ptr <bson_t> -> IO (Ptr <bson_t>)

#ccall bson_copy_to , Ptr <bson_t> -> Ptr <bson_t> -> IO ()

-- #ccall bson_copy_to_excluding_noinit

#ccall bson_destroy , Ptr <bson_t> -> IO ()

#ccall bson_destroy_with_steal , Ptr <bson_t> -> Int8 -> Ptr Word32 -> IO (Ptr Word8)

#ccall bson_get_data , Ptr <bson_t> -> IO (Ptr Word8)

#ccall bson_count_keys , Ptr <bson_t> -> IO Word32

#ccall bson_has_field , Ptr <bson_t> -> CString -> IO Int8

#ccall bson_compare , Ptr <bson_t> -> Ptr <bson_t> -> IO CInt

#ccall bson_equal , Ptr <bson_t> -> Ptr <bson_t> -> IO Int8

#ccall bson_validate , Ptr <bson_t> -> <bson_validate_flags_t> -> Ptr CSize -> IO Int8

#ccall bson_as_json , Ptr <bson_t> -> Ptr CSize -> IO CString

#ccall bson_array_as_json , Ptr <bson_t> -> Ptr CSize -> IO CString

#ccall bson_append_value , Ptr <bson_t> -> CString -> CInt -> Ptr <bson_value_t> -> IO Int8

#ccall bson_append_array , Ptr <bson_t> -> CString -> CInt -> Ptr <bson_t> -> IO Int8

#ccall bson_append_binary , Ptr <bson_t> -> CString -> CInt -> <bson_subtype_t> -> Ptr Word8 -> Word32 -> IO Int8

#ccall bson_append_bool , Ptr <bson_t> -> CString -> CInt -> Int8 -> IO Int8

#ccall bson_append_code , Ptr <bson_t> -> CString -> CInt -> CString -> IO Int8

#ccall bson_append_code_with_scope , Ptr <bson_t> -> CString -> CInt -> CString -> Ptr <bson_t> -> IO Int8

#ccall bson_append_dbpointer , Ptr <bson_t> -> CString -> CInt -> CString -> Ptr <bson_oid_t> -> IO Int8

#ccall bson_append_double , Ptr <bson_t> -> CString -> CInt -> Double -> IO Int8

#ccall bson_append_document , Ptr <bson_t> -> CString -> CInt -> Ptr <bson_t> -> IO Int8

#ccall bson_append_document_begin , Ptr <bson_t> -> CString -> CInt -> Ptr <bson_t> -> IO Int8

#ccall bson_append_document_end , Ptr <bson_t> -> Ptr <bson_t> -> IO Int8

#ccall bson_append_array_begin , Ptr <bson_t> -> CString -> CInt -> Ptr <bson_t> -> IO Int8

#ccall bson_append_array_end , Ptr <bson_t> -> Ptr <bson_t> -> IO Int8

#ccall bson_append_int32 , Ptr <bson_t> -> CString -> CInt -> Int32 -> IO Int8

#ccall bson_append_int64 , Ptr <bson_t> -> CString -> CInt -> Int64 -> IO Int8

#ccall bson_append_iter , Ptr <bson_t> -> CString -> CInt -> Ptr <bson_iter_t> -> IO Int8

#ccall bson_append_minkey , Ptr <bson_t> -> CString -> CInt -> IO Int8

#ccall bson_append_maxkey , Ptr <bson_t> -> CString -> CInt -> IO Int8

#ccall bson_append_null , Ptr <bson_t> -> CString -> CInt -> IO Int8

#ccall bson_append_oid , Ptr <bson_t> -> CString -> CInt -> Ptr <bson_oid_t> -> IO Int8

#ccall bson_append_regex , Ptr <bson_t> -> CString -> CInt -> CString -> CString -> IO Int8

#ccall bson_append_utf8 , Ptr <bson_t> -> CString -> CInt -> CString -> CInt -> IO Int8

#ccall bson_append_symbol , Ptr <bson_t> -> CString -> CInt -> CString -> CInt -> IO Int8

#ccall bson_append_time_t , Ptr <bson_t> -> CString -> CInt -> CTime -> IO Int8

-- #ccall bson_append_timeval ,

#ccall bson_append_date_time , Ptr <bson_t> -> CString -> CInt -> Int64 -> IO Int8

#ccall bson_append_now_utc , Ptr <bson_t> -> CString -> CInt -> IO Int8

#ccall bson_append_timestamp , Ptr <bson_t> -> CString -> CInt -> Word32 -> Word32 -> IO Int8

#ccall bson_append_undefined , Ptr <bson_t> -> CString -> CInt -> IO Int8

#ccall bson_concat , Ptr <bson_t> -> Ptr <bson_t> -> IO Int8
