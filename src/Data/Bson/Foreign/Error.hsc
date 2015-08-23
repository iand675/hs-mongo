#include <bson.h>
#include <bindings.dsl.h>
module Data.Bson.Foreign.Error where
#strict_import
import Data.Bson.Foreign.Types

#num BSON_ERROR_JSON
#num BSON_ERROR_READER

#num BSON_ERROR_BUFFER_SIZE

-- | N.B. the CString is a format string. Make sure not to pass in any formatting directives in the string.
#ccall bson_set_error , Ptr <bson_error_t> -> Word32 -> Word32 -> CString -> IO ()

#ccall bson_strerror_r  , CInt -> CString -> CSize -> IO CString

