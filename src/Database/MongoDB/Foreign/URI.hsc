module Database.MongoDB.Foreign.URI where
import Foreign
import Foreign.C

#include <mongoc.h>
#include <bindings.dsl.h> 

#opaque_t mongoc_uri_t

