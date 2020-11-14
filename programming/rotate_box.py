# Author : Naila Fadhilah Fithriah
# Date   : 13 November 2020
# Kulina - Data Analyst - Preliminary Test
# PROGRAMMING

def Solution(N, A, k):
    '''Rotate the box represented as a 1D Array A with length of N by 90 degrees every k times.'''        
    if (k == 0):
        arrSolution = A
    elif(k > 0):
        processedArray = sorted(A,reverse=1)
        if (k % 2 == 0):
            arrSolution = processedArray
        else:
            iteratorVal = processedArray[0]
            iteratorIdx = processedArray[0]
            arrSolution = [0] * processedArray[0]
            placeValue = 1
            for i in range(N):
                if iteratorVal != processedArray[(i+1) % N]:
                    if (i == N-1):
                        arrSolution[:iteratorIdx] = [placeValue] * iteratorVal
                    else:
                        arrSolution[iteratorIdx-(iteratorVal - processedArray[(i+1) % N]):iteratorIdx] = [placeValue] * (iteratorVal - processedArray[(i+1) % N])
                        iteratorIdx -= (iteratorVal - processedArray[(i+1) % N])
                        placeValue += 1
                        iteratorVal = processedArray[(i+1) % N]
                else:
                        placeValue += 1                
    else:
        print("k cannot be a negative number.")
        arrSolution = []

    return arrSolution

# MAIN
if __name__ == "__main__":
    print(Solution.__doc__)
    print()
    print("==== INPUT ====")
    A = input("Enter a list of food packages in a box separated by space: ").split()
    N = len(A)
    # Convert string to integer
    for i in range(N): 
        A[i] = int(float(A[i])) 
    k = int(input("Enter how many times will the box rotates: "))
    
    if k >= 0:
        print("==== OUTPUT ====")
        print("After the box rotated", k, "time(s), the position of the food package changes into: ")
    # Print array as an individual integers separated by space
    for i in Solution(N, A, k):
        print(i,"", end="")
    print()
