'use static'

/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


class Animal {
  speak(): string {
    return 'Some generic animal sound';
  }
}

class Dog extends Animal {
  speak(): string {
    return 'Woof!';
  }
}

class Animal1 {
  speak() {
    return 1;
  }
}

class Cat extends Animal1 {
  speak() {
    return 2;
  }
}

class Animal2 {
  speak() {
    return "Some animal sound";
  }
}

class Cat1 extends Animal2 {
  speak() {
    return "Meow";
  }
}

class Dog1 extends Animal2 {
  speak(): string {
    return 'Woof!';
  }
}

class Dog2 extends Animal {
}

class Vehicle {
  move() {
    return 'The vehicle is moving in a general way.';
  }
}

class Car extends Vehicle {
  move() {
    return 'The car is moving on the road.';
  }
}

export function testClassRewriteCall0001() {
  const TAG = 'testClassRewriteCall0001';

  let myDog1 = new Dog();
  let myDog2 = new Dog();
  let sound = myDog1.speak();

  if (sound !== 'Woof!') {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected Woof!');
  }
}

export function testClassRewriteCall0002() {
  const TAG = 'testClassRewriteCall0002';

  let myPet: Animal1 = new Cat();
  let sound = myPet.speak();
  if (sound !== 2) {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected 2');
  }
}

export function testClassRewriteCall0003() {
  const TAG = 'testClassRewriteCall0003';

  let myPet: Animal2 = new Dog1();
  let sound = myPet.speak();
  if (sound !== 'Woof!') {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected Woof!');
  }
}

export function testClassRewriteCall0004() {
  const TAG = 'testClassRewriteCall0004';

  let myDog = new Dog2();
  let sound = myDog.speak();

  if (sound !== 'Some generic animal sound') {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected Some generic animal sound');
  }
}

export function testClassRewriteCall0005() {
  const TAG = 'testClassRewriteCall0005';

  let vehicle: Vehicle = new Car();
  let movement = vehicle.move();

  if (movement !== 'The car is moving on the road.') {
    console.info(`${TAG} Task execution failed: movement: ${movement}`);
    throw new Error('movement check failed, expected The car is moving on the road.');
  }
}
