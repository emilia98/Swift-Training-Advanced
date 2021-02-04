# Group Task 1 - Optimized SubMatrix

```
copy on write за SubMatrix

Като част от изискването подматрицата да се държи като истинска матрица във всяко едно отношение,
искаме да можем да променяме елементи от нея, без това да води до промени в матрицата, от която е създадена. 
За целта при всяка операция, която променя матрицата, ще създадем собствена структура от данни за елементите и, 
след което ще извършим промяната там. 
Това означава, че при операция за промяна скъсваме връзката с оригиналната матрица.
Да се имплементира метода set на subscript за елемент от матрицата според тази стратегия.
```