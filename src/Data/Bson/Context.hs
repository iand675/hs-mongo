module Data.Bson.Context where

newtype BsonContext = BsonContext { fromBsonContext :: ForeignPtr C'bson_context_t }

defaultBsonContext :: BsonContext
defaultBsonContext = BsonContext $ unsafePerformIO (c'bson_context_get_default >>= newForeignPtr_)
{-# NOINLINE defaultBsonContext #-}

newBsonContext :: ContextFlags -> IO BsonContext
newBsonContext flags = do
  ptr <- c'bson_context_new $ fromIntegral $ fromContextFlags flags
  ptr' <- newForeignPtr p'bson_context_destroy ptr
  return $ BsonContext ptr'


newtype ContextFlags = ContextFlags { fromContextFlags :: CSize }
                     deriving (Show, Eq, Ord)

instance Monoid ContextFlags where
  mempty = ContextFlags c'BSON_CONTEXT_NONE
  mappend (ContextFlags l) (ContextFlags r) = ContextFlags (l .|. r)

threadSafe :: ContextFlags
threadSafe = ContextFlags c'BSON_CONTEXT_THREAD_SAFE

disableHostCache :: ContextFlags
disableHostCache = ContextFlags c'BSON_CONTEXT_DISABLE_HOST_CACHE

disablePidCache :: ContextFlags
disablePidCache = ContextFlags c'BSON_CONTEXT_DISABLE_PID_CACHE

#if linux_TARGET_OS
useTaskId :: ContextFlags
useTaskId = c'BSON_CONTEXT_USE_TASK_ID
#endif
