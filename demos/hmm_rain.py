states = ('Rainy', 'Sunny')

observations = ('walk', 'shop', 'clean')
 
start_probability = {'Rainy': 0.6, 'Sunny': 0.4}
 
transition_probability = {
   'Rainy' : {'Rainy': 0.7, 'Sunny': 0.3},
   'Sunny' : {'Rainy': 0.4, 'Sunny': 0.6},
}
 
emission_probability = {
   'Rainy' : {'walk': 0.1, 'shop': 0.4, 'clean': 0.5},
   'Sunny' : {'walk': 0.6, 'shop': 0.3, 'clean': 0.1},
}

observations = ('clean', 'shop', 'walk', 'walk', 'shop', 'walk', 'shop', 'clean', 'clean')

# forward algorithm

alpha = {}

t = 0
z = observations[t]
print 't =',t
print 'z =',z
n = 0
for x in states:
    alpha[t,x] = start_probability[x] * emission_probability[x][z]
    n = n + alpha[t,x]

print '   alpha_%d = <%f, %f>' %(t,alpha[t,states[0]],alpha[t,states[1]])
print '       P_%d = <%.2f, %.2f>' %(t,alpha[t,states[0]]/n,alpha[t,states[1]]/n) 
if (alpha[t,states[0]] > alpha[t,states[1]]):
    print 'Predict =',states[0]
else:
    print 'Predict =',states[1]

for t in range(1,len(observations)):
    print
    print 't =',t
    z = observations[t]
    print 'z =',z
    n = 0 
    for x in states:
        s = 0
        for y in states:
            s = s + ( alpha[t-1,x] * transition_probability[y][x] )
        alpha[t,x] = emission_probability[x][z] * s
        n = n + alpha[t,x]
    print '   alpha_%d = <%f, %f>' %(t,alpha[t,states[0]],alpha[t,states[1]])
    print '       P_%d = <%.2f, %.2f>' %(t,alpha[t,states[0]]/n,alpha[t,states[1]]/n) 
    if (alpha[t,states[0]] > alpha[t,states[1]]):
        print 'Predict =',states[0]
    else:
        print 'Predict =',states[1]
