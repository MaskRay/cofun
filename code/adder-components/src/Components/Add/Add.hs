{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeOperators    #-}
module Components.Add.Add (
    add
  ) where

import           Components.Add.Functors  (AddF (..))

import           Util.Coproduct           (Sum, Contains(..))

import           Control.Monad.Free (MonadFree)
import           Control.Monad.Trans.Free (liftF)

add :: (MonadFree (Sum f) m, Contains AddF f) => Int -> m Bool
add x = liftF . inj $ Add x id
