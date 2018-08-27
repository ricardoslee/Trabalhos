#!/usr/bin/env python3

import io
import os

# Imports the Google Cloud client library
from google.cloud import speech
from google.cloud.speech import enums
from google.cloud.speech import types

# Instantiates a client
client = speech.SpeechClient()

# The name of the audio file to transcribe
file_name = ('DebBandPres2018.mp3')

# Loads the audio into memory
with io.open(file_name, 'rb') as audio_file:
    content = audio_file.read()
    audio = types.RecognitionAudio(content=content)

config = types.RecognitionConfig(
    encoding=enums.RecognitionConfig.AudioEncoding.LINEAR16,
    sample_rate_hertz=44100,
    language_code='pt-BR')

# Detects speech in the audio file

txt = open("DebBandPres2018-Google.txt", "w")
txt.write(response)
txt.close()

for result in response.results:
    print('Transcript: {}'.format(result.alternatives[0].transcript))