# Test Driven Development

## Learning Outcomes

- Understand what test-driven development is, and why it's important.

- Understand the three stages of a TDD cycle

### What is Test-Driven Development?

TDD: is a process and technique of software development that relies on the repetition of a very short and specific development cycle.

Once the code is written and passes our test suit, we can move on to refactoring while making sure everything is still functioning properly.

### Why is it important?

Testing a all levels is crucial because it ensures that our application is working as intended. Testing assures that what you add works with what you already have. It;s like a safty net that leaves your application more open to change, grown, and evolve.

Here are 3 reasons why TDD is important to learn and implement.

1. Practice - Many employers look for developers who have experience or interest in testing.

2. Effectiveness - Writting test before code is like strethcing before a workout. Ut ensures that the code which comes after has a clearer design, pourpose, and quality.

3. Efficiency - You'll save time in the long run by not having to re-run entire applications just to make sure little parts work.

## 9 Benefits of Test Driven Development

TDD is the practice of writing a test for a piece of required functionality before writing any implementation code. Once the code passes the test, you can then safely refactor your code. Here are some more benefits of TDD...

### 1) Acceptance Criteria

When writting new code, there is usually a list of required features to be implemented. This can be a means to know what needs tests. Once you've got the list expressed as tests, it's easier to trust your application meets the criteria.

### 2) Focus

Writting tests before code narrrows down your focus onto what needs to be worked on instead of thinking how to tackle a project with disorgonized efforts. It helps break down the functionality into smaller pieces.

### 3) Interfaces

With TDD, the public interface comes first rather than thinking about how to organize the code/backend of things

### 4) Tidier Code

Tests are only interfacing with public methods, so you have a much better idea of what can be made private, meaning you dont accidentally expose methods that dont need to be public.

### 5) Dependencies

When writting your tests, you'll be able to mock dependencies without really worring about what they are doing behind the scenes, which lets you focus more on the logic within the class you're witting out.

### 6) Safer Refactoring

Once you have a test passing, it's then safer to refactor it becuase you're able to run the test again to make sure it's working properly if any changes are made.

### 7) Fewer Bugs

TDD results in more tests, which then can often result in longer test run times. However, with better code coverage, you;re able to save time down the line fixing bugs.

### 8) Increasing Returns

The cost of changing fucntionality is less because the tests act as a safty net which ensures your changes wont break exisitng functionality.

### 9) Living Documentation

If you're unsure how a specific functionality is supposed to run, reading through the test makes it clear how the function should be operting, and what the expected results are. You can see the expected input and output.
