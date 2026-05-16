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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

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

class Dog2 extends Animal {}

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


export default function ClassRewriteCallTest() {
  describe('ClassRewriteCallTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_CLASS_REWRITE_CALLTEST_0100
     * @tc.name      testClassRewriteCall0001
     * @tc.desc      Parent class reference points to child class object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriteCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriteCall0001';
      console.log(TAG + ' start');

      let myDog1 = new Dog();
      let myDog2 = new Dog();
      let sound = myDog1.speak();

      expect(sound).assertEqual('Woof!');
    });

    /**
     * @tc.number    SUB_CLASS_REWRITE_CALLTEST_0200
     * @tc.name      testClassRewriteCall0002
     * @tc.desc      Parent class reference points to child class object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriteCall0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriteCall0002';
      console.log(TAG + ' start');

      let myPet: Animal1 = new Cat();
      let sound = myPet.speak();
      expect(sound).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CLASS_REWRITE_CALLTEST_0300
     * @tc.name      testClassRewriteCall0003
     * @tc.desc      Parent class reference points to child class object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriteCall0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriteCall0003';
      console.log(TAG + ' start');

      let myPet: Animal2 = new Dog1();
      let sound = myPet.speak();
      expect(sound).assertEqual('Woof!');
    });

    /**
     * @tc.number    SUB_CLASS_REWRITE_CALLTEST_0400
     * @tc.name      testClassRewriteCall0004
     * @tc.desc      Parent class reference points to child class object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriteCall0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriteCall0004';
      console.log(TAG + ' start');

      let myDog = new Dog2();
      let sound = myDog.speak();

      expect(sound).assertEqual('Some generic animal sound');
    });

    /**
     * @tc.number    SUB_CLASS_REWRITE_CALLTEST_0500
     * @tc.name      testClassRewriteCall0005
     * @tc.desc      Parent class reference points to child class object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriteCall0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriteCall0005';
      console.log(TAG + ' start');

      let vehicle: Vehicle = new Car();
      let movement = vehicle.move();

      expect(movement).assertEqual('The car is moving on the road.');
    });


  })
}