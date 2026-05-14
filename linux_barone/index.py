temperatura = int(input("Cuantos grados hace?\n"))

if temperatura < 10:
    print("Está bastante frio")
elif temperatura > 10 and temperatura < 15:
    print("Está fresco")
elif temperatura > 15 and temperatura < 20:
    print("Está templado")
elif temperatura > 20 and temperatura < 27:
    print("Esta caluroso")
else:
    print("Hace mucho calor")