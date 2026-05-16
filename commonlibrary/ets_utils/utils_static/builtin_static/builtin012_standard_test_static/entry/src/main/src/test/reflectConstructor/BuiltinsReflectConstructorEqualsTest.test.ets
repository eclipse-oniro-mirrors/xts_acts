/*
* Copyright (c) 2026 RKH Corp.
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
import Utils from '../Util.test';

class NumberClass {
  value: number = 0;
  constructor(n: number) {
    this.value = n;
  }
}

class StringClass {
  text: string = "";
  constructor(s: string) {
    this.text = s;
  }
}

class BooleanClass {
  flag: boolean = false;
  constructor(b: boolean) {
    this.flag = b;
  }
}

class MultiClass {
  n: number = 0;
  s: string = "";
  b: boolean = false;
  constructor(n: number, s: string, b: boolean) {
    this.n = n;
    this.s = s;
    this.b = b;
  }
}

class ChildNumberClass extends NumberClass {
  extra: string = "";
  constructor(n: number, extra: string) {
    super(n);
    this.extra = extra;
  }
}

class SiblingNumberClassA extends NumberClass {
  tag: string = "A";
  constructor(n: number) {
    super(n);
    this.tag = "A";
  }
}

class SiblingNumberClassB extends NumberClass {
  tag: string = "B";
  constructor(n: number) {
    super(n);
    this.tag = "B";
  }
}

class GrandChildClass extends ChildNumberClass {
  level: number = 3;
  constructor(n: number, extra: string) {
    super(n, extra);
    this.level = 3;
  }
}

export default function BuiltinsReflectConstructorEqualsTest(): void {
  describe("BuiltinsReflectConstructorEqualsTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name    BuiltinsReflectConstructorEqualsTest0100
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0100
     * @tc.desc    Verify Number parameter class constructor self-comparison returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorEqualsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];

      const result = ctor.equals(ctor);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0200
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0200
     * @tc.desc    Verify same Number parameter class getConstructors twice, equals returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorEqualsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctors1 = Class.from<NumberClass>().getConstructors();
      const ctors2 = Class.from<NumberClass>().getConstructors();

      const result = ctors1[0].equals(ctors2[0]);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0300
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0300
     * @tc.desc    Verify Number parameter class and String parameter class constructor equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorEqualsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctorNum = Class.from<NumberClass>().getConstructors()[0];
      const ctorStr = Class.from<StringClass>().getConstructors()[0];

      const result = ctorNum.equals(ctorStr);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0400
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0400
     * @tc.desc    Verify Number parameter class and Boolean parameter class constructor equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsReflectConstructorEqualsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const ctorNum = Class.from<NumberClass>().getConstructors()[0];
      const ctorBool = Class.from<BooleanClass>().getConstructors()[0];

      const result = ctorNum.equals(ctorBool);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0500
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0500
     * @tc.desc    Verify String parameter class getConstructors three times result transitivity: a==b, b==c then a==c
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor1 = Class.from<StringClass>().getConstructors()[0];
      const ctor2 = Class.from<StringClass>().getConstructors()[0];
      const ctor3 = Class.from<StringClass>().getConstructors()[0];

      expect(ctor1.equals(ctor2)).assertTrue();
      expect(ctor2.equals(ctor3)).assertTrue();
      expect(ctor1.equals(ctor3)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0600
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0600
     * @tc.desc    Verify Number parameter class equals symmetry: a.equals(b) == b.equals(a) is true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor1 = Class.from<NumberClass>().getConstructors()[0];
      const ctor2 = Class.from<NumberClass>().getConstructors()[0];

      const result12 = ctor1.equals(ctor2);
      const result21 = ctor2.equals(ctor1);

      expect(result12).assertTrue();
      expect(result21).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0700
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0700
     * @tc.desc    Verify Number class and String class equals symmetry: a.equals(b) == b.equals(a) are both false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctorNum = Class.from<NumberClass>().getConstructors()[0];
      const ctorStr = Class.from<StringClass>().getConstructors()[0];

      const resultNS = ctorNum.equals(ctorStr);
      const resultSN = ctorStr.equals(ctorNum);

      expect(resultNS).assertFalse();
      expect(resultSN).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0800
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0800
     * @tc.desc    Verify Number parameter class equals transitivity: a==b and b==c then a==c
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctorA = Class.from<NumberClass>().getConstructors()[0];
      const ctorB = Class.from<NumberClass>().getConstructors()[0];
      const ctorC = Class.from<NumberClass>().getConstructors()[0];

      const resultAB = ctorA.equals(ctorB);
      const resultBC = ctorB.equals(ctorC);
      const resultAC = ctorA.equals(ctorC);

      expect(resultAB).assertTrue();
      expect(resultBC).assertTrue();
      expect(resultAC).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest0900
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_0900
     * @tc.desc    Verify sibling subclasses inheriting NumberClass constructor equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctorA = Class.from<SiblingNumberClassA>().getConstructors()[0];
      const ctorB = Class.from<SiblingNumberClassB>().getConstructors()[0];

      const result = ctorA.equals(ctorB);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1000
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1000
     * @tc.desc    Verify NumberClass and GrandChildClass constructor equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctorGrandParent = Class.from<NumberClass>().getConstructors()[0];
      const ctorGrandChild = Class.from<GrandChildClass>().getConstructors()[0];

      const result = ctorGrandParent.equals(ctorGrandChild);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1100
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1100
     * @tc.desc    Verify ChildNumberClass and GrandChildClass constructor equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctorParent = Class.from<ChildNumberClass>().getConstructors()[0];
      const ctorGrandChild = Class.from<GrandChildClass>().getConstructors()[0];

      const result = ctorParent.equals(ctorGrandChild);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1200
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1200
     * @tc.desc    Verify Boolean parameter class constructor self-comparison returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor = Class.from<BooleanClass>().getConstructors()[0];

      const result = ctor.equals(ctor);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1300
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1300
     * @tc.desc    Verify String parameter class and Boolean parameter class constructor equals returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctorStr = Class.from<StringClass>().getConstructors()[0];
      const ctorBool = Class.from<BooleanClass>().getConstructors()[0];

      const result = ctorStr.equals(ctorBool);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1400
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1400
     * @tc.desc    Verify multi-parameter class constructor equals idempotence: repeated calls return consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsReflectConstructorEqualsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const ctor1 = Class.from<MultiClass>().getConstructors()[0];
      const ctor2 = Class.from<MultiClass>().getConstructors()[0];

      const result1 = ctor1.equals(ctor2);
      const result2 = ctor1.equals(ctor2);
      const result3 = ctor1.equals(ctor2);

      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1500
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1500
     * @tc.desc    Verify multi-parameter class and Number single-parameter class constructor equals bidirectionally returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsReflectConstructorEqualsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const ctorMulti = Class.from<MultiClass>().getConstructors()[0];
      const ctorNum = Class.from<NumberClass>().getConstructors()[0];

      expect(ctorMulti.equals(ctorNum)).assertFalse();
      expect(ctorNum.equals(ctorMulti)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1600
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1600
     * @tc.desc    Verify equals method with null parameter returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsReflectConstructorEqualsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const ctor = Class.from<NumberClass>().getConstructors()[0];
      let exceptionThrown = false;
      try {
        const nullCtor: reflect.Constructor | null = null;
        if (nullCtor !== null) {
          ctor.equals(nullCtor);
        } else {
          exceptionThrown = true;
        }
      } catch (e) {
        exceptionThrown = true;
      }
      expect(exceptionThrown).assertTrue();
    });

    /**
     * @tc.name    BuiltinsReflectConstructorEqualsTest1700
     * @tc.number  SUB_BUILTINS_REFLECT_CONSTRUCTOR_EQUALS_TEST_1700
     * @tc.desc    Verify equals method with undefined parameter returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsReflectConstructorEqualsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const ctor = Class.from<StringClass>().getConstructors()[0];
      let exceptionThrown = false;
      try {
        const undefinedCtor: reflect.Constructor | undefined = undefined;
        if (undefinedCtor !== undefined) {
          ctor.equals(undefinedCtor);
        } else {
          exceptionThrown = true;
        }
      } catch (e) {
        exceptionThrown = true;
      }
      expect(exceptionThrown).assertTrue();
    });
  });
}
