#!/usr/local/bin/python

def solution(a):
    b = []
    for i in range(0,len(a)):
        row = []
        for j in range(len(a),0,-1):
            row.append(a[j-1][i])
        b.append(row)    
                       
    return b

# rotate 90 degrees clockwise
a = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
print(a," -> ",solution(a))
