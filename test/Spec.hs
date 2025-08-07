{-
  Copyright © Josep Bigorra <jjbigorra@gmail.com>

  This file is part of Keuringsdienst.
  Keuringsdienst is free software: you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation, either version 3 of the License,
    or (at your option) any later version.

  Keuringsdienst is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
    without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

  See the GNU Lesser General Public License for more details.
  You should have received a copy of the GNU Lesser General Public License
    along with Keuringsdienst. If not, see <https://www.gnu.org/licenses/>.
-}

module Main (main) where

import Keuringsdienst.HelpersSpec
import KeuringsdienstSpec
import System.Exit qualified as Exit
import Test.HUnit

main :: IO ()
main = do
  result <- runTestTT (TestList [keuringsdienstSpec, keuringsdienstHelpersSpec])
  if failures result > 0 then Exit.exitFailure else Exit.exitSuccess
