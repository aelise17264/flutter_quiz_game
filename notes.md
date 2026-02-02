## Underscores _ in naming
 - class _ClassName --> tells Dart this class is private & only accessible in it's home file
 - _ denotes private properties (variables, data) & methods (functions), not usable elsewhere in the code

## Getters
  - for methods that take no inputs, have no parameters & in the end just produce data based on upper class properties we can write a getter instead
  ***no () on a getter*** 
  - Example: getAnswersSummary() --> get answersSummary; 
  when called later in code it's simply "answersSummary" called like a variable (property) even though internally it operates like a method
  - Getters take no arguments and have no side effects

## Arrow function
 - anonymous function that takes an input & immediately returns a value 

    ```summaryData.where((data) => data['user_answer] == data['right_answer']).length;```