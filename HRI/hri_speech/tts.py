import sys
from subprocess import call
input_string = sys.argv
input_string.pop(0)
tts_string = " ".join(input_string)
call(["spd-say", tts_string])
