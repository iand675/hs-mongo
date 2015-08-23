module Data.Bson.Foreign.Md5 where
#include <bson.h>
#include <bindings.dsl.h>
module Data.Bson.Foreign.Json where
#strict_import
import Data.Bson.Foreign.Types

#starttype struct bson_md5_t
#array_field count, Word32
#array_field abcd, Word32
#array_field buf, Word8
#stoptype

#ccall bson_md5_init , Ptr <bson_md5_t> -> IO ()
#ccall bson_md5_append , Ptr <bson_md5_t> -> Ptr Word8 -> Word32 -> IO ()
#ccall bson_md5_finish , Ptr <bson_md5_t> -> Ptr Word8 -> IO ()
