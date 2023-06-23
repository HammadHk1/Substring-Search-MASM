# Substring-Search-MASM
## Introduction
The given x86 assembly code is designed to search for a substring within a given string. It allows the user to input both the string and the substring and then performs a search operation to determine if the substring exists within the string. The code employs a loop to compare characters of the string and substring, incrementing the indices accordingly. It also keeps track of the count of substring occurrences. If the substring is found, the program displays a message indicating that it is a substring. Conversely, if the substring is not found, a different message is displayed. The code utilizes interrupts to interact with the user and terminates once the search operation is completed. Overall, this assembly program provides a basic implementation of substring searching functionality.
![image](https://github.com/HammadHk1/Substring-Search-MASM/assets/117303560/21db49cc-d870-4e6a-af4d-0a1d977cb79c)
## Flow of the code:
- The program starts by jumping to the main procedure.
- In the main procedure, the user is prompted to enter the string and substring.
- The string and substring are read from the user.
- The addresses of the string and substring are pushed onto the stack.
- The Search procedure is called to perform the substring search.
- The Search procedure checks for the existence of the substring in the string.
- If the substring is found, the program displays the "IS A SUBSTRING" message.
- If the substring is not found, the program displays the "IS NOT A SUBSTRING" message.
- The program terminates.
# Notes:
- This code assumes that the length of the string is less than or equal to 15 characters and the length of the substring is less than or equal to.
##  Execution:
You have Download MASM 8086 to execute this code. After Download link your Dosbox with Bin Folder of Masm and put Code.asm file bin and run on Dosbox.
Do following Task to Mount
```
mount c C:\path\to\directory
```
```
C:
```
```
masm Code.asm;
```
```
link filename.obj;
```
```
filename.exe
```  
