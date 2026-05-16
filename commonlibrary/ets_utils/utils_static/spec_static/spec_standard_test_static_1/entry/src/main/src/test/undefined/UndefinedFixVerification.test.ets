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

// Define interfaces for type safety
interface InnerObject {
  value: string | undefined;
}

interface OuterObject {
  inner: InnerObject;
}

interface TestObject {
  value: string;
  missing: undefined;
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class TestClass1 {
  property: string | undefined = undefined;
}

class MyClass {
  comm: undefined = undefined;
  foo(receiveUndefined: (param: string | undefined) => string | undefined): string | undefined {
    return receiveUndefined(this.comm);
  }
}

class SourceClass {
  generate(): string | undefined {
    return undefined;
  }
}

class OriginalProblemSolution {
  private _comm: string | undefined = undefined;

  get comm(): string | undefined {
    return this._comm;
  }

  set comm(value: string | undefined) {
    this._comm = value;
  }

  fixedAaa(param: string | undefined): string | undefined {
    return param;
  }

  public testFixedVersion(): string | undefined {
    return this.fixedAaa(this.comm);
  }
}

class TestClass014 {
  private _value: string | undefined = undefined;

  constructor(optionalParam?: string) {
    if (optionalParam !== undefined) {
      this._value = optionalParam;
    }
  }

  getMaybeUndefined(): string | undefined {
    return this._value;
  }

  setValue(value: string | undefined): void {
    this._value = value;
  }
}

function receiveUndefined(param: string | undefined): string | undefined {
  return param;
}

function func2(param: undefined): void {
  expect(param).assertUndefined();
}

function handleValue(param: string | null | undefined): string {
  if (param === null) {
    return "null";
  } else if (param === undefined) {
    return "undefined";
  } else {
    return `string:${param}`;
  }
}

function conditionalReturn(flag: boolean): string | undefined {
  if (!flag) {
    return undefined;
  }
  return "value";
}

function processUndefined(param: string | undefined): string | undefined {
  return param;
}

function processWithDefault(param: string = "default"): string {
  return param;
}

function processOptional(param: string | undefined): string {
  return processWithDefault(param ?? "default");
}

export default function UndefinedFixVerificationTest() {
  describe('UndefinedFixVerificationTest', (): void => {
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
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0100
     * @tc.name UndefinedFixVerificationTest001
     * @tc.desc Test basic undefined parameter passing to function accepting string | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = receiveUndefined(undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0200
     * @tc.name UndefinedFixVerificationTest002
     * @tc.desc Test undefined passing from class property of type string | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj1 = new TestClass1();
      const result = receiveUndefined(obj1.property);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0300
     * @tc.name UndefinedFixVerificationTest003
     * @tc.desc Test undefined passing from class property initialized to undefined literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myInstance = new MyClass();
      const result = myInstance.foo(receiveUndefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0400
     * @tc.name UndefinedFixVerificationTest004
     * @tc.desc Test multiple contexts: passing undefined to different function signatures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source = new SourceClass();
      const result = source.generate();

      func2(undefined);
      expect(receiveUndefined(result)).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0600
     * @tc.name UndefinedFixVerificationTest006
     * @tc.desc Test undefined as default parameter value with optional union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = processOptional(undefined);
      expect(result).assertEqual("default");
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0700
     * @tc.name UndefinedFixVerificationTest007
     * @tc.desc Test nested object property access returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const outer: OuterObject = {
        inner: {
          value: undefined as string | undefined
        }
      };

      const result = outer.inner.value;
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0800
     * @tc.name UndefinedFixVerificationTest008
     * @tc.desc Test function returning undefined from conditional logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = conditionalReturn(false);
      expect(result1).assertUndefined();

      const result2 = conditionalReturn(true);
      expect(result2).assertEqual("value");
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_0900
     * @tc.name UndefinedFixVerificationTest009
     * @tc.desc Test original problem solution: getter/setter with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const solution = new OriginalProblemSolution();
      const result = solution.testFixedVersion();
      expect(result).assertUndefined();

      solution.comm = "test";
      const result2 = solution.testFixedVersion();
      expect(result2).assertEqual("test");
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_1000
     * @tc.name UndefinedFixVerificationTest010
     * @tc.desc Test object literal with explicit undefined property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TestObject = {
        value: "test",
        missing: undefined,
      };

      const result = processUndefined(obj.missing);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_1100
     * @tc.name UndefinedFixVerificationTest011
     * @tc.desc Test map function returning undefined for specific condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const mapped = arr.map(x => x === 2 ? undefined : x.toString());

      expect(mapped[0]).assertEqual("1");
      expect(mapped[1]).assertUndefined();
      expect(mapped[2]).assertEqual("3");
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_1200
     * @tc.name UndefinedFixVerificationTest012
     * @tc.desc Test union type with null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(handleValue(null)).assertEqual("null");
      expect(handleValue(undefined)).assertEqual("undefined");
      expect(handleValue("hello")).assertEqual("string:hello");
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_1300
     * @tc.name UndefinedFixVerificationTest013
     * @tc.desc Test tuple with undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tuple: [string, number | undefined] = ["test", undefined];

      const result = processUndefined(tuple[1] as string | undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_UNDEFINED_FIX_VERIFICATION_1400
     * @tc.name UndefinedFixVerificationTest014
     * @tc.desc Test class property type safety with string | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UndefinedFixVerificationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testObj = new TestClass014();
      expect(testObj.getMaybeUndefined()).assertUndefined();

      testObj.setValue("test");
      expect(testObj.getMaybeUndefined()).assertEqual("test");

      testObj.setValue(undefined);
      expect(testObj.getMaybeUndefined()).assertUndefined();

      const testObj2 = new TestClass014("initialized");
      expect(testObj2.getMaybeUndefined()).assertEqual("initialized");
    });

  });
}