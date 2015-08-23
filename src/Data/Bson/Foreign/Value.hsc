module Data.Bson.Foreign.Value where
#include <bson.h>
#include <bindings.dsl.h> 
#strict_import
import Data.Bson.Foreign.Types

#ccall bson_value_copy , Ptr <bson_value_t> -> Ptr <bson_value_t> -> IO ()

#ccall bson_value_destroy , Ptr <bson_value_t> -> IO ()

