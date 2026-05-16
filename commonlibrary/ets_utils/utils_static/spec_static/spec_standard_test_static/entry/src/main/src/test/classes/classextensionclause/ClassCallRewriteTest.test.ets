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
  name: string = "Generic Animal";

  introduce() {
    return `I'm ${this.name}`;
  }
}

class Dog extends Animal {
  name: string = "Dog";

  introduce() {
    return `I'm a ${this.name}`;
  }
}

class A {
  method(): string {
    return "Method from A";
  }
}

class B extends A {
  method(): string {
    return "Method from B";
  }
}

class C extends B {
  method(): string {
    return "Method from C";
  }
}

class B1 extends A {
  method(): string {
    return super.method() + " and B";
  }
}


export default function ClassCallRewriteTest() {
  describe('ClassCallRewriteTest', () => {
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
     * @tc.number    SUB_CLASS_CALL_REWRITETEST_0100
     * @tc.name      testClassCallRewrite0001
     * @tc.desc      Tests calling subclass rewrite methods through parent class references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassCallRewrite0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassCallRewrite0001';
      console.log(TAG + ' start');

      let animal: Animal = new Dog();
      let a = animal.introduce();
      let b = animal.name;

      expect(a).assertEqual("I'm a Dog");
      expect(b).assertEqual("Dog");
    });

    /**
     * @tc.number    SUB_CLASS_CALL_REWRITETEST_0200
     * @tc.name      testClassCallRewrite0002
     * @tc.desc      Tests calling subclass rewrite methods through parent class references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassCallRewrite0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassCallRewrite0002';
      console.log(TAG + ' start');

      let aInstance: A = new A();
      let a = aInstance.method();

      expect(a).assertEqual("Method from A");
    });

    /**
     * @tc.number    SUB_CLASS_CALL_REWRITETEST_0300
     * @tc.name      testClassCallRewrite0003
     * @tc.desc      Tests calling subclass rewrite methods through parent class references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassCallRewrite0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassCallRewrite0003';
      console.log(TAG + ' start');

      let bInstance: A = new B();
      let b = bInstance.method();
      expect(b).assertEqual("Method from B");
    });

    /**
     * @tc.number    SUB_CLASS_CALL_REWRITETEST_0400
     * @tc.name      testClassCallRewrite0004
     * @tc.desc      Tests calling subclass rewrite methods through parent class references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassCallRewrite0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassCallRewrite0004';
      console.log(TAG + ' start');

      let cInstance: A = new C();
      let c = cInstance.method();
      expect(c).assertEqual("Method from C");
    });

    /**
     * @tc.number    SUB_CLASS_CALL_REWRITETEST_0500
     * @tc.name      testClassCallRewrite0005
     * @tc.desc      Tests calling subclass rewrite methods through parent class references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassCallRewrite0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassCallRewrite0005';
      console.log(TAG + ' start');

      let bInstance: A = new B1();
      let b = bInstance.method();
      expect(b).assertEqual("Method from A and B");
    });


  })
}