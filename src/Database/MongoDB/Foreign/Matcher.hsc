module Database.MongoDB.Foreign.Matcher where


#include <mongoc.h>
{#context lib = "mongo" prefix = "mongoc_" #}

{#pointer *mongoc_matcher_t as Matcher newtype #}

{#fun matcher_new
  { `Bson',
    `BsonError' } -> `Matcher' #}

{#fun matcher_match
  { `Matcher',
    `Bson' } -> `Bool' #}

{#fun matcher_destroy
  { `Matcher' } -> `()' #}
