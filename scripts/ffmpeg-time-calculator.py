# Ask user to input length of video
length = str(input("Enter the length of the video (in SS or MM:SS): "))

# Ask user to input the speed
speed = str(input("Enter the speed (eg. 0.06): "))

# Check if length is in MM:SS format, if so convert to seconds

if ":" in str(length):
    length = length.split(":")
    length = int(length[0]) * 60 + int(length[1])

length = float(length)

speed = float(speed)
speed = speed * 100

oneSecondIRLSpeed = 100 / speed

# Calculate the time it takes to encode the video

time = length * oneSecondIRLSpeed
time = time.__round__(2)

print("It will take " + str(time) + " seconds to encode the video.")
print("In minutes, that is " + str((time / 60).__round__(2)) + " minutes, or " + str(((time / 60) / 60).__round__(2)) + " hours.")
