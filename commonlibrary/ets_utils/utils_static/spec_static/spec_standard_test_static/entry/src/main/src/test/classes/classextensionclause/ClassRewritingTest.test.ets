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


export default function ClassRewritingTest() {
  describe('ClassRewritingTest', () => {
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
     * @tc.number    SUB_CLASS_REWRITINGTEST_0100
     * @tc.name      testClassRewriting0001
     * @tc.desc      The correctness of the call after the test method is rewritten
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriting0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriting0001';
      console.log(TAG + ' start');

      let myDog = new Dog();
      let sound = myDog.speak();

      expect(sound).assertEqual('Woof!');
    });

    /**
     * @tc.number    SUB_CLASS_REWRITINGTEST_0200
     * @tc.name      testClassRewriting0002
     * @tc.desc      The correctness of the call after the test method is rewritten
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriting0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriting0002';
      console.log(TAG + ' start');

      let myDog = new Dog1();
      let sound = myDog.speak();

      expect(sound).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CLASS_REWRITINGTEST_0300
     * @tc.name      testClassRewriting0003
     * @tc.desc      The correctness of the call after the test method is rewritten
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriting0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriting0003';
      console.log(TAG + ' start');

      let myDog = new Dog2();
      let sound = myDog.speak();

      expect(sound).assertEqual(2);

    });

    /**
     * @tc.number    SUB_CLASS_REWRITINGTEST_0400
     * @tc.name      testClassRewriting0004
     * @tc.desc      The correctness of the call after the test method is rewritten
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriting0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriting0004';
      console.log(TAG + ' start');

      let myDog = new Dog3();
      let sound = myDog.speak();

      expect(sound).assertEqual(false);
    });

    /**
     * @tc.number    SUB_CLASS_REWRITINGTEST_0500
     * @tc.name      testClassRewriting0005
     * @tc.desc      The correctness of the call after the test method is rewritten
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassRewriting0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassRewriting0005';
      console.log(TAG + ' start');

      let cat = new Cat();
      let result = cat.speak();
      let result1 = cat.speak();
      expect(result).assertEqual('Meow!');
    });


  })
}