#include <bson.h>
#include <bindings.dsl.h>
module Data.Bson.Foreign.Context where
#strict_import
import Data.Bson.Foreign.Types

#ccall bson_context_new , <bson_context_flags_t> -> IO (Ptr <bson_context_t>)

#ccall bson_context_destroy , Ptr <bson_context_t> -> IO ()

#ccall bson_context_get_default , IO (Ptr <bson_context_t>)

