local _, Memento = ...

Memento.defaults = {}

Memento.defaults["options-mainline"] = {
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
                criteria = {
                    active = false,
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
					scenario = true,
					first = true,
					timer = 2
                },
                wipe = {
					party = true,
					raid = true,
					scenario = true,
					timer = 2
                },
			},
            pvp = {
                duel = {
                    active = true,
                    timer = 1
                },
                arena = {
                    active = true,
                    timer = 3
                },
                battleground = {
                    active = true,
                    timer = 3
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
			login = {
                active = false,
                timer = 5
			}
		}
    }
}

Memento.defaults["statistic-mainline"] = {
	char = {
		events = {
            achievement = {
                personal = {
                    count = 0
                },
                criteria = {
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
            pvp = {
                duel = {
                    count = 0
                },
                arena = {
                    count = 0
                },
                battleground = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
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
                criteria = {
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
            pvp = {
                duel = {
                    count = 0
                },
                arena = {
                    count = 0
                },
                battleground = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			login = {
				count = 0
            }
		}
    }
}

Memento.defaults["options-cata"] = {
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
			pvp = {
                duel = {
                    active = true,
                    timer = 1
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
			login = {
                active = false,
                timer = 5
			}
		}
    }
}

Memento.defaults["statistic-cata"] = {
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
			pvp = {
                duel = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
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
			pvp = {
                duel = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			login = {
				count = 0
            }
		}
    }
}

Memento.defaults["options-vanilla"] = {
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
					first = true,
					timer = 2
				},
				wipe = {
					party = true,
					raid = true,
					timer = 2
				},
			},
			pvp = {
                duel = {
                    active = true,
                    timer = 1
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
			login = {
                active = false,
                timer = 5
			}
		}
    }
}

Memento.defaults["statistic-vanilla"] = {
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
			pvp = {
                duel = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
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
			pvp = {
                duel = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			login = {
				count = 0
            }
		}
    }
}
