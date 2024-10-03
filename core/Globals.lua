local addonName, Memento = ...

Memento.MEDIA_PATH = "Interface\\AddOns\\" .. addonName .. "\\media\\"

Memento.COLOR_NORMAL_FONT = "ffffd200"
Memento.COLOR_WHITE_FONT = "ffffffff"
Memento.COLOR_ORANGE_FONT = "ffff8040"
Memento.COLOR_GOLD_FONT = "fff2e699"

Memento.EVENT_ACHIEVEMENT_EARNED_PERSONAL = 1
Memento.EVENT_ACHIEVEMENT_EARNED_GUILD = 2
Memento.EVENT_ENCOUNTER_END_VICTORY = 3
Memento.EVENT_ENCOUNTER_END_WIPE = 4
Memento.EVENT_PLAYER_LEVEL_UP = 5
Memento.EVENT_PLAYER_DEAD = 6
Memento.EVENT_DUEL_FINISHED = 7
Memento.EVENT_PLAYER_LOGIN = 8
