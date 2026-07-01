@abstract
class_name Weapon
extends Node2D


enum SymmetryAxis { X, Y }


@export var symmetry_axis := SymmetryAxis.X


@abstract func use() -> void

@abstract func stop_using() -> void
