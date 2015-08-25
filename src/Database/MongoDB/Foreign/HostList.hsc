module Database.MongoDB.Foreign.HostList where
#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import

#starttype mongoc_host_list_t
#field next , Ptr <mongoc_host_list_t>
#array_field host , Word8
#array_field host_and_port , Word8
#field port , Word16
#field family , CInt
#array_field padding , Word8
#stoptype
