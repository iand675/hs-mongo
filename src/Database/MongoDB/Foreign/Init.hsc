module Database.MongoDB.Foreign.Init where
import Foreign

#include <mongoc.h>
#include <bindings.dsl.h> 

#ccall mongoc_init , IO ()
#ccall mongoc_cleanup , IO ()
