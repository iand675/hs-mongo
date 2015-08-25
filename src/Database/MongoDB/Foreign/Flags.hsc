module Database.MongoDB.Foreign.Flags where
#include <mongoc.h>
#include <bindings.dsl.h>
#strict_import

#integral_t mongoc_remove_flags_t
#num MONGOC_REMOVE_NONE
#num MONGOC_REMOVE_SINGLE_REMOVE

#integral_t mongoc_insert_flags_t
#num MONGOC_INSERT_NONE
#num MONGOC_INSERT_CONTINUE_ON_ERROR

#num MONGOC_INSERT_NO_VALIDATE

#integral_t mongoc_query_flags_t
#num MONGOC_QUERY_NONE
#num MONGOC_QUERY_TAILABLE_CURSOR
#num MONGOC_QUERY_SLAVE_OK
#num MONGOC_QUERY_OPLOG_REPLAY
#num MONGOC_QUERY_NO_CURSOR_TIMEOUT
#num MONGOC_QUERY_AWAIT_DATA
#num MONGOC_QUERY_EXHAUST
#num MONGOC_QUERY_PARTIAL

#integral_t mongoc_reply_flags_t
#num MONGOC_REPLY_NONE
#num MONGOC_REPLY_CURSOR_NOT_FOUND
#num MONGOC_REPLY_QUERY_FAILURE
#num MONGOC_REPLY_SHARD_CONFIG_STALE
#num MONGOC_REPLY_AWAIT_CAPABLE

#integral_t mongoc_update_flags_t
#num MONGOC_UPDATE_NONE
#num MONGOC_UPDATE_UPSERT
#num MONGOC_UPDATE_MULTI_UPDATE

#num MONGOC_UPDATE_NO_VALIDATE
