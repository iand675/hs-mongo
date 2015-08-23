module Database.MongoDB.Foreign.Matcher where
#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import
import Data.Bson.Foreign.Types

#opaque_t mongoc_matcher_t

#ccall mongoc_matcher_new , Ptr <bson_t> -> Ptr <bson_error_t> -> IO (Ptr <mongoc_matcher_t>)

#ccall mongoc_matcher_match , Ptr <mongoc_matcher_t> -> Ptr <bson_t> -> IO Int8

#ccall mongoc_matcher_destroy , Ptr <mongoc_matcher_t> -> IO ()
