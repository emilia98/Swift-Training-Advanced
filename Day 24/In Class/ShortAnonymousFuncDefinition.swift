let names = [ "Chris", "Alex", "Ewa", "Barry", "Daniella" ]

var sa = names.sorted(by: { s1, s2 in return s1 > s2 })
print(sa)

sa = names.sorted(by: { s1, s2 in s1 > s2 })
print(sa)

sa = names.sorted(by: { $0 > $1 })
print(sa)

sa = names.sorted { $0 > $1 }
print(sa)

sa = names.sorted(by: > )
print(sa)