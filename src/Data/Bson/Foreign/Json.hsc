#include <bson.h>
#include <bindings.dsl.h>
module Data.Bson.Foreign.Json where
#strict_import
import Data.Bson.Foreign.Types

#opaque_t bson_json_reader_t

#integral_t bson_json_error_code_t
#num BSON_JSON_ERROR_READ_CORRUPT_JS
#num BSON_JSON_ERROR_READ_INVALID_PARAM
#num BSON_JSON_ERROR_READ_CB_FAILURE

#callback_t bson_json_reader_cb , Ptr () -> Ptr Word8 -> CSize -> IO SSize

#callback_t bson_json_destroy_cb , Ptr () -> IO ()

#ccall bson_json_reader_new , Ptr () -> <bson_json_reader_cb> -> <bson_json_destroy_cb> -> Int8 -> CSize -> IO (Ptr <bson_json_reader_t>)

#ccall bson_json_reader_new_from_fd , Fd -> Int8 -> IO (Ptr <bson_json_reader_t>)

#ccall bson_json_reader_new_from_file , CString -> Ptr <bson_error_t> -> IO (Ptr <bson_json_reader_t>)

#ccall bson_json_reader_destroy , Ptr <bson_json_reader_t> -> IO ()

#ccall bson_json_reader_read , Ptr <bson_json_reader_t> -> Ptr <bson_t> -> Ptr <bson_error_t> -> IO CInt

#ccall bson_json_data_reader_new , Int8 -> Ptr Word8 -> CSize -> IO (Ptr <bson_json_reader_t>)

#ccall bson_json_data_reader_ingest , Ptr <bson_json_reader_t> -> Ptr Word8 -> CSize -> IO ()

