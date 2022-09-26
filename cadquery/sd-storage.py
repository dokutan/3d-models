#!/usr/bin/env python3
import cadquery as cq

# storage for SD and micro SD cards

# config
sd_slots = 12
micro_sd_slots = 2

def sd_storage(sd_slots, micro_sd_slots, chamfer=True):
    # constants
    height = 20
    border = 2
    slot_distance = 3.8
    sd_width = 25
    sd_depth = 2.6
    sd_height = height - 1
    micro_sd_width = 12
    micro_sd_depth = 1
    micro_sd_height = 8

    # base box
    base_width = sd_width + 2 * border
    base_sd_depth = sd_slots * sd_depth + (sd_slots - 1) * slot_distance
    base_micro_sd_depth = micro_sd_slots * micro_sd_depth + (micro_sd_slots - 1) * slot_distance
    base_depth = 2 * border + base_sd_depth + slot_distance + base_micro_sd_depth
    result = cq.Workplane("XY").box(base_width, base_depth, height)

    # make sd slots
    sd_slot = cq.Workplane("XY", origin=(0, -base_depth/2 + sd_depth/2 + border, (height - sd_height) / 2)).box(sd_width, sd_depth, sd_height)
    if chamfer:
        sd_slot = sd_slot.faces(">Z").workplane().transformed(rotate=cq.Vector(45, 0, 0)).box(sd_width, sd_depth * 1.2, sd_depth * 1.2)
    
    for i in range(0, sd_slots):
        result = result.cut(sd_slot.translate((0, i * (slot_distance + sd_depth), 0)))

    # make micro sd slots
    micro_sd_slot_1 = cq.Workplane("XY", origin=(base_width/2 - border - micro_sd_width/2, -base_depth/2 + micro_sd_depth/2 + border + slot_distance + base_sd_depth, (height - micro_sd_height) / 2)).box(micro_sd_width, micro_sd_depth, micro_sd_height)
    micro_sd_slot_2 = cq.Workplane("XY", origin=(-base_width/2 + border + micro_sd_width/2, -base_depth/2 + micro_sd_depth/2 + border + slot_distance + base_sd_depth, (height - micro_sd_height) / 2)).box(micro_sd_width, micro_sd_depth, micro_sd_height)
    if chamfer:
        micro_sd_slot_1 = micro_sd_slot_1.faces(">Z").workplane().transformed(rotate=cq.Vector(45, 0, 0)).box(micro_sd_width, micro_sd_depth * 1.5, micro_sd_depth * 1.5)
        micro_sd_slot_2 = micro_sd_slot_2.faces(">Z").workplane().transformed(rotate=cq.Vector(45, 0, 0)).box(micro_sd_width, micro_sd_depth * 1.5, micro_sd_depth * 1.5)
    micro_sd_slot = micro_sd_slot_1.union(micro_sd_slot_2)
    
    for i in range(0, micro_sd_slots):
        result = result.cut(micro_sd_slot.translate((0, i * (slot_distance + micro_sd_depth), 0)))

    print(f"outer dimensions (X×Y×Z): {base_width} × {base_depth} × {height}")

    return result

# export / show the model
result = sd_storage(sd_slots, micro_sd_slots)
cq.exporters.export(result, 'sd-storage.stl')

try:
    show(result)
except:
    pass
