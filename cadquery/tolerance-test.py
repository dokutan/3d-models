#!/usr/bin/env python3
import cadquery as cq

def test_box(diameter, label):
    result = cq.Workplane("XY").box(10, 10, 10)
    result = result.faces(">Z").workplane().hole(diameter)
    result = result.faces(">X").workplane().center(-0.1, -5).text(label, 7, -0.4, font="DejaVu Sans")
    return result

def test_pin(diameter):
    result = cq.Workplane("XY").circle(diameter / 2).extrude(21).faces("<Z").circle(3).extrude(2)
    return result

def test_moving(diameter, label):
    outer = cq.Workplane("XY").box(diameter + 4, diameter + 4, 5)
    outer = outer.faces(">X").workplane().center(-0.1, -0).text(label, 5, -0.4, font="DejaVu Sans")
    inner = cq.Workplane("XY").circle(diameter / 2).extrude(10, both=True)
    return outer - inner

boxes = \
    test_box(3.0, ".0").translate((0, 0,  0)) | \
    test_box(3.1, ".1").translate((0, 15, 0)) | \
    test_box(3.2, ".2").translate((0, 30, 0)) | \
    test_box(3.3, ".3").translate((0, 45, 0)) | \
    test_box(3.4, ".4").translate((0, 60, 0)) | \
    test_box(3.5, ".5").translate((0, 75, 0))
cq.exporters.export(boxes, 'tolerance-test-1.stl')

pin = test_pin(3)
cq.exporters.export(pin, 'tolerance-test-2.stl')

try:
    show(boxes | pin.translate((-20, 0, 0)))
except:
    pass
