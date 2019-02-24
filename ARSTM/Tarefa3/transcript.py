import speech_recognition as sr

# obtain path to "english.wav" in the same folder as this script
from os import path

AUDIO_FILE = path.join(path.curdir,"DebBandPres2018.wav")

txt = open("DebBandPres2018-34.txt", "w")

# use the audio file as the audio source
r = sr.Recognizer()

with sr.AudioFile(AUDIO_FILE) as source:
    audio = r.record(source,duration=25)  # read the entire audio file

BING_KEY = ""  # Microsoft Bing Voice Recognition API keys 32-character lowercase hexadecimal strings
try:
    txt.write(r.recognize_bing(audio, key=BING_KEY,language="pt-BR"))
except sr.UnknownValueError:
    print("Microsoft Bing Voice Recognition could not understand audio")
except sr.RequestError as e:
    print("Could not request results from Microsoft Bing Voice Recognition service; {0}".format(e))

txt.close()