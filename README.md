# Quake Log Parser
This project is a simple but authoral Quake's games.log parser. 

## How to run
To run it, simply leave the log in the same folder as main.rb and while on the same folder on terminal, type:

````sh
ruby main.rb
````

## How it works?
As soon as the parser finds a line with "InitGame: ", it creates a new Game object.  
The following step is to search for lines with "killed", as long as there's still game left (indicated by "-----"" string)  
The lines with "killed" are parsed individually to find the killer, the killed and the method. These informations are sent and managed to game.rb, which also checks if the killer is or not the world itself.


## Practical example: 
For an example, the expected output for the simple log (ignore the timestamps):  
```
0:00 InitGame: 
6:08 Kill: 3 4 10: Isgalamido killed Zeh by MOD_RAILGUN
6:27 Kill: 6 5 1: Mal killed Dono da Bola by MOD_SHOTGUN
5:28 Kill: 6 7 6: Mal killed Assasinu Credi by MOD_ROCKET
5:32 Kill: 2 5 6: Oootsimo killed Dono da Bola by MOD_ROCKET
0:00 ------------------------------------------------------------
```
Would be:
```
game_1: {
    total_kills: 4
    players: ["Assasinu Credi", "Dono da Bola", "Isgalamido", "Mal", "Oootsimo", "Zeh"]
    kills: {
        "Assasinu Credi": 0
        "Dono da Bola": 0
        "Isgalamido": 1
        "Mal": 2
        "Oootsimo": 1
        "Zeh": 0
    }
    kills_by_means: {
        "MOD_ROCKET": 2
        "MOD_RAILGUN": 1
        "MOD_SHOTGUN": 1
    }
}
General Ranking:
Mal: 2
Isgalamido: 1
Oootsimo: 1
Assasinu Credi: 0
Dono da Bola: 0
Zeh: 0
```
