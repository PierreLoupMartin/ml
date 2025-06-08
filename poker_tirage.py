import random

# --- Création du deck ---
valeurs = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
couleurs = ["♠", "♥", "♦", "♣"]
deck = [f"{v}{c}" for v in valeurs for c in couleurs]

# --- Choix du mode ---
while True:
    mode = input("🎲 Mode 1 joueur ou 2 joueurs ? (1/2) : ")
    if mode in ["1", "2"]:
        break
    print("❌ Choix invalide. Tape 1 ou 2.")

random.shuffle(deck)

# --- Tirage pour joueur 1 ---
main_j1 = [deck.pop() for _ in range(5)]
print("\n🧑 Joueur 1 :")
print(" | ".join(main_j1))

# --- Tirage pour joueur 2 ---
if mode == "2":
    main_j2 = [deck.pop() for _ in range(5)]
    print("\n🧑 Joueur 2 :")
    print(" | ".join(main_j2))

print("\n🂠 Bonne partie ! (Pas encore d’évaluation des mains 😄)")

