module Database.MongoDB where
{-
import Data.StateVar
import Foreign
import Foreign.C
import Bindings.Mongoc.Client
import Bindings.Mongoc.Init
import Bindings.Mongoc.Database
import Bindings.Mongoc.URI
-- TODO move init and cleanup out into a C __attribute__((constructor)) and __attribute__((destructor))

class HasReadPrefs x where
  type ReadPrefsVar x
  readPrefs :: x -> (ReadPrefsVar x) ReadPrefs

class HasWriteConcern x where
  type WriteConcernVar x
  writeConcern :: x -> (WriteConcernVar x) WritePrefs

class HasName x where
  type NameVar x
  name :: x -> (NameVar x) String

class HasSslOptions x where
  type SslOptionsVar x
  sslOptions :: x -> (SslOptionsVar x) SslOptions

initMongo :: IO ()
initMongo = c'mongoc_init

cleanupMongo :: IO ()
cleanupMongo = c'mongoc_cleanup

newtype Client s = Client { fromClient :: Ptr C'mongoc_client_t }
instance Show Client where
  show = const "Client"

type Mongo s = RegionT s IO

newClient :: String -> Mongo s (Client s)
newClient s = Client <$> withCString s c'mongoc_client_new

newtype Uri = Uri { fromUri :: Ptr C'mongoc_uri_t }

newClientFromUri :: Uri -> Mongo s (Client s)
newClientFromUri u = Client <$> c'mongoc_client_new_from_uri (fromUri u)

getDatabase :: Client s -> String -> Mongo s (Database s)

getGridFs :: Client s -> String -> String -> Mongo s (Either Error (GridFs s))

getCollection :: Client s -> DatabaseName -> CollectionName -> Mongo s Collection

getDatabaseNames :: Client s -> Mongo s (Either Error [DatabaseName])

findDatabases :: Client s -> Mongo s (Either Error (Cursor s))

getServerStatus :: Client s -> ReadPrefs -> Mongo s (Either Error Bson)

maxMessageSize :: Client s -> GettableStateVar Int32

maxBsonSize :: Client s -> GettableStateVar Int32

instance HasWriteConcern Client where
  type WriteConcernVar Client = StateVar

instance HasReadPrefs Client where
  type ReadPrefsVar Client = StateVar

instance HasSslOptions Client where
  type SslOptionsVar Client = SettableStateVar

-- Client pool functions

newPool :: Uri -> Mongo s ClientPool

pop :: ClientPool -> Mongo s Client

push :: ClientPool -> Client -> Mongo s ()

tryPop :: ClientPool -> Mongo s (Maybe Client)

instance HasSslOptions ClientPool where
  type SslOptionsVar ClientPool = SettableStateVar

-- Collection functions

aggregate :: Collection -> [QueryFlag] -> Bson -> Bson -> ReadPrefs -> Mongo s (Cursor s)

-- command

-- commandSimple

count :: Collection s -> [QueryFlag] -> Bson -> Int64 -> Int64 -> ReadPrefs -> Mongo s (Either BsonError Int64)

countWithOpts :: Collection s -> [QueryFlag] -> Bson -> Int64 -> Int64 -> Bson -> ReadPrefs -> Mongo s (Either Error Int64)

dropCollection :: Collection s -> Mongo s (Either Error Bool)

dropIndex :: Collection s -> String -> Mongo s (Either Error Bool)

createIndex :: Collection s -> Bson -> [IndexOption] -> Mongo s (Either Error Bool)

findIndexes :: Collection s -> Mongo s (Either Error (Cursor s))

find :: Collection -> [QueryFlag] -> Word32 -> Word32 -> Word32 -> Bson -> Bson -> ReadPrefs -> Mongo s (Cursor s)

insert :: Collection -> [InsertFlag] -> Bson -> WriteConcern -> Mongo s (Either Error Bool)

update :: Collection -> [UpdateFlag] -> Bson -> Bson -> WriteConcern -> Mongo s (Either Error Bool)

save :: Collection -> Bson -> WriteConcern -> Mongo s (Either Error Bool)

remove :: Collection -> Bson -> WriteConcern -> Mongo s (Either Error Bool)

rename :: Collection -> String -> String -> Bool -> Mongo s Bool

findAndModify :: Collection -> Bson -> Bson -> Bson -> Bson -> Bool -> Bool -> Bool -> Bson -> Mongo s (Either Error Bool)

stats :: Collection -> Bson -> Bson -> Mongo s (Either BsonError Bool)

bulkOperation :: Collection -> Bool -> WriteConcern -> Mongo s BulkOperation

instance HasReadPrefs Collection where
  type ReadPrefsVar = StateVar

instance HasWriteConcern Collection where
  type WriteConcernVar = StateVar

instance HasName Collection where
  type NameVar = GettableStateVar

lastError :: Collection -> GettableStateVar Bson

keysToIndexString :: Collection -> Bson -> Mongo s String

validate :: Collection -> Bson -> Bson -> Mongo s (Either Error Bool)

-- Database functions

instance HasName Database where
  type NameVar = GettableStateVar

removeUser :: Database -> String -> Mongo s (Either Error Bool)

removeAllUsers :: Database -> Mongo s (Either Error Bool)

addUser :: Database -> String -> String -> Bson -> Bson -> Mongo s Bool

-- command
-- commandSimple

dropDatabase :: Database s -> Mongo s (Either Error Bool)

hasCollection :: Database s -> String -> Mongo s (Either Error Bool)

createCollection :: Database s -> String -> Bson -> Mongo s (Either Error Collection)

class HasReadPrefs Database where
  type ReadPrefsVar Database = StateVar

class HasWriteConcern Database where
  type WritePrefsVar Database = StateVar

findCollections :: Database s -> Bson -> Mongo s (Either Error (Cursor s))

getCollectionNames :: Database s -> Mongo s (Either Error [String])

getCollection :: Database s -> String -> Mongo s (Maybe (Collection s))

-- Write concern functions
writeConcern :: MonadIO m => m WriteConcern

fsync :: WriteConcern -> StateVar Bool

journal :: WriteConcern -> StateVar Bool

w :: WriteConcern -> StateVar Int32

wtag :: WriteConcern -> StateVar Char

wtimeout :: WriteConcern -> StateVar Int32

wmajority :: WriteConcern -> StateVar Int32

-- Read prefs functions

readPrefs :: MonadIO m => ReadPrefs

mode :: ReadPrefs -> StateVar CSize

tags :: ReadPrefs -> StateVar Bson

addTag :: MonadIO m => ReadPrefs -> Bson -> m ()

isValid :: MonadIO m => ReadPrefs -> m Bool

-- Matcher functions

newtype Matcher = Matcher { fromMatcher :: ForeignPtr C'mongoc_matcher_t }

matcher :: MonadIO m => Bson -> m (Either Error Matcher)
matcher b = liftIO $ alloca \errPtr -> do
  p <- c'mongoc_matcher_new b errPtr
  errResult <- peek errPtr
  if errResult
  

match :: MonadIO m => Matcher -> Bson -> m Bool

-- Bulk functions

newtype BulkOperation s = BulkOperation { fromBulkOperation :: C'mongoc_bulk_operation_t }

bulkOperation :: Bool -> Mongo s (BulkOperation s)

bulkInsert :: BulkOperation s -> Bson -> Mongo s ()

bulkRemove :: BulkOperation s -> Bson -> Mongo s ()

bulkRemoveOne :: BulkOperation s -> Bson -> Mongo s ()

bulkReplaceOne :: BulkOperation s -> Bson -> Bson -> Bool -> Mongo s ()

bulkUpdate :: BulkOperation s -> Bson -> Bson -> Bool -> Mongo s ()

bulkUpdateOne :: BulkOperation s -> Bson -> Bson -> Bool -> Mongo s ()

instance HasWriteConcern BulkOperation where
  type WriteConcernVar BulkOperation = SettableStateVar

database :: BulkOperation -> SettableStateVar String

collection :: BulkOperation -> SettableStateVar String

-- client ::

hint :: BulkOperation -> SettableStateVar Word32

-- Flags

newtype RemoveFlags = RemoveFlags { fromRemoveFlags :: C'mongoc_remove_flags_t }
instance Monoid RemoveFlags where
  mempty = RemoveFlags c'MONGOC_REMOVE_NONE
  mappend (RemoveFlags l) (RemoveFlags r) = RemoveFlags (l .|. r)

singleRemove :: RemoveFlags
singleRemove = RemoveFlags c'MONGOC_REMOVE_SINGLE_REMOVE

newtype InsertFlags = InsertFlags { fromInsertFlags :: C'mongoc_insert_flags_t }
instance Monoid InsertFlags where
  mempty = InsertFlags c'MONGOC_INSERT_NONE
  mappend (InsertFlags l) (InsertFlags r) = InsertFlags (l .|. r)

continueOnError :: InsertFlags
continueOnError = InsertFlags c'MONGOC_INSERT_CONTINUE_ON_ERROR

noValidate :: InsertFlags
noValidate = InsertFlags c'MONGOC_INSERT_NO_VALIDATE

newtype QueryFlags = QueryFlags { fromQueryFlags :: C'mongoc_query_flags_t }
instance Monoid QueryFlags where
  mempty = QueryFlags c'MONGOC_QUERY_NONE
  mappend (QueryFlags l) (QueryFlags r) = QueryFlags (l .|. r)

tailableCursor :: QueryFlags
slaveOk :: QueryFlags
oplogReplay :: QueryFlags
noCursorTimeout :: QueryFlags
awaitData :: QueryFlags
exhaust :: QueryFlags
partial :: QueryFlags

newtype ReplyFlags = ReplyFlags { fromReplyFlags :: C'mongoc_reply_flags_t }
instance Monoid ReplyFlags where
  mempty = ReplyFlags c'MONGOC_REPLY_NONE
  mappend (ReplyFlags l) (ReplyFlags r) = ReplyFlags (l .|. r)

cursorNotFound :: ReplyFlags
queryFailure :: ReplyFlags
shardConfigStale :: ReplyFlags
awaitCapable :: ReplyFlags

newtype UpdateFlags = UpdateFlags { fromUpdateFlags :: C'mongoc_update_flags_t }
instance Monoid UpdateFlags where
  mempty = UpdateFlags c'MONGOC_UPDATE_NONE
  mappend (UpdateFlags l) (UpdateFlags r) = UpdateFlags (l .|. r)

upsert :: UpdateFlags
multiUpdate :: UpdateFlags
noValidate :: UpdateFlags

-- Cursor functions

newtype Cursor s = Cursor { fromCursor :: C'mongoc_cursor_t }

hasMore :: Cursor s -> Mongo s Bool
next :: Cursor s -> Mongo s (Maybe (Vector Bson))
checkCursorError :: Cursor s -> Mongo s (Maybe Error)
host :: Cursor s -> Mongo s [Host]
isAlive :: Cursor s -> Mongo s Bool
current :: Cursor s -> Mongo s (Maybe Bson) -- TODO is maybe necessary?
getBatchSize :: Cursor s -> Mongo s Word32
setBatchSize :: Cursor s -> Word32 -> Mongo s ()
hint :: Cursor s -> Mongo s Word32
getId :: Cursor s -> Mongo s Int64 -- TODO newtype for id

-}
