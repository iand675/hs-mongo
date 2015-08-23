module Data.Bson.Foreign.Value where
import Foreign
import Foreign.C
#include <bson.h>
#include <bindings.dsl.h> 


#callback_t bson_reader_read_func_t , Ptr () -> Ptr () -> CSize -> IO SSize

#callback_t bson_reader_destroy_func_t , Ptr () -> IO ()

-- TODO check the type signatures for things with callbacks
#ccall bson_reader_new_from_handle , Ptr () -> <bson_reader_read_func_t> -> <bson_reader_destroy_func_t> -> IO (Ptr <bson_reader_t>)

#ccall bson_reader_new_from_fd , Fd -> Int8 -> IO (Ptr <bson_reader_t>)

#ccall bson_reader_new_from_file , CString -> Ptr <bson_error_t> -> IO (Ptr <bson_reader_t>)

#ccall bson_reader_new_from_data , Ptr Word8 -> CSize -> IO (Ptr <bson_reader_t>)

#ccall bson_reader_destroy , Ptr <bson_reader_t> -> IO ()

#ccall bson_reader_set_read_func , Ptr <bson_reader_t> -> <bson_reader_read_func_t> -> IO ()

#ccall bson_reader_set_destroy_func , Ptr <bson_reader_t> -> <bson_reader_destroy_func_t> -> IO ()

#ccall bson_reader_read , Ptr <bson_reader_t> -> Ptr Int8 -> IO (Ptr <bson_t>)

#ccall bson_reader_tell , Ptr <bson_reader_t> -> IO <off_t>



