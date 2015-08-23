module Data.Bson.Foreign.Value where
import Foreign
import Foreign.C
#include <bson.h>
#include <bindings.dsl.h> 

#ccall bson_value_copy , Ptr <bson_value_t> -> Ptr <bson_value_t> -> IO ()

#ccall bson_value_destroy , Ptr <bson_value_t> -> IO ()

