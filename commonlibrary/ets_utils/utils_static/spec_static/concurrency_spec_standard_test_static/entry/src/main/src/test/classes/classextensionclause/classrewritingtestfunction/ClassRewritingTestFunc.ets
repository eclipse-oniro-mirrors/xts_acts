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
  speak(): int {
    return 10;
  }
}

class Dog1 extends Animal1 {
  speak(): int {
    return 20;
  }
}


class Animal2 {
  speak(): number {
    return 1;
  }
}

class Dog2 extends Animal2 {
  speak(): number {
    return 2;
  }
}

class Animal3 {
  speak(): boolean {
    return true;
  }
}

class Dog3 extends Animal3 {
  speak(): boolean {
    return false;
  }
}

class Animal4 {
  speak(): string {
    return 'Some generic animal sound';
  }
}

class Cat extends Animal4 {
  speak(): string {
    return 'Meow!';
  }
}

export function testClassRewriting0001() {
  const TAG = 'testClassRewriting0001';

  let myDog = new Dog();
  let sound = myDog.speak();

  if (sound !== 'Woof!') {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected Woof!');
  }
}

export function testClassRewriting0002() {
  const TAG = 'testClassRewriting0002';

  let myDog = new Dog1();
  let sound = myDog.speak();

  if (sound !== 20) {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected 20');
  }
}

export function testClassRewriting0003() {
  const TAG = 'testClassRewriting0003';

  let myDog = new Dog2();
  let sound = myDog.speak();

  if (sound !== 2) {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected 2');
  }
}

export function testClassRewriting0004() {
  const TAG = 'testClassRewriting0004';

  let myDog = new Dog3();
  let sound = myDog.speak();

  if (sound !== false) {
    console.info(`${TAG} Task execution failed: sound: ${sound}`);
    throw new Error('sound check failed, expected false');
  }
}

export function testClassRewriting0005() {
  const TAG = 'testClassRewriting0005';

  let cat = new Cat();
  let result = cat.speak();
  let result1 = cat.speak();
  if (result !== 'Meow!') {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Meow!');
  }
}
