
# COMP5450: Decision Trees in Haskell – Assignment 1

This repository contains my solution for COMP5450 Assessment 1 , which focuses on implementing decision trees in Haskell. The model is trained to predict whether to play tennis based on weather-related attributes.

# Overview

The project builds on the seminal paper by J. Ross Quinlan on decision tree induction and applies it to a simplified weather dataset.

The assessment is divided into four parts:
1. Helper Functions – Utility functions for manipulating headers, rows, and labels.
2. Evaluating a Decision Tree – Functions to traverse and validate decision trees.
3. Training a Decision Tree – Functions to learn trees using inductive partitioning.
4. Extension – Implementation of attribute selection using **information gain** to optimize the decision tree.

# Core Concepts

- Attributes: `outlook`, `temp`, `humidity`, `wind`
- Labels : `Yes` or `No` (whether to play tennis)
- Decision Trees : Represented as recursive Haskell data types
- Training Set : A fixed dataset defined in `template.hs`
- Evaluation : Inference and validation against labeled data

# Files

- `eo409.hs`: Main Haskell file containing all functions grouped by assessment question.
- `template.hs`: Provided by the module, includes essential type definitions and sample data.

# Restrictions

- Only standard Prelude functions are used (no external libraries).
- Must follow provided type definitions.
- Code is self-contained and compiles without errors.
- Clear inline comments identify solutions to specific questions.


# Reference

Quinlan, J. Ross. *Induction of decision trees*. Machine learning 1 (1986): 81-106.
