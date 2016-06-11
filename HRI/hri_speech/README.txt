========================
     Text-To-Speech
========================

1. Installation

	sudo apt-get install speech-dispatcher

2. Usage

	python tts.py Hello! How are you?

    
========================
     Speech-To-Text
========================

1. Installation
	
	sudo apt-get install python-pyaudio flac

2. Add you API key in the Python file (line 93)
   See instructions below.  
   
3. Usage (*) 

	python google_interface.py

(*) there is a limit of 50 activations per day.


======================
    Google API key
======================

1. Join this group here: https://groups.google.com/a/chromium.org/forum/?fromgroups#!forum/chromium-dev
(choose not to receive mail, if you prefer)

2. Go to this link: https://cloud.google.com/console and create your own project.

3. Search for 'Speech' and Enable the Speech API (only 50 requests for each key).

4. Go to Credentials and create an API key (Browser key)

5. Use the generated key in your program.


For more information: http://www.chromium.org/developers/how-tos/api-keys

