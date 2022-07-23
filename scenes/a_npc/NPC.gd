extends Node

var stay : float = rand_range( 50, 200)
var debtrate : float = .0
var money : float = rand_range( 200, 400)

func _on_Staypay_timeout():
	pay( stay + debtrate)

func pay( amount):
	if debtrate > stay:
		back_to_the_mines_with_you()
		return
	money -= amount
	if money < .0:
		debtrate = money / 20
		
	


func back_to_the_mines_with_you():
	pass
