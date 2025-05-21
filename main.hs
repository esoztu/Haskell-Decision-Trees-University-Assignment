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

