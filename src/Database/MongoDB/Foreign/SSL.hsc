module Database.MongoDB.Foreign.SSL where
#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import

#starttype mongoc_ssl_opt_t
#field pem_file , CString
#field pem_pwd , CString
#field ca_file , CString
#field ca_dir , CString
#field crl_file , CString
#field weak_cert_validation , Int8
#array_field padding , Word8
#stoptype

#ccall mongoc_ssl_opt_get_default , IO (Ptr <mongoc_ssl_opt_t>)

