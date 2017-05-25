import Foundation

/*

ORGANIZING YOUR SOLUTION

A good way to orgaize your code is to separate your code into the three sections - input, process, output – as much as possible.

The start of a solution is implemented below. Consider all the possible inputs. Can you finish the solution?

*/

/*

INPUT

Be sure that your implementation of this section discards all the possible bad inputs the user could provide.

Make use of your test plan and algorithm to ensure your code is complete.

*/
var inputToProcess : [Int] = [0,0,0]
var output = String()

// Loop until valid input is received
for i in 0...2 {
	while inputToProcess[i] == 0 {
		
		// Show the prompt
		if i == 0 {
			print("Enter day:")
		} else if i == 1{
			print("Enter the number of days in the month:")
		} else if i == 2{
			print("Enter the special day:")
		}
		// Get the user's input
		var input : String?
		input = readLine()
		
		// Use optional binding to see if the string can be unwrapped (to see if it is not nil)
		if let notNilInput = input {
			if let isAnInteger = Int(notNilInput) {
				if i == 0{
					if isAnInteger > 0 && isAnInteger < 8{
						inputToProcess[i] = isAnInteger
					}
				} else if i == 1{
					if isAnInteger > 27 && isAnInteger < 32{
						inputToProcess[i] = isAnInteger
					}
				} else if i == 2{
					if isAnInteger > 0 && isAnInteger <= inputToProcess[1]{
						inputToProcess[i] = isAnInteger
					}
				}
			}
			
			// You probably need to add additional checks to be sure the
			// input received is valid
			// Add checks as needed...
			
			// Save the input given, as we are certain it's what we are looking for now
			
		}
		
	}
}

/*

PROCESS

Here is where you implement the logic that solves the problem at hand.

Make use of your test plan and algorithm to ensure your code is complete.

*/

// Add 'process' code below....
output.append("Sun Mon Tue Wed Thr Fri Sat\n")
output.append("  ")
if inputToProcess[0] > 1{
	for i in 1...inputToProcess[0]-1{
		if i != inputToProcess[0]{
			output.append(" ")
		}
		output.append("   ")
	}
}
//output.append("a")
for i in 1...inputToProcess[1]{
	if (((inputToProcess[0]-2) + i ) % 7) == 0 && i != 1{
		output.append("\n")
		if (i<10){
			output.append("  ")
		} else {
			output.append(" ")
		}
	} else if (i<10 && i != 1){
		output.append("   ")
	} else if (i != 1){
		output.append("  ")
	}
	if i == inputToProcess[2]{
		output = output.substring(to: output.index(output.endIndex, offsetBy: -1))
		output.append("*")
		output.append(String(i))
	} else {
		output.append(String(i))
	}
}

/*

OUTPUT

Here is where you report the results of the 'process' section above.

Make use of your test plan and algorithm to ensure your code is complete.

*/

// Add 'output' code below... replace what is here as needed.
print(output)
