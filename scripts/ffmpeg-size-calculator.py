# Script used to calculate the size of a video file after compression using ffmpeg

lengthOriginal = input("Enter the length of the original video (in SS or MM:SS): ")
# Convert to seconds
if ":" in str(lengthOriginal):
    lengthOriginal = lengthOriginal.split(":")
    lengthOriginal = int(lengthOriginal[0]) * 60 + int(lengthOriginal[1])
lengthOriginal = float(lengthOriginal)

lengthCurrent = input("Enter the length of the current video (in SS or MM:SS) (from ffmpeg): ")
# Convert to seconds
if ":" in str(lengthCurrent):
    lengthCurrent = lengthCurrent.split(":")
    lengthCurrent = int(lengthCurrent[0]) * 60 + int(lengthCurrent[1])
lengthCurrent = float(lengthCurrent)

# Input original file size and convert to MB
originalFileSize = input("Enter original file size in MB or GB (eg 1.37GB): ")
if originalFileSize[-2:] == "GB":
    originalFileSize = float(originalFileSize[:-2]) * 1000
else:
    originalFileSize = float(originalFileSize[:-2])

# Input current file size and convert to MB
currentFileSize = input("Enter current file size in MB or GB (eg 27.29MB): ")
if currentFileSize[-2:] == "GB":
    currentFileSize = float(currentFileSize[:-2]) * 1000
else:
    currentFileSize = float(currentFileSize[:-2])

# Calculate the size of the original video per second
originalSizePerSecond = originalFileSize / lengthOriginal

# Calculate the size of the current video per second
currentSizePerSecond = currentFileSize / lengthCurrent

# Calculate the final size of the current video
finalSize = currentSizePerSecond * lengthOriginal

print("The final size of the video will be " + str(finalSize.__round__(2)) + " MB.")
