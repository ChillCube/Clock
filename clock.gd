extends Node
class_name Clock

@export var time_resource : ClockResource;
@export var second_length : float = 1;
var timer : Timer;

signal a_minute_passed
signal an_hour_passed
signal a_day_passed

func _ready() -> void:
	timer = Timer.new();
	timer.one_shot = false;
	timer.autostart = true;
	timer.wait_time = second_length;
	add_child(timer);
	timer.connect("timeout", _on_time_out)

func _on_time_out():
	time_resource.seconds += 1;
	if time_resource.seconds == 0:
		emit_signal("a_minute_passed");
		if time_resource.minutes == 0:
			emit_signal("an_hour_passed")
			if time_resource.hours == 0:
				emit_signal("a_day_passed")
