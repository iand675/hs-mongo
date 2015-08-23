#include <bson.h>
#include <bindings.dsl.h>
module Data.Bson.Foreign.Error where
#strict_import
import Data.Bson.Foreign.Types

#ccall bson_iter_value , Ptr <bson_iter_t> -> IO (Ptr <bson_iter_value>)

-- #ccall bson_iter_utf8_len_unsafe

#ccall bson_iter_array , Ptr <bson_iter_t> -> Ptr Word32 -> Ptr (Ptr Word8) -> IO ()

#ccall bson_iter_binary , Ptr <bson_iter_t> -> Ptr <bson_subtype_t> -> Word32 -> Ptr (Ptr Word8) -> IO ()

#ccall bson_iter_code , Ptr <bson_iter_t> -> Ptr Word32 -> IO CString

-- #ccall bson_iter_code_unsafe

#ccall bson_iter_codewscope , Ptr <bson_iter_t> -> Ptr Word32 -> Ptr Word32 -> Ptr (Ptr Word32) -> IO CString

#ccall bson_iter_dbpointer , Ptr <bson_iter_t> -> Ptr Word32 -> Ptr (CString) -> Ptr (Ptr <bson_oid_t>) -> IO ()

#ccall bson_iter_document , Ptr <bson_iter_t> -> Ptr Word32 -> Ptr (Ptr Word8) -> IO ()

#ccall bson_iter_double , Ptr <bson_iter_t> -> IO Double

-- #ccall bson_iter_double_unsafe

#ccall bson_iter_init , Ptr <bson_iter_t> -> Ptr <bson_t> -> IO Int8

#ccall bson_iter_init_find , Ptr <bson_iter_t> -> Ptr <bson_t> -> CString -> IO Int8

#ccall bson_iter_init_find_case , Ptr <bson_iter_t> -> Ptr <bson_t> -> CString -> IO Int8

#ccall bson_iter_int32 , Ptr <bson_iter_t> -> IO Int32

-- #ccall bson_iter_int32_unsafe

#ccall bson_iter_int64 , Ptr <bson_iter_t> -> IO Int64

#ccall bson_iter_as_int64 , Ptr <bson_iter_t> -> IO Int64

-- #ccall bson_iter_int64_unsafe

#ccall bson_iter_find , Ptr <bson_iter_t> -> CString -> IO Int8

#ccall bson_iter_find_case , Ptr <bson_iter_t> -> CString -> IO Int8

#ccall bson_iter_find_descendant , Ptr <bson_iter_t> -> CString -> Ptr <bson_iter_t> -> IO Int8

#ccall bson_iter_next , Ptr <bson_iter_t> -> IO Int8

#ccall bson_iter_oid , Ptr <bson_iter_t> -> IO (Ptr <bson_oid_t>)

-- #ccall bson_iter_oid_unsafe

#ccall bson_iter_key , Ptr <bson_iter_t> -> IO CString

-- #ccall bson_iter_key_unsafe

#ccall bson_iter_utf8 , Ptr <bson_iter_t> -> Ptr Word32 -> Ptr CString

-- #ccall bson_iter_utf8_unsafe

#ccall bson_iter_dup_utf8 , Ptr <bson_iter_t> -> Ptr Word32 -> Ptr CString

#ccall bson_iter_date_time , Ptr <bson_iter_t> -> IO Int64

#ccall bson_iter_time_t , Ptr <bson_iter_t> -> IO CTime

-- #ccall bson_iter_time_t_unsafe

-- #ccall bson_iter_timeval
-- #ccall bson_iter_timeval_unsafe

#ccall bson_iter_timestamp , Ptr <bson_iter_t> -> Ptr Word32 -> Ptr Word32 -> IO ()

#ccall bson_iter_bool , Ptr <bson_iter_t> -> IO Int8

-- #ccall bson_iter_bool_unsafe

#ccall bson_iter_as_bool , Ptr <bson_iter_t> -> IO Int8

#ccall bson_iter_regex , Ptr <bson_iter_t> -> Ptr CString -> IO CString

#ccall bson_iter_symbol , Ptr <bson_iter_t> -> Ptr Word32 -> IO CString

#ccall bson_iter_type , Ptr <bson_iter_t> -> IO <bson_type_t>

-- #ccall bson_iter_type_unsafe

#ccall bson_iter_recurse , Ptr <bson_iter_t> -> Ptr <bson_iter_t> -> IO Int8

#ccall bson_iter_overwrite_int32 , Ptr <bson_iter_t> -> Int32 -> IO ()

#ccall bson_iter_overwrite_int64 , Ptr <bson_iter_t> -> Int64 -> IO ()

#ccall bson_iter_overwrite_double , Ptr <bson_iter_t> -> Double -> IO ()

#ccall bson_iter_overwrite_bool -> Ptr <bson_iter_t> -> Int8 -> IO ()

#ccall bson_iter_visit_all -> Ptr <bson_iter_t> -> Ptr <bson_visitor_t> -> Ptr () -> IO Int8

