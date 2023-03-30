class_name TriggerEffect
extends Node


static func trigger_effect(effect,ranks,node):
	if OverallSituation.armsData["Triggereffect"][effect]["EffectType"] == "Bullet":
		var bullet = load(OverallSituation.armsData["Triggereffect"][effect]["BulletPath"]).instance()
		
		bullet.rotation = node.rotation 
		bullet.ranks = ranks
		bullet.age = node.age
		bullet.global_position = node.global_position 
		bullet.data = OverallSituation.armsData["Triggereffect"][effect]
		
		OverallSituation.root.add_child(bullet)
	pass
