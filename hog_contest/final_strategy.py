"""
    This file contains your final_strategy that will be submitted to the contest.
    It will only be run on your local machine, so you can import whatever you want!
    Remember to supply a unique PLAYER_NAME or your submission will not succeed.
"""

PLAYER_NAME = '神龍'  # Change this line!


from dice import six_sided, four_sided, make_test_dice
from ucb import main, trace, interact
def roll_dice(num_rolls, dice=six_sided):
    """Simulate rolling the DICE exactly NUM_ROLLS > 0 times. Return the sum of
    the outcomes unless any of the outcomes is 1. In that case, return 1.

    num_rolls:  The number of dice rolls that will be made.
    dice:       A function that simulates a single dice roll outcome.
    """
    # These assert statements ensure that num_rolls is a positive integer.
    assert type(num_rolls) == int, 'num_rolls must be an integer.'
    assert num_rolls > 0, 'Must roll at least once.'
    # BEGIN PROBLEM 1
    "*** YOUR CODE HERE ***"
    result = 0
    judge = True
    for i in range(num_rolls):
        d = dice()
        if d == 1:
            judge = False
        else:
            result += d
    if judge:
        return result
    else:
        return 1
    # END PROBLEM 1
def is_swap(player_score, opponent_score):
    """
    Return whether the two scores should be swapped
    """
    # BEGIN PROBLEM 4
    "*** YOUR CODE HERE ***"
    if (opponent_score // 10) % 10 == abs(player_score % 10 - opponent_score % 10):
        return True
    else:
        return False
def swap_strategy(score, opponent_score, cutoff=8, num_rolls=6):
    """This strategy rolls 0 dice when it triggers a beneficial swap. It also
    rolls 0 dice if it gives at least CUTOFF points and does not trigger a
    non-beneficial swap. Otherwise, it rolls NUM_ROLLS.
    """
    # BEGIN PROBLEM 11
    score += (10 - opponent_score % 10 + opponent_score // 10)
    if is_swap(score, opponent_score):
        if score > opponent_score:
            return num_rolls
        elif score < opponent_score:
            return 0
    if (10 - opponent_score % 10 + opponent_score // 10) >= cutoff:
        return 0
    
    return num_rolls 
def final_strategy(score, opponent_score):
    i, max = 1, 0
    oscore, oop = score, opponent_score
    while i <= 10:
        add = roll_dice(i)
        score, opponent_score = oscore, oop
        score += add
        if is_swap(score, opponent_score):
            score, opponent_score = opponent_score, score
        if max < score:
            max = score
            maxadd = add
            rolls = i
        i += 1
    return swap_strategy(oscore, oop, maxadd, rolls)