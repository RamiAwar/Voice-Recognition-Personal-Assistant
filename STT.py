import speech_recognition as sr
import os

r = sr.Recognizer()
m = sr.Microphone()

file = open("data.txt", "w")

try:    
        with m as source: r.adjust_for_ambient_noise(source)
        os.system("mplayer pop.mp3")
        with m as source: audio = r.listen(source)
        os.system("mplayer note.mp3")

        try:
                value = r.recognize_google(audio)
                print("result:"+value)
                file.write(value)
        except sr.UnknownValueError:
                file.write("error")
        except sr.RequestError as e:
                file.write("error")
except KeyboardInterrupt:
        pass


