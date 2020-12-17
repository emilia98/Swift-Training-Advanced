# Task 1 - Sum Digits

```
Write a function with the following prototype that returns the sum of the digits of an integer.
int sumOfDigits(int x);
If x is 234, the function should return 2 + 3 + 4, that is, 9.

If x is 12, the function should return 1 + 2, which is 3.

If x is 39, the function should return 12.

If x is negative, ignore the minus sign. For example, -12 and 12 both return 3.

Use recursion.

Hints:
The base case is a number between 0 and 9.
If x is negative, just multiply it by -1 as soon as you enter the function.
For the recursive call, consider how computing the values x/10 and x%10 might be useful.
```