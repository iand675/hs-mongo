module Data.Bson.Foreign.Types where
import Data.Int
import Data.Word
import Foreign
import Foreign.C
import System.Posix.Types
#include <bson.h>
#include <bindings.dsl.h> 

type SSize = CSsize
type C'bson_unichar_t = Word32

#integral_t bson_context_flags_t
#num BSON_CONTEXT_NONE
#num BSON_CONTEXT_THREAD_SAFE
#num BSON_CONTEXT_DISABLE_HOST_CACHE
#num BSON_CONTEXT_DISABLE_PID_CACHE
#if defined(__linux__)
#num BSON_CONTEXT_USE_TASK_ID
#endif

#opaque_t bson_context_t

#starttype bson_t
#field flags , Word32
#field len , Word32
#field padding , Ptr Word8
#stoptype

-- TODO do something with BSON_INITIALIZER

#starttype bson_oid_t
#field bytes , Ptr Word8
#stoptype

#integral_t bson_validate_flags_t
#num BSON_VALIDATE_NONE
#num BSON_VALIDATE_UTF8
#num BSON_VALIDATE_DOLLAR_KEYS
#num BSON_VALIDATE_DOT_KEYS
#num BSON_VALIDATE_UTF8_ALLOW_NULL

#integral_t bson_type_t
#num BSON_TYPE_EOD
#num BSON_TYPE_DOUBLE
#num BSON_TYPE_UTF8
#num BSON_TYPE_DOCUMENT
#num BSON_TYPE_ARRAY
#num BSON_TYPE_BINARY
#num BSON_TYPE_UNDEFINED
#num BSON_TYPE_OID
#num BSON_TYPE_BOOL
#num BSON_TYPE_DATE_TIME
#num BSON_TYPE_NULL
#num BSON_TYPE_REGEX
#num BSON_TYPE_DBPOINTER
#num BSON_TYPE_CODE
#num BSON_TYPE_SYMBOL
#num BSON_TYPE_CODEWSCOPE
#num BSON_TYPE_INT32
#num BSON_TYPE_TIMESTAMP
#num BSON_TYPE_INT64
#num BSON_TYPE_MAXKEY
#num BSON_TYPE_MINKEY

#integral_t bson_subtype_t
#num BSON_SUBTYPE_BINARY
#num BSON_SUBTYPE_FUNCTION
#num BSON_SUBTYPE_UUID
#num BSON_SUBTYPE_MD5
#num BSON_SUBTYPE_USER


#starttype bson_value_t
#field value_type , <bson_type_t>
#field padding , Int32
#field value.v_oid , <bson_oid_t>
#field value.v_int64 , Int64
#field value.v_int32 , Int32
#field value.v_double , Double
#field value.v_bool , Int8
#field value.v_datetime , Int64
#field value.v_timestamp.timestamp , Int32
#field value.v_timestamp.increment , Int32
#field value.v_utf8.str , CString
#field value.v_utf8.len , Word32
#field value.v_binary.data , Ptr Word8
#field value.v_binary.data_len , Word32
#field value.v_binary.subtype , <bson_subtype_t>
#field value.v_regex.regex , CString
#field value.v_regex.options , CString
#field value.v_dbpointer.collection , CString
#field value.v_dbpointer.collection_len , Word32
#field value.v_dbpointer.oid , <bson_oid_t>
#field value.v_code.code , CString
#field value.v_code.code_len , Word32
#field value.v_codewscope.code , CString
#field value.v_codewscope.scope_data , Ptr Word8
#field value.v_codewscope.code_len , Word32
#field value.v_codewscope.scope_len , Word32
#field value.v_symbol.symbol , CString
#field value.v_symbol.len , Word32
#stoptype

#starttype bson_iter_t
#field raw, Ptr Word8
#field len , Word32
#field off , Word32
#field type , Word32
#field key , Word32
#field d1 , Word32
#field d2 , Word32
#field d3 , Word32
#field d4 , Word32
#field next_off , Word32
#field err_off , Word32
#field value , <bson_value_t>
#stoptype

#starttype bson_reader_t
#field type, Word32
#stoptype

-- TODO
{-
#starttype struct bson_visitor_t
visit_before
visit_after
visit_corrupt
visit_double
visit_utf8
visit_document
visit_array
visit_binary
visit_undefined
visit_oid
visit_bool
visit_date_time
visit_null
visit_regex
visit_dbpointer
visit_code
visit_symbol
visit_codewscope
visit_int32
visit_timestamp
visit_int64
visit_maxkey
visit_minkey
padding
#stoptype
-}

#starttype bson_error_t
#field domain , Word32
#field code , Word32
#field message , CString
#stoptype

