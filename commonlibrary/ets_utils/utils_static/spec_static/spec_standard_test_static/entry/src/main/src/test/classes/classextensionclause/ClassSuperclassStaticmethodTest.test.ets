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

class Parent {
  static staticMethod(): string {
    return "Parent static method";
  }
}

class Child extends Parent {
  static callParentStaticMethod(): string {
    return Parent.staticMethod();
  }
}

class Child1 extends Parent {
  static staticMethod(): string {
    return "Child static method calling " + Parent.staticMethod();
  }
}

class Child2 extends Parent {
  callParentStaticMethod(): string {
    return Parent.staticMethod();
  }
}

class Parent1 {
  static staticProperty: string;

  static {
    Parent1.staticProperty = "Parent static property";
  }

  static staticMethod(): string {
    return Parent1.staticProperty;
  }
}

class Child3 extends Parent1 {
  static callParentStaticMethod(): string {
    return Parent1.staticMethod();
  }
}

class Child4 extends Parent {
  static childStaticProperty: string = "Child static property";

  static staticMethod(): string {
    return Child4.childStaticProperty;
  }

  static callParentStaticMethod(): string {
    return Child4.staticMethod();
  }
}

class Parent2 {
  static staticMethod(count: number): string {
    if (count <= 0) {
      return "Parent";
    }
    return "Parent static " + Parent2.staticMethod(count - 1);
  }
}

class Child5 extends Parent2 {
  static callParentStaticMethod(): string {
    return Parent2.staticMethod(2);
  }
}


export default function ClassSuperclassStaticmethodTest() {
  describe('ClassSuperclassStaticmethodTest', () => {
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
     * @tc.number    SUB_CLASS_SUPERCLASS_STATICMETHODTEST_0100
     * @tc.name      testClassSuperclassStaticmethod0001
     * @tc.desc      A subclass directly calls a static method of its superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassStaticmethod0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassStaticmethod0001';
      console.log(TAG + ' start');

      expect(Child.callParentStaticMethod()).assertEqual("Parent static method");
    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_STATICMETHODTEST_0200
     * @tc.name      testClassSuperclassStaticmethod0002
     * @tc.desc      A subclass overrides a static method of its superclass and calls the superclass's static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassStaticmethod0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassStaticmethod0002';
      console.log(TAG + ' start');

      expect(Child1.staticMethod()).assertEqual("Child static method calling Parent static method");
    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_STATICMETHODTEST_0300
     * @tc.name      testClassSuperclassStaticmethod0003
     * @tc.desc      A subclass overrides a static method of its superclass and calls the superclass's static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassStaticmethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassStaticmethod0003';
      console.log(TAG + ' start');

      const childInstance = new Child2();
      expect(childInstance.callParentStaticMethod()).assertEqual("Parent static method");
    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_STATICMETHODTEST_0400
     * @tc.name      testClassSuperclassStaticmethod0004
     * @tc.desc      A subclass calls a static method of its superclass, and the superclass method returns a static
     * property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassStaticmethod0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassStaticmethod0004';
      console.log(TAG + ' start');

      const childInstance = new Child3();
      expect(Child3.callParentStaticMethod()).assertEqual("Parent static property");
    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_STATICMETHODTEST_0500
     * @tc.name      testClassSuperclassStaticmethod0005
     * @tc.desc      A subclass calls a static method of its superclass, and the superclass method
     * depends on child static properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassStaticmethod0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassStaticmethod0005';
      console.log(TAG + ' start');

      expect(Child4.callParentStaticMethod()).assertEqual("Child static property");
    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_STATICMETHODTEST_0600
     * @tc.name      testClassSuperclassStaticmethod0006
     * @tc.desc      In multi - level inheritance, a subclass calls a static method of its grand - parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassStaticmethod0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassStaticmethod0006';
      console.log(TAG + ' start');

      const result = Child5.callParentStaticMethod();
      expect(result).assertEqual("Parent static Parent static Parent");
    });


  })
}