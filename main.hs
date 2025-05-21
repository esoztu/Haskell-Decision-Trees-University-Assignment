import Main (maxGainAttribute, removeAttribute)
----------------
-- # Key data types

type Attribute       = String
type Value           = String
type Row             = [Value]
type Header          = [Attribute]

data Label           = Yes | No deriving Show

type TrainingDataSet = (Header, [(Row, Label)])

-- Key decision tree type
data DecisionTree = 
    Leaf Label
    -- ^ A leaf node with a Label value
  | Node Attribute [(Value, DecisionTree)]
    -- ^ A node with an attribute and a list of branches
  deriving Show

-- A partition is a value a list of values paired with a training data set
-- (which does not contain that value or any data belong to that attribute)
type Partition = [(Value, TrainingDataSet)]

----------------
-- # Data set

header :: Header
header = ["outlook", "temp", "humidity", "wind"]

dataset :: [(Row, Label)]
dataset = [(["sunny", "hot", "high", "calm"], No)
        ,(["sunny", "hot", "high", "windy"], No)
        ,(["overcast", "hot", "high", "calm"], Yes)
        ,(["rainy", "mild", "high", "calm"], Yes)
        ,(["rainy", "cool", "normal", "calm"], Yes)
        ,(["rainy", "cool", "normal", "windy"], No)
        ,(["overcast", "cool", "normal", "windy"], Yes)
        ,(["sunny", "mild", "high", "calm"], No)
        ,(["sunny", "cool", "normal", "calm"], Yes)
        ,(["rainy", "mild", "normal", "calm"], Yes)
        ,(["sunny", "mild", "normal", "windy"], Yes)
        ,(["overcast", "mild", "high", "windy"], Yes)
        ,(["overcast", "hot", "normal", "calm"], Yes)
        ,(["rainy", "mild", "high", "windy"], No)]
      
trainingDataSet :: TrainingDataSet
trainingDataSet = (header, dataset)

optimisedDecisionTree :: DecisionTree
optimisedDecisionTree = Node "outlook" [
    ("sunny", Node "humidity" [
      ("high", Leaf No),
      ("normal", Leaf Yes)
    ]),
    ("overcast", Leaf Yes),
    ("rainy", Node "wind" [
      ("windy", Leaf No),
      ("calm", Leaf Yes)
    ])
  ]

-- Helper Functions -- 

-- eqLabel function 
-- checks if two Labels are the same or not 
-- if inputs are the same output True 
-- the wildcard is used for cases when inputs are different

eqLabel :: Label -> Label -> Bool 
eqLabel Yes Yes = True 
eqLabel No No = True 
eqLabel _ _ = False

-- lookupAttribute function 
-- given a header, row and an attribute 
-- returns the value of the attribute in the row
-- if h matches attr return just v 
-- otherwise move to the next attribute-value pair 

lookupAttribute :: Header -> Row -> Attribute -> Maybe Value
lookupAttribute (h:hs) (v:vs) attr 
  | h == attr  = Just v
  | otherwise  = lookupAttribute hs vs attr
lookupAttribute [] [] _ = Nothing

-- removeAttribute function 
-- given a header, row and an attribute 
-- returns the row with the attribute removed 
-- takes first attribute h and first value v 
-- if h matches attr skip v and return the rest of the row 
-- if h does not match attr keep v and continue checking the rest of the attributes 

removeAttribute :: Header -> Row -> Attribute -> Row 
removeAttribute (h:hs) (v:vs) attr 
  | h == attr  = vs
  | otherwise  = v : removeAttribute hs vs attr
lookupAttribute [] [] _ = []

