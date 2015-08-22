module Database.MongoDB.Foreign.WriteConcern where
import Data.Int
import Foreign
import Foreign.C

#include <mongoc.h>
#include <bindings.dsl.h> 

#num MONGOC_WRITE_CONCERN_W_UNACKNOWLEDGED
#num MONGOC_WRITE_CONCERN_W_ERRORS_IGNORED
#num MONGOC_WRITE_CONCERN_W_DEFAULT
#num MONGOC_WRITE_CONCERN_W_MAJORITY
#num MONGOC_WRITE_CONCERN_W_TAG

#opaque_t mongoc_write_concern_t

#ccall mongoc_write_concern_new , IO (Ptr <mongoc_write_concern_t>)
#ccall mongoc_write_concern_copy , Ptr <mongoc_write_concern_t> -> IO (Ptr <mongoc_write_concern_t>)
#ccall mongoc_write_concern_destroy , Ptr <mongoc_write_concern_t> -> IO ()

#ccall mongoc_write_concern_get_fsync , Ptr <mongoc_write_concern_t> -> IO Int8
#ccall mongoc_write_concern_set_fsync , Ptr <mongoc_write_concern_t> -> Int8 -> IO ()

#ccall mongoc_write_concern_get_journal , Ptr <mongoc_write_concern_t> -> IO Int8
#ccall mongoc_write_concern_set_journal , Ptr <mongoc_write_concern_t> -> Int8 -> IO ()

#ccall mongoc_write_concern_get_w , Ptr <mongoc_write_concern_t> -> IO Int32
#ccall mongoc_write_concern_set_w , Ptr <mongoc_write_concern_t> -> Int32 -> IO ()

#ccall mongoc_write_concern_get_wtag , Ptr <mongoc_write_concern_t> -> IO CChar
#ccall mongoc_write_concern_set_wtag , Ptr <mongoc_write_concern_t> -> CChar -> IO ()

#ccall mongoc_write_concern_get_wtimeout , Ptr <mongoc_write_concern_t> -> IO Int32
#ccall mongoc_write_concern_set_wtimeout , Ptr <mongoc_write_concern_t> -> Int32 -> IO ()

#ccall mongoc_write_concern_get_wmajority , Ptr <mongoc_write_concern_t> -> IO Int32
#ccall mongoc_write_concern_set_wmajority , Ptr <mongoc_write_concern_t> -> Int32 -> IO ()
