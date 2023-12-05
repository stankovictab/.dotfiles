# Ask user to input length of video
length = str(input("Enter the length of the video (in MM:SS or HH:MM:SS): "))
lengthAlreadyDone = str(input("Enter the length that's already been encoded (in MM:SS or HH:MM:SS): "))

# Check if length is in MM:SS or HH:MM:SS format, if so convert to seconds
def convertToSeconds(length):
    if ":" in length:
        length_parts = length.split(":")
        if len(length_parts) == 3: # HH:MM:SS format
            length = int(length_parts[0]) * 3600 + int(length_parts[1]) * 60 + int(length_parts[2])
        elif len(length_parts) == 2: # MM:SS format
            length = int(length_parts[0]) * 60 + int(length_parts[1])
    else:
        print("Time in incorrect format, exiting...")
        exit()
    return float(length)

length = convertToSeconds(length)
lengthAlreadyDone = convertToSeconds(lengthAlreadyDone)

length = length - lengthAlreadyDone

# Ask user to input the speed
speed = str(input("Enter the speed (eg. 0.06): "))

speed = float(speed)
speed = speed * 100

oneSecondIRLSpeed = 100 / speed

# Calculate the time it takes to encode the video

time = length * oneSecondIRLSpeed
time = time.__round__(2)

print("It will take " + str(time) + " seconds to encode the video.")
print("In minutes, that is " + str((time / 60).__round__(2)) + " minutes, or " + str(((time / 60) / 60).__round__(2)) + " hours.")
