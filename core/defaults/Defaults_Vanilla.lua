local _, Memento = ...

Memento.defaults = {}

Memento.defaults["options"] = {
    profile = {
        options = {
            notification = true,
			statistic = false,
			ui = false,
			debug = false
		},
		events = {
			encounter = {
				victory = {
					party = true,
					raid = true,
					scenario = false,
					first = true,
					timer = 2
				},
				wipe = {
					party = true,
					raid = true,
					scenario = false,
					timer = 2
				},
			},
            levelUp = {
                active = true,
                timer = 5
            },
            death = {
                active = true,
                timer = 1
            },
			duel = {
                active = true,
                timer = 1
            },
			login = {
                active = false,
                timer = 5
			}
		}
    }
}

Memento.defaults["statistic"] = {
	char = {
		events = {
			encounter = {
				victory = {
					count = 0
				},
				wipe = {
					count = 0
				},
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
				count = 0
            }
		}
	},
    global = {
		events = {
			encounter = {
				victory = {
					count = 0
				},
				wipe = {
					count = 0
				},
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
				count = 0
            }
		}
    }
}
