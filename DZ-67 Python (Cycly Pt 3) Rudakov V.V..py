'''Задание 1
Напишите программу, которая запрашивает два
целых числа x и y, после чего вычисляет и выводит
значение x в степени y.'''


# x = int(input('Введите число Х: '))
# y = int(input('Введите число У: '))
# print('Х в степени У =',x ** y)


'''Задание 2
Подсчитать количество целых чисел в диапазоне от
100 до 999 у которых есть две одинаковые цифры.'''


# a = 100
# b = 999
# Q = 0
# for i in range(a, b + 1):
#     st1, st2, st3 = str(i)
#     if st1 == st2 or st1 == st3 or st2 == st3:
#         Q += 1
# print('Две одинаковые цифры у', Q,'чисел.')


'''Задание 3
Подсчитать количество целых чисел в диапазоне от
100 до 9999 у которых все цифры разные.'''


# a = 100
# b = 9999
# Q = 0
# for i in range(a, b + 1):
#     st1 = (a // 1000)
#     st2 = ((a // 100) % 10)
#     st3 = ((a % 100) // 10)
#     st4 = (a % 10)
#     if a < 1000:
#         (st2 != st3 or st2 != st4 or st3 != st4)
#         Q += 1
#     if a > 1000:
#         (st1 != st2 or st1 != st3 or st1 != st4 or st2 != st3 or st2 != st4 or st3 != st4)
#         Q += 1
# print('Все цифры разные у', Q,'чисел.')


'''Задание 4
Пользователь вводит любое целое число. Необхо-
димо из этого целого числа удалить все цифры 3 и 6 и
вывести обратно на экран.'''


# a = int(input('Введите число: '))
# Q = 0
# X = 0
# while a:
#     if not a % 10 in (3, 6):
#         X += (a % 10) * (10 ** Q)
#         Q += 1
#     a //= 10
# print(X,'- обрезанное число')