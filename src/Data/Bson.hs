{-# LANGUAGE CPP #-}
module Data.Bson where
import Bindings.Libbson.Context
import Bindings.Libbson.Memory
import Bindings.Libbson.Oid
import Bindings.Libbson.Types
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

-- Oid functions

