#include <bson.h>
#include <bindings.dsl.h>
module Data.Bson.Foreign.Keys where
#strict_import
import Data.Bson.Foreign.Types

#ccall bson_uint32_to_string , Word32 -> Ptr CString -> CString -> CSize -> IO CSize

