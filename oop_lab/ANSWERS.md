# CS442 MAD Lab Week 5 — Reflection Answers

**Name:** Muhammad Rayyan Bhatti

**Roll Number:** 04072312024

## Q1. What can a subclass using extends use for free that a class using implements has to write itself?

Using `extends`, a child class inherits the parent's fields and implemented methods. Using `implements`, the class must provide the required members itself.

## Q2. Book and Dvd both use Renewable. When would you pick a mixin, and when an abstract parent class?

I would use a mixin to share behavior between selected classes, such as renewal. I would use an abstract parent class when related classes share common properties and required methods.

## Q3. Why must you override hashCode whenever you override ==?

Equal objects should have the same hash code. This allows Sets and Maps to handle equal objects correctly.

## Q4. An extension method on String and a subclass of String both add behaviour. Why does Dart let you write the first one but not the second?

An extension adds useful methods to String without changing the original class. Dart does not allow String to be subclassed in this way, so extensions are a suitable alternative.