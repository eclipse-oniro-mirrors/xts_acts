/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { myObject, sleep } from "../../testability/pages/Utils";

export default function builtinsReadonlyArrayReduceTest() {
  describe('BuiltinsReadonlyArrayReduceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0100
     * @tc.name BuiltinsReadonlyArrayReduceTest0100
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly number[] = [1, 2, 3];
      const sum = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 0);
      console.log(`${sum}`);
      expect(6).assertEqual(sum);
      Done();
    });
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0200
     * @tc.name BuiltinsReadonlyArrayReduceTest0200
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly number[] = [1, 2, 3];
      const sum = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      });
      console.log(`${sum}`);
      expect(6).assertEqual(sum);
      Done();
    });
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0300
     * @tc.name BuiltinsReadonlyArrayReduceTest0300
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly number[] = [];
      try {
        const result = numbers.reduce((accumulator, currentValue) => {
          return accumulator + currentValue;
        });
        console.log(`${result}`);
      } catch (error) {
        console.error(error.message);
        expect("out of range.").assertEqual(error.message);
      }
      ;
      Done();
    })
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0400
     * @tc.name BuiltinsReadonlyArrayReduceTest0400
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly number[] = [];
      const result = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 0);
      console.log(`${result}`);
      expect(0).assertEqual(result);
      Done();
    });
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0500
     * @tc.name BuiltinsReadonlyArrayReduceTest0500
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly (number | undefined)[] = [1, , 3];
      const result = numbers.reduce((accumulator, currentValue) => {
        return (accumulator !== undefined ? accumulator : 0) + (currentValue !== undefined ? currentValue : 0)
      }, 0);
      console.log(`${result}`);
      expect(4).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0600
     * @tc.name BuiltinsReadonlyArrayReduceTest0600
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly number[] = [5];
      const result = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 0);
      console.log(`${result}`);
      expect(5).assertEqual(result);
      Done();
    });
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0700
     * @tc.name BuiltinsReadonlyArrayReduceTest0700
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly (number | undefined)[] = [,];
      const result = numbers.reduce((accumulator, currentValue) => {
        return (accumulator !== undefined ? accumulator : 0) + (currentValue !== undefined ? currentValue : 0);
      }, 0);
      console.log(`${result}`);
      expect(0).assertEqual(result);
      Done();
    });
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0800
     * @tc.name BuiltinsReadonlyArrayReduceTest0800
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly number[][] = [[1, 2], [3, 4], [5, 6]];
      const result = numbers.reduce((accumulator, currentValue) => {
        return accumulator.concat(currentValue);
      }, []);
      console.log(`${result}`);
      const expected = "1,2,3,4,5,6";
      const actual = result.join(',');
      expect(expected).assertEqual(actual);
      Done();
    });
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_0900
     * @tc.name BuiltinsReadonlyArrayReduceTest0900
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly (number | undefined | null)[] = [null, undefined, 3];
      const result = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, '');
      console.log(`${result}`);
      expect("nullundefined3").assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_1000
     * @tc.name BuiltinsReadonlyArrayReduceTest1000
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly myObject[] = [{
        name: "hh", age: 10, like: [1, 2, 3, 4, 5]
      }];
      const result = numbers.reduce((accumulator, currentValue) => {
        const objStr = `name: ${currentValue.name}, age: ${currentValue.age}, like: [${currentValue.like.join(', ')}]`;
        return accumulator + objStr;
      }, '');
      console.log(`{result}`);
      const expected = "name: hh, age: 10, like: [1, 2, 3, 4, 5]";
      expect(expected).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_1100
     * @tc.name BuiltinsReadonlyArrayReduceTest1100
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly string[] = ['a', 'b', 'c', 'd'];
      const result = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, '');
      console.log(`${result}`);
      expect("abcd").assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_REDUCE_TEST_1200
     * @tc.name BuiltinsReadonlyArrayReduceTest1200
     * @tc.desc test Readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayReduceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: readonly number[] = [1, 2, 3];
      const result1 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, Math.floor(1.5));
      const result2 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, -0);
      const result3 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, Number.EPSILON);
      const result4 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, Number.MIN_VALUE);
      const result5 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, Number.MAX_VALUE);
      const result6 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, -Infinity);
      const result7 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, Infinity);
      const result8 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 123.456);
      const result9 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 0xcafebabe);
      const result10 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 0x0102);
      const result11 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 0x01020304);
      const result12 = numbers.reduce((accumulator, currentValue) => {
        return accumulator + currentValue;
      }, 0x3);
      console.log(`=====${result1}`);
      console.log(`=====${result2}`);
      console.log(`=====${result3}`);
      console.log(`=====${result4}`);
      console.log(`=====${result5}`);
      console.log(`=====${result6}`);
      console.log(`=====${result7}`);
      console.log(`=====${result8}`);
      console.log(`=====${result9}`);
      console.log(`=====${result10}`);
      console.log(`=====${result11}`);
      console.log(`=====${result12}`);
      expect(7).assertEqual(result1);
      expect(6).assertEqual(result2);
      expect(6).assertEqual(result3);
      expect(6).assertEqual(result4);
      expect(1.7976931348623157e+308).assertEqual(result5);
      expect(-Infinity).assertEqual(result6);
      expect(Infinity).assertEqual(result7);
      expect(129.45600000000002).assertEqual(result8);
      expect(3405691588).assertEqual(result9);
      expect(264).assertEqual(result10);
      expect(16909066).assertEqual(result11);
      expect(9).assertEqual(result12);
      Done();
    })
  })
}