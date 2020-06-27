import 'dart:math';

import 'package:flutter/material.dart';

class Bubbles extends StatefulWidget {
  final int amount;
  final Color color;
  final List<Bubble> bubbles;
  Bubbles({
    @required this.amount,
    @required this.color,
    @required this.bubbles,
  });
  @override
  BubblesState createState() => new BubblesState();
}

class BubblesState extends State<Bubbles> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Random random = new Random();

  void removeLast() {
    widget.bubbles.removeLast();
  }

  void addToParticlesList() {
    for (int i = 1; i <= widget.amount; i++) {
      // Added particle to particlesList
      widget.bubbles.add(
        new Bubble(
          color: widget.color,
          xCoor: random.nextDouble() * 400 + 10,
          yCoor: random.nextDouble() * 400 + 10,
          size: 10.0,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    // Add the point the PointLists
    addToParticlesList();

    // Init random direction to all the points
    for (var particle in widget.bubbles) {
      particle.getRandomDirection();
    }

    // Add listener
    animationController.addListener(() {
      setState(() {
        for (var particle in this.widget.bubbles) {
          particle.move();
        }
      });
    });
    // Repeat the animation
    animationController.repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Bubble.widgetHeight = MediaQuery.of(context).size.height;
    Bubble.widgetWidth = MediaQuery.of(context).size.width;
    return new CustomPaint(
      foregroundPainter: BubblesPainter(
        particlesList: widget.bubbles,
      ),
    );
  }
}

class Bubble {
  final Color color;
  double xCoor;
  double yCoor;
  final double size;
  double xDirection;
  double yDirection;
  static double widgetWidth;
  static double widgetHeight;
  static double connectDistance = 100.0;
  static double speed = 2.0;
  Random random = new Random();

  Bubble({
    this.color,
    this.xCoor,
    this.yCoor,
    this.size,
  });

  bool isNear(Bubble anotherParticle) {
    // Calculate the distance between two particles
    double distance = (this.xCoor - anotherParticle.xCoor) * (this.xCoor - anotherParticle.xCoor) +
        (this.yCoor - anotherParticle.yCoor) * (this.yCoor - anotherParticle.yCoor);

    if (sqrt(distance) <= connectDistance) {
      return true;
    }
    return false;
  }

  void getRandomDirection() {
    xDirection = random.nextDouble() * speed;
    yDirection = random.nextDouble() * speed;
  }

  void move() {
    // Make the particle bounce when it reaches the borders
    if (this.xCoor + this.xDirection > Bubble.widgetWidth || this.xCoor + this.xDirection < 0) {
      this.xDirection = this.xDirection * (-1);
    }
    if (this.yCoor + this.yDirection > Bubble.widgetHeight || this.yCoor + this.yDirection < 0) {
      this.yDirection = this.yDirection * (-1);
    }
    this.xCoor += this.xDirection;
    this.yCoor += this.yDirection;
  }
}

class BubblesPainter extends CustomPainter {
  final List<Bubble> particlesList;

  BubblesPainter({
    this.particlesList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint();
    line.strokeCap = StrokeCap.round;
    line.color = particlesList.isNotEmpty ? particlesList[0].color : Colors.transparent;

    // Draw all the particles
    for (var particle in particlesList) {
      line.strokeWidth = particle.size;
      Offset center = new Offset(particle.xCoor, particle.yCoor);
      line.style = PaintingStyle.fill;
      canvas.drawCircle(center, particle.size, line);
    }

    // Draw the connect line

    /*for (int i = 0; i < this.particlesList.length; i++) {
      for (int j = i + 1; j < this.particlesList.length; j++) {
        Particle particle = this.particlesList.elementAt(i);
        Particle anotherParticle = this.particlesList.elementAt(j);
        if (particle.isNear(anotherParticle)) {
          Offset firstParticle = new Offset(particle.xCoor, particle.yCoor);
          Offset secondParticle = new Offset(anotherParticle.xCoor, anotherParticle.yCoor);
          line.strokeWidth = 2.0;
          canvas.drawLine(firstParticle, secondParticle, line);
        }
      }
    }*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
