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
			achievement = {
                personal = {
                    active = true,
					exist = false,
                    timer = 2
                },
                guild = {
                    active = true,
                    timer = 2
                },
            },
			encounter = {
				victory = {
					party = true,
					raid = true,
					first = true,
					timer = 2
				},
				wipe = {
					party = true,
					raid = true,
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
			achievement = {
                personal = {
                    count = 0
                },
                guild = {
                    count = 0
                },
            },
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
			achievement = {
                personal = {
                    count = 0
                },
                guild = {
                    count = 0
                },
            },
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
