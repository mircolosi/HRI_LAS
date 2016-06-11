import pyaudio
import wave
import audioop
from collections import deque
import os
import urllib2
import urllib
import time
import json

FLAC_CONV = 'flac -s -f ' # We need a WAV to FLAC converter.


def listen_for_speech():
    """
Does speech recognition using Google's speech recognition service.
Records sound from microphone until silence is found and save it as WAV and then converts it to FLAC. Finally, the file is sent to Google and the result is returned.
"""

    #config
    chunk = 1024
    FORMAT = pyaudio.paInt16
    CHANNELS = 1
    RATE = 16000
    THRESHOLD = 250 #The threshold intensity that defines silence signal (lower than).
    SILENCE_LIMIT = 3 #Silence limit in seconds. The max ammount of seconds where only silence is recorded. When this time passes the recording finishes and the file is delivered.

    #open stream
    p = pyaudio.PyAudio()

    stream = p.open(format = FORMAT,
                    channels = CHANNELS,
                    rate = RATE,
                    input = True,
                    frames_per_buffer = chunk)

    all_m = []
    data = ''
    rel = RATE/chunk
    slid_win = deque(maxlen=SILENCE_LIMIT*rel)
    started = False
    print "listening ..."
    
    while (True):
        data = stream.read(chunk)
        slid_win.append (abs(audioop.avg(data, 2)))

        # print slid_win[-1] # print last sample
    
        if(True in [ x>THRESHOLD for x in slid_win]):
            if(not started):
                print "start recording ..."
            started = True
            all_m.append(data)
        elif (started==True):
            print "... finish recording"
            #the timeout limit was reached, finish capture and deliver
            
            filename = save_speech(all_m,p)
            stt_google_wav(filename)
            
            #reset all
            started = False
            slid_win = deque(maxlen=SILENCE_LIMIT*rel)
            all_m= []
            print "listening ..."

    print "* done recording"
    stream.close()
    p.terminate()


def save_speech(data, p):
    filename = 'output_'+str(int(time.time()))
    # write data to WAVE file
    data = ''.join(data)
    wf = wave.open(filename+'.wav', 'wb')
    wf.setnchannels(1)
    wf.setsampwidth(p.get_sample_size(pyaudio.paInt16))
    wf.setframerate(16000)
    wf.writeframes(data)
    wf.close()
    return filename


def stt_google_wav(filename):
    #Convert to flac
    os.system(FLAC_CONV+ filename+'.wav')
    f = open(filename+'.flac','rb')
    flac_cont = f.read()
    f.close()

    key = "AIzaSyByemx7vgGkqDcgqoe1YxJYqp6gWOmytJ4" #YOUR API KEY HERE
    googl_speech_url = 'https://www.google.com/speech-api/v2/recognize?&lang=en-US&key=%s' % key
    hrs = {"User-Agent": "Mozilla/5.0 (X11; Linux i686) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.63 Safari/535.7",'Content-type': 'audio/x-flac; rate=16000'}
    req = urllib2.Request(googl_speech_url, data=flac_cont, headers=hrs)
    p = urllib2.urlopen(req)
 
    temp = p.read()
    #print temp
    
    s = temp.split("\n")
    if len(s) > 1:
      try:
        res = json.loads(s[1])
        transcription = ""

        if (("result" in res) and (len(res['result']) > 0)):
            for i in range(0,len(res['result'])):
                s = res['result'][i]
                if 'alternative' in s:
                    if len(s['alternative']) > 0:
                        for j in range(0,len(s['alternative'])):
                            t = s['alternative'][j]
                            if 'transcript' in t:
                                r = t['transcript']
                                print "  Alternative: ",r 
                                if (i==0 and j==0):
                                    transcription = r

        print "Transcription: %s" % transcription
        map(os.remove, (filename+'.flac', filename+'.wav'))

      except ValueError:
        print "No JSON to be parsed. No result"
    else:
        print "No result"
    

if(__name__ == '__main__'):
    print "*** Google Speech API test *** - CTRL+C to quit"
    listen_for_speech()
