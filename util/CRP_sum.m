function q3 = CRP_sum(q1, q2)

q3 = ((q2 + q1) - cross(q2, q1))/(1 - dot(q2, q1));