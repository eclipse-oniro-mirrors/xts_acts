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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class TestClassTS {
  private _value: string | undefined = undefined;

  getValue(): string | undefined {
    return this._value;
  }

  setValue(value: string | undefined): void {
    this._value = value;
  }
}

class Chainer {
  private _value: string | undefined = undefined;

  setValue(value: string): Chainer {
    this._value = value;
    return this;
  }

  clearValue(): Chainer {
    this._value = undefined;
    return this;
  }

  getValue(): string | undefined {
    return this._value;
  }
}

interface TestInterface {
  required: string;
  optional?: string;
}

interface Inner {
  value?: string;
}

interface Nested {
  inner?: Inner;
}

interface TestObj {
  value: string;
  missing: undefined;
}

function processUndefined(param: string | undefined): string | undefined {
  return param;
}

function overloaded(param: string | number): string | number {
  return typeof param === 'string' ? param : param.toString();
}

function handleValue(param: string | null | undefined): number {
  if (param === null) {
    return 0;
  } else if (param === undefined) {
    return 1;
  } else {
    return param.length;
  }
}

function getType(value: string | number | boolean | object): string {
  if (typeof value === "undefined") {
    return "undefined";
  } else if (typeof value === "string") {
    return "string";
  } else if (typeof value === "number") {
    return "number";
  }
  return "other";
}

function fetchData(): Promise<string | undefined> {
  return new Promise<string | undefined>((resolve) => {
    setTimeout(() => {
      resolve(undefined);
    }, 0);
  });
}

function greet(name?: string): string {
  return `Hello, ${name !== undefined ? name : "World"}`;
}

function countDefinedItems(acc: number, item: string | undefined): number {
  return acc + (item !== undefined ? 1 : 0);
}
interface TestData {
  key1: string;
  key2: undefined;
  key3: string;
}
export default function UndefinedTypeSafetyTest() {
  describe('UndefinedTypeSafetyTest', (): void => {
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0100
     * @tc.name UndefinedTypeSafetyTest001
     * @tc.desc Test direct undefined literal passing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = processUndefined(undefined);
      expect(result1).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0200
     * @tc.name UndefinedTypeSafetyTest002
     * @tc.desc Test variable assigned to undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let myVar: string | undefined;
      myVar = undefined;
      const result = processUndefined(myVar);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0300
     * @tc.name UndefinedTypeSafetyTest003
     * @tc.desc Test union type parameter with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = overloaded("hello");
      expect(result1).assertEqual("hello");

      const result2 = overloaded(123);
      expect(result2).assertEqual("123");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0400
     * @tc.name UndefinedTypeSafetyTest004
     * @tc.desc Test interface with optional undefined properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj1: TestInterface = {
        required: "test"
      };

      expect(obj1.required).assertEqual("test");
      expect(obj1.optional).assertUndefined();

      const obj2: TestInterface = {
        required: "test",
        optional: "value"
      };

      expect(obj2.optional).assertEqual("value");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0500
     * @tc.name UndefinedTypeSafetyTest005
     * @tc.desc Test array with undefined elements iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (string | undefined)[] = ["hello", undefined, "world"];

      const results: (string | undefined)[] = [];
      for (const item of arr) {
        results.push(processUndefined(item));
      }

      expect(results[0]).assertEqual("hello");
      expect(results[1]).assertUndefined();
      expect(results[2]).assertEqual("world");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0600
     * @tc.name UndefinedTypeSafetyTest006
     * @tc.desc Test object literal with explicit undefined property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TestObj = {
        value: "test",
        missing: undefined,
      };

      expect(obj.value).assertEqual("test");
      expect(obj.missing).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0700
     * @tc.name UndefinedTypeSafetyTest007
     * @tc.desc Test conditional assignment of undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: string | undefined = "active";

      // Simulate random condition
      const useUndefined = true;
      if (useUndefined) {
        flag = undefined;
      }

      const result = processUndefined(flag);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0800
     * @tc.name UndefinedTypeSafetyTest008
     * @tc.desc Test class with private string | undefined property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testObj = new TestClassTS();
      expect(testObj.getValue()).assertUndefined();

      testObj.setValue("test");
      expect(testObj.getValue()).assertEqual("test");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_0900
     * @tc.name UndefinedTypeSafetyTest009
     * @tc.desc Test map function returning undefined conditionally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const mapped = arr.map(x => x % 2 === 0 ? undefined : x.toString());

      expect(mapped[0]).assertEqual("1");
      expect(mapped[1]).assertUndefined();
      expect(mapped[2]).assertEqual("3");
      expect(mapped[3]).assertUndefined();
      expect(mapped[4]).assertEqual("5");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1000
     * @tc.name UndefinedTypeSafetyTest010
     * @tc.desc test Promise returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const data = await fetchData();
      expect(data).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1100
     * @tc.name UndefinedTypeSafetyTest011
     * @tc.desc test null vs undefined in union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(handleValue(null)).assertEqual(0);
      expect(handleValue(undefined)).assertEqual(1);
      expect(handleValue("hello")).assertEqual(5);
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1200
     * @tc.name UndefinedTypeSafetyTest012
     * @tc.desc test filter function with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (string | undefined)[] = ["a", undefined, "b", undefined, "c"];
      const filtered = arr.filter(item => item !== undefined);

      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual("a");
      expect(filtered[1]).assertEqual("b");
      expect(filtered[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1300
     * @tc.name UndefinedTypeSafetyTest013
     * @tc.desc test reduce function with undefined in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (string | undefined)[] = ["a", undefined, "b"];
      const count = arr.reduce(countDefinedItems, 0);

      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1400
     * @tc.name UndefinedTypeSafetyTest014
     * @tc.desc test find function returning undefined when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.find(x => x > 10);

      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1500
     * @tc.name UndefinedTypeSafetyTest015
     * @tc.desc test optional chaining with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj1: Nested = {};
      const result1 = obj1.inner?.value;
      expect(result1).assertUndefined();

      const obj2: Nested = { inner: {} };
      const result2 = obj2.inner?.value;
      expect(result2).assertUndefined();

      const obj3: Nested = { inner: { value: "test" } };
      const result3 = obj3.inner?.value;
      expect(result3).assertEqual("test");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1700
     * @tc.name UndefinedTypeSafetyTest017
     * @tc.desc test optional parameter with undefined default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(greet()).assertEqual("Hello, World");
      expect(greet("Alice")).assertEqual("Hello, Alice");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_1900
     * @tc.name UndefinedTypeSafetyTest019
     * @tc.desc test Record type with undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const record: TestData = {
        key1: "value1",
        key2: undefined,
        key3: "value3"
      };

      expect(record.key1).assertEqual("value1");
      expect(record.key2).assertUndefined();
      expect(record.key3).assertEqual("value3");
    });

    /**
     * @tc.number SUB_UNDEFINED_TYPE_SAFETY_2000
     * @tc.name UndefinedTypeSafetyTest020
     * @tc.desc test method chaining returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedTypeSafetyTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const chainer = new Chainer();
      expect(chainer.getValue()).assertUndefined();

      chainer.setValue("test");
      expect(chainer.getValue()).assertEqual("test");

      chainer.clearValue();
      expect(chainer.getValue()).assertUndefined();
    });

  });
}
