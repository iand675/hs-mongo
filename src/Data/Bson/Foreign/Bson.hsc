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

#ccall bson_append_value
