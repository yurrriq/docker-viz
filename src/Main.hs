module Main where


import Language.Dockerfile


main :: IO ()
main = do Right d <- parseFile "./Dockerfile"
          putStr (prettyPrint (filter go d))
  where
    go :: InstructionPos -> Bool
    go (InstructionPos (Copy _ _) _ _) = True
    go (InstructionPos (From _) _ _)   = True
    go _                               = False
