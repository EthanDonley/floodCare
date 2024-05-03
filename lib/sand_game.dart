import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(
    GameWidget(
      game: FallingSandGame(),
    ),
  );
}

class FallingSandGame extends FlameGame with TapDetector {
  final List<Sand> sands = [];

  @override
  Future<void> onLoad() async {
    // Initialize your game here
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    addSand(info.eventPosition.global);
  }

  void addSand(Vector2 position) {
    final sand = Sand(position, this);
    add(sand);
    sands.add(sand);
  }
}

class Sand extends PositionComponent {
  static final paint = Paint()..color = Color(0xFFFFD700); // Gold color
  final double speed = 200; // Pixels per second
  final FallingSandGame game;
  bool isFalling = true;

  Sand(Vector2 position, this.game) : super(position: position, size: Vector2.all(5));

  @override
  void update(double dt) {
    super.update(dt);
    if (isFalling) {
      position.y += speed * dt;
      checkForCollisions();
    }

    // Stop sand if it reaches the bottom of the game area or stops falling
    if (position.y + size.y >= 200 || !isFalling) {
      isFalling = false;
      position.y = min(position.y, 200 - size.y);
    }
  }

  void checkForCollisions() {
    for (final component in game.sands) {
      if (component != this && toRect().overlaps(component.toRect())) {
        resolveCollision(component);
        break;  // Stop checking after finding the first collision
      }
    }
  }

  void resolveCollision(Sand other) {
    isFalling = false;
    position.y = other.position.y - size.y;  // Adjust the position to sit on top of the other sand
    // Try moving left or right if possible
    if (canMove(-1)) {
      position.x -= size.x;
      isFalling = true;
    } else if (canMove(1)) {
      position.x += size.x;
      isFalling = true;
    }
  }

  bool canMove(int direction) {
    final testPosition = Vector2(position.x + direction * size.x, position.y + size.y);
    final testRect = Rect.fromLTWH(testPosition.x, testPosition.y, size.x, size.y);
    for (final component in game.sands) {
      if (component != this && testRect.overlaps(component.toRect())) {
        return false;
      }
    }
    return testPosition.x >= 0 && testPosition.x + size.x <= game.size.x;  // Ensure within game bounds
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(toRect(), paint);
  }
}
