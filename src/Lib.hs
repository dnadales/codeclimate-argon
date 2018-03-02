module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn $ "{  \"type\": \"issue\",  \"check_name\": \"Argon/Metrics/CyclomaticComplexity\",  \"description\": \"Cyclomatic complexity for complex_method is too high (10/3)\",  \"content\": {    \"body\": \"Put some **nice** `explanation` of the -issue- in markdown\"  },  \"categories\": [\"Complexity\"],  \"location\": {    \"path\" :\"src/Lib.hs\",    \"lines\": {      \"begin\": 3,      \"end\": 3          }  },  \"other_locations\": [],  \"remediation_points\": 50000,  \"severity\": \"major\",  \"fingerprint\": \"abcd1234\"}" ++ "\0"
