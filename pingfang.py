#!/bin/python
import sys


def sqrt_func(x, small):
    assert x >= 0
    assert small > 0

    loops = 1
    low = 0.0
    high = x
    while True and loops <= 100:
        guess = (low + high) / 2

        if abs(guess ** 2 - x) < small:
            break
        elif guess ** 2 < x:
            low = guess
        else:
            high = guess

        print low, high, guess
        loops += 1

    return guess


if __name__ == '__main__':
    small_value = 0.00000001
    test_data = [10.0, 23, 25, 0, 4, 0.25, 0.5]
    for x in test_data:
        y = sqrt_func(x, small_value)
        assert abs(y ** 2 - x) < small_value, "Error occur"

    print "pass"
