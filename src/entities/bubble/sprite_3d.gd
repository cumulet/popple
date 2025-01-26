extends Sprite3D

@export var face1 : Texture2D
@export var face2 : Texture2D

func changeHover():
	texture = face2

func changeNormal():
	texture = face1
