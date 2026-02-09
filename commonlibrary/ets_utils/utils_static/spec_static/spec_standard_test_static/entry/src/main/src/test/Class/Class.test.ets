/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  value!: string;
  constructor(cond: boolean) {
    if (cond) {
      this.value = "init";
    }
  }
}

class ClosureDemo {
  captured!: string;
  constructor() {
    const fn = () => this.captured.length;
    this.captured = "value";
    fn();
  }
}

class ClosureError {
  captured!: string;
  constructor() {
    const fn = () => this.captured.length;
    fn();
  }
}
class Node {
  next!: Node;
}
class Base {
  f!: string
}
class Derived extends Base { }

class Base1 {
  f!: string
  constructor(name: string) {
    this.f = name
  }
}
class Base2 {
  g!: string
}

class EmptyClass { }
class Generic<T extends Object> {
  genericField!: T;
}
class UnionDemo {
  value!: string | number;
}

class C {
  prop!: string;
  getProp() {
    return this.prop;
  }
}

class AsyncDemo {
  payload!: string;
  constructor() {
    setTimeout(() => { this.payload = "done"; }, 100);
  }
}

class Static3 {
  data!: Object[];
  init() { this.data = []; }
}
class Parent {
  parentId!: string;
}
class Child extends Parent {
  childId!: number;
  constructor() {
    super();
    this.childId = 1;
  }
}
interface I{
    f:string
}

class Class_I implements I{
    f!:string
}
export default function ClassLateInitizationTest() {
  describe('ClassLateInitizationTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0100
     * @tc.name ClassLateInitizationTest001
     * @tc.desc test NullPointerError when accessing uninitialized class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const obj = new A(false);
        hilog.info(0x0000, 'ClassLateInitizationTest001', '%{public}s', '${obj.value}');
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0200
     * @tc.name ClassLateInitizationTest002
     * @tc.desc test closure capturing initialized vs uninitialized class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new ClosureDemo();
        new ClosureError();
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0300
     * @tc.name ClassLateInitizationTest003
     * @tc.desc test NullPointerError when accessing uninitialized nested class member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const node = new Node();
        node.next = new Node();
        node.next.next;
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0400
     * @tc.name ClassLateInitizationTest004
     * @tc.desc test NullPointerError when accessing uninitialized field in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let a: Base = new Derived();
        expect(a.f).assertEqual("aa");
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0500
     * @tc.name ClassLateInitizationTest005
     * @tc.desc test assignment and access of class member in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: Base = new Derived();
      a.f = "aa";
      expect(a.f).assertEqual("aa");
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0600
     * @tc.name ClassLateInitizationTest006
     * @tc.desc test initialized vs uninitialized class members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = new Base1("aa");
      expect(a.f).assertEqual("aa");
      try {
        let b = new Base2();
        expect(b.g).assertEqual("aa");
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0700
     * @tc.name ClassLateInitizationTest007
     * @tc.desc test ClassCastError when accessing uninitialized generic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const gen = new Generic<string>();
        hilog.info(0x0000, 'ClassLateInitizationTest007', '%{public}s', '${gen.genericField}');
      } catch (e) {
        expect(e instanceof ClassCastError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0800
     * @tc.name ClassLateInitizationTest008
     * @tc.desc test ClassCastError when accessing initialized generic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const gen = new Generic<string | EmptyClass>();
      try {
        hilog.info(0x0000, 'ClassLateInitizationTest008', '%{public}s', '${gen.genericField}');
      } catch (e) {
        expect(e instanceof ClassCastError).assertTrue();
      }
      gen.genericField = "1"
      expect(gen.genericField).assertEqual("1")
      gen.genericField = new EmptyClass()
      expect(gen.genericField instanceof EmptyClass).assertTrue();
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_0900
     * @tc.name ClassLateInitizationTest009
     * @tc.desc test NullPointerError when accessing missing property on object literal cast to class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let a: Base2 = {};
        expect(a.g).assertEqual("aa");
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1000
     * @tc.name ClassLateInitizationTest010
     * @tc.desc test access of property on object literal cast to class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: Base2 = { g: "aa" };
      expect(a.g).assertEqual("aa");
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1100
     * @tc.name ClassLateInitizationTest011
     * @tc.desc test NullPointerError when accessing method of uninitialized union field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const ud = new UnionDemo();
        ud.value.toString();
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
      // 单独测试正常情况
      const ud2 = new UnionDemo();
      ud2.value = 10;
      expect(ud2.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1200
     * @tc.name ClassLateInitizationTest012
     * @tc.desc test NullPointerError when accessing uninitialized field via getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        new C().getProp();
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1300
     * @tc.name ClassLateInitizationTest013
     * @tc.desc test assignment of fields in different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let y = new Base();
      y.f = "ab"
      expect(y.f).assertEqual("ab")

      let x = new Base2();
      x.g = '5'
      expect(x.g).assertEqual("5")
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1400
     * @tc.name ClassLateInitizationTest014
     * @tc.desc test NullPointerError when accessing field initialized asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const ad = new AsyncDemo();
        ad.payload;
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1500
     * @tc.name ClassLateInitizationTest015
     * @tc.desc test NullPointerError when accessing uninitialized array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const obj = new Static3();
        console.log(obj.data);
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1600
     * @tc.name ClassLateInitizationTest016
     * @tc.desc test NullPointerError when accessing uninitialized field via parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const child = new Child();
        child.parentId;
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CLASS_LATE_INITIZATION_1800
     * @tc.name ClassLateInitizationTest018
     * @tc.desc test NullPointerError when accessing uninitialized interface implementation field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ClassLateInitizationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = new Class_I()
      try {
        console.log(a.f);
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
      a.f = "1"
      expect(a.f).assertEqual("1")
    });

  });
}
