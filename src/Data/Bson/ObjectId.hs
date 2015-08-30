module Data.Bson.ObjectId (
  ObjectId,
  newObjectId,
  newObjectId',
  isValid,
  hash,
  getTime
  newFromPtr,
  newSequence,
  readObjectId,
  showObjectId,
  -- ** Accessing ObjectId internals
  fromObjectId
) where
import Data.Bson.Context
import Bindings.Libbson.Oid

newtype ObjectId = ObjectId { fromObjectId :: ForeignPtr C'bson_oid_t }

instance Show Oid where
  show = C.unpack . showObjectId
instance Read Oid where
  readsPrec _ str = [(readObjectId $ C.pack str, drop 24 str)]

-- | Not terribly useful since @ObjectId@s are immutable.
oidCopy :: Oid -> IO Oid
oidCopy (Oid o) = do
  o' <- malloc
  withForeignPtr o $ \op -> c'bson_oid_copy op o'
  oid' <- newForeignPtr finalizerFree o'
  return $ Oid oid'
  
instance Eq Oid where
  (==) (Oid o1) (Oid o2) = unsafeDupablePerformIO $
                          withForeignPtr o1 $ \o1' ->
                          withForeignPtr o2 $ \o2' -> do
                            r <- c'bson_oid_equal o1' o2'
                            return (r /= 0)

instance Ord Oid where
  compare (Oid o1) (Oid o2) | compResult > 0 = GT
                            | compResult < 0 = LT
                            | otherwise      = EQ
    where
      compResult = unsafeDupablePerformIO $
                   withForeignPtr o1 $ \o1' ->
                   withForeignPtr o2 $ \o2' -> c'bson_oid_compare o1' o2'

isValid :: C.ByteString -> Bool
isValid bs = unsafeDupablePerformIO $ B.unsafeUseAsCStringLen bs $ \(str, len) -> do
  r <- c'bson_oid_is_valid str (fromIntegral len)
  return (r /= 0)

getTime :: Oid -> Int64
getTime (Oid o) = case unsafeDupablePerformIO (withForeignPtr o c'bson_oid_get_time_t) of
  (CTime t) -> t

hash :: Oid -> Word32
hash (Oid o) = unsafeDupablePerformIO $ withForeignPtr o c'bson_oid_hash

newObjectId :: IO Oid
newObjectId = newObjectId' defaultBsonContext

newObjectId' :: BsonContext -> IO Oid
newObjectId' ctxt = makeOid $ \oid -> withForeignPtr (fromBsonContext ctxt) $ c'bson_oid_init oid

newFromPtr :: Ptr Word8 -> IO Oid
newFromPtr ptr = makeOid $ \oid -> c'bson_oid_init_from_data oid ptr

newSequence :: BsonContext -> IO Oid
newSequence ctxt = makeOid $ \oid -> withForeignPtr (fromBsonContext ctxt) $
                                    c'bson_oid_init_sequence oid

readObjectId :: C.ByteString -> Oid
readObjectId bs = unsafeDupablePerformIO $ makeOid $ \oid -> B.unsafeUseAsCString bs $ \cstr -> do
  c'bson_oid_init_from_string oid cstr
  
showObjectId :: Oid -> C.ByteString
showObjectId (Oid o) = unsafeDupablePerformIO $ allocaBytes strSize $ \cstr -> do
  withForeignPtr o $ \o' -> c'bson_oid_to_string o' cstr
  -- The bson_oid_to_string tacks on a null delimiter, so this is safe.
  C.packCString cstr 
  where
    strSize = 25

makeOid :: (Ptr C'bson_oid_t -> IO a) -> IO Oid
makeOid f = do
  oid <- malloc
  f oid
  oid' <- newForeignPtr finalizerFree oid
  return $ Oid oid'
