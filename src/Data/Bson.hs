{-# LANGUAGE CPP #-}
module Data.Bson where
import Data.Bson.Foreign.Context
import Data.Bson.Foreign.Memory
import Data.Bson.Foreign.Oid
import Data.Bson.Foreign.Types
import qualified Data.ByteString.Char8 as C
import qualified Data.ByteString.Unsafe as B
import Foreign
import Foreign.C
import Foreign.ForeignPtr
import System.IO.Unsafe

data BsonError = BsonError { domain  :: !Word32
                           , code    :: !Word32
                           , message :: !String
                           }

newtype Bson = Bson { fromBson :: Ptr C'bson_t }

-- TODO wat
-- withBson :: BsonValue -> (Bson -> a) -> a 

newtype ContextFlags = ContextFlags { fromContextFlags :: CSize }
instance Monoid ContextFlags where
  mempty = ContextFlags c'BSON_CONTEXT_NONE
  mappend (ContextFlags l) (ContextFlags r) = ContextFlags (l .|. r)

threadSafe :: ContextFlags
threadSafe = ContextFlags c'BSON_CONTEXT_THREAD_SAFE

disableHostCache :: ContextFlags
disableHostCache = ContextFlags c'BSON_CONTEXT_DISABLE_HOST_CACHE

disablePidCache :: ContextFlags
disablePidCache = ContextFlags c'BSON_CONTEXT_DISABLE_PID_CACHE

#if defined(__linux__)
useTaskId :: ContextFlags
useTaskId = c'BSON_CONTEXT_USE_TASK_ID
#endif

newtype ValidateFlags = ValidateFlags { fromValidateFlags :: CSize }
instance Monoid ValidateFlags where
  mempty = ValidateFlags c'BSON_VALIDATE_NONE
  mappend (ValidateFlags l) (ValidateFlags r) = ValidateFlags (l .|. r)

validateUtf8 :: ValidateFlags
validateUtf8 = ValidateFlags c'BSON_VALIDATE_UTF8

validateDollarKeys :: ValidateFlags
validateDollarKeys = ValidateFlags c'BSON_VALIDATE_DOLLAR_KEYS

validateDotKeys :: ValidateFlags
validateDotKeys = ValidateFlags c'BSON_VALIDATE_DOT_KEYS

validateUtf8AllowNull :: ValidateFlags
validateUtf8AllowNull = ValidateFlags c'BSON_VALIDATE_UTF8_ALLOW_NULL

{-
data BsonType = EOD
              | Double
              | Utf8
              | Document
              | Array
              | Binary
              | Undefined
              | Oid
              | Bool
              | DateTime
              | Null
              | Regex
              | DbPointer
              | Code
              | Symbol
              | CodeWScope
              | Int32
              | Int64
              | MaxKey
              | MinKey

data BsonSubtype = Binary
                 | Function
                 | Uuid
                 | Md5
                 | User

type Document = (Vector Text, Vector Value)

data Value = Double    Double
           | Utf8      Text
           | Document  Document
           | Array     (Vector Value)
           | Binary    BsonSubtype    ByteString
           | Undefined
           | Oid       Oid
           | Bool      Bool
           | DateTime  Int64
           | Null
           | Regex
           | DbPointer
           | Code
           | Symbol
           | CodeWScope
           | Int32
           | Timestamp (Int32, Int32)
           | Int64
           | MaxKey
           | MinKey

-}

-- Context functions

newtype BsonContext = BsonContext { fromBsonContext :: ForeignPtr C'bson_context_t }

newBsonContext :: ContextFlags -> IO BsonContext
newBsonContext flags = do
  ptr <- c'bson_context_new $ fromIntegral $ fromContextFlags flags
  ptr' <- newForeignPtr p'bson_context_destroy ptr
  return $ BsonContext ptr'

defaultBsonContext :: BsonContext
defaultBsonContext = BsonContext $ unsafePerformIO (c'bson_context_get_default >>= newForeignPtr_)
{-# NOINLINE defaultBsonContext #-}

-- Oid functions

newtype Oid = Oid { fromOid :: ForeignPtr C'bson_oid_t }

oidCompare :: Oid -> Oid -> Ordering
oidCompare (Oid o1) (Oid o2) | compResult > 0 = GT
                             | compResult < 0 = LT
                             | otherwise      = EQ
  where
    compResult = unsafeDupablePerformIO $
                 withForeignPtr o1 $ \o1' ->
                 withForeignPtr o2 $ \o2' -> c'bson_oid_compare o1' o2'

oidCopy :: Oid -> IO Oid
oidCopy (Oid o) = do
  o' <- malloc
  withForeignPtr o $ \op -> c'bson_oid_copy op o'
  oid' <- newForeignPtr finalizerFree o'
  return $ Oid oid'
  

oidEqual :: Oid -> Oid -> Bool
oidEqual (Oid o1) (Oid o2) = unsafeDupablePerformIO $
                             withForeignPtr o1 $ \o1' ->
                             withForeignPtr o2 $ \o2' -> do
                               r <- c'bson_oid_equal o1' o2'
                               return (r /= 0)

oidIsValid :: C.ByteString -> Bool
oidIsValid bs = unsafeDupablePerformIO $ B.unsafeUseAsCStringLen bs $ \(str, len) -> do
  r <- c'bson_oid_is_valid str (fromIntegral len)
  return (r /= 0)

oidGetTime :: Oid -> Int64
oidGetTime (Oid o) = case unsafeDupablePerformIO (withForeignPtr o c'bson_oid_get_time_t) of
  (CTime t) -> t

oidHash :: Oid -> Word32
oidHash (Oid o) = unsafeDupablePerformIO $ withForeignPtr o c'bson_oid_hash

oidInit :: BsonContext -> IO Oid
oidInit ctxt = makeOid $ \oid -> withForeignPtr (fromBsonContext ctxt) $ c'bson_oid_init oid

-- TODO test if this can just do BSI.createFromPtr ptr instead of calling out to C
oidInitFromData :: Ptr Word8 -> IO Oid
oidInitFromData ptr = makeOid $ \oid -> c'bson_oid_init_from_data oid ptr

-- TODO does this require the string to be null-terminated?
oidInitFromASCIIString :: C.ByteString -> IO Oid
oidInitFromASCIIString bs = makeOid $ \oid -> B.unsafeUseAsCString bs $ \cstr -> do
  c'bson_oid_init_from_string oid cstr

oidInitSequence :: BsonContext -> IO Oid
oidInitSequence ctxt = makeOid $ \oid -> withForeignPtr (fromBsonContext ctxt) $
                                        c'bson_oid_init_sequence oid
  
makeOid :: (Ptr C'bson_oid_t -> IO a) -> IO Oid
makeOid f = do
  oid <- malloc
  f oid
  oid' <- newForeignPtr finalizerFree oid
  return $ Oid oid'

oidToASCIIString :: Oid -> IO C.ByteString
oidToASCIIString (Oid o) = allocaBytes 25 $ \cstr -> do
  withForeignPtr o $ \o' -> c'bson_oid_to_string o' cstr
  C.packCStringLen (cstr, 25)

