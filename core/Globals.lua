local addonName, Memento = ...

Memento.MEDIA_PATH = "Interface\\AddOns\\" .. addonName .. "\\media\\"

Memento.COLOR_NORMAL_FONT = "ffFFD200"
Memento.COLOR_WHITE_FONT = "ffFFFFFF"
Memento.COLOR_ORANGE_FONT = "ffFF8040"
Memento.COLOR_GOLD_FONT = "ffF2E699"

Memento.EVENT_ACHIEVEMENT_EARNED_PERSONAL = 1
Memento.EVENT_ACHIEVEMENT_CRITERIA_EARNED = 2
Memento.EVENT_ACHIEVEMENT_EARNED_GUILD = 3
Memento.EVENT_ENCOUNTER_END_VICTORY = 4
Memento.EVENT_ENCOUNTER_END_WIPE = 5
Memento.EVENT_PLAYER_LEVEL_UP = 6
Memento.EVENT_PLAYER_DEAD = 7
Memento.EVENT_DUEL_FINISHED = 8
Memento.EVENT_PLAYER_LOGIN = 9
