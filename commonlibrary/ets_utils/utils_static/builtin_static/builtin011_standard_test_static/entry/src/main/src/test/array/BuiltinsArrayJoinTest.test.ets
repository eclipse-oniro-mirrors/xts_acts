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

function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans;
}

interface Person {
  name: string;
  age: number;
}

interface GeneratedTypeLiteralInterface_1 {
  toString: () => string;
}

type MixedType = number | string | boolean | GeneratedTypeLiteralInterface_1;

export default function BuiltinsArrayJoinTest() : void{
  describe("BuiltinsArrayJoinTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsArrayJoinTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0100
     * @tc.desc    Verify join with string 'undefined' as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayJoinTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.join('undefined');

      expect(result).assertEqual('1undefined2undefined3undefined4undefined5');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0200
     * @tc.desc    Verify join with string 'null' as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.join('null');

      expect(result).assertEqual('1null2null3null4null5');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0300
     * @tc.desc    Verify join with empty string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.join('');

      expect(result).assertEqual('12345');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0400
     * @tc.desc    Verify join with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const separator = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~ ';

      const result = arr.join(separator);

      expect(result).assertEqual('1 !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~ 2 !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~ 3');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0500
     * @tc.desc    Verify join with ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      let asciiSeparator = '';
      for (let i = 32; i <= 126; i++) {
        asciiSeparator += String.fromCharCode(i);
      }

      const result = arr.join(asciiSeparator);

      expect(result).assertEqual('1' + asciiSeparator + '2' + asciiSeparator + '3');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0600
     * @tc.desc    Verify join with repeated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const separator = ' !!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~ ';

      const result = arr.join(separator);

      expect(result).assertEqual('1 !!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~ 2 !!""##$$%%&&\'\'(()))**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~ 3');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0700
     * @tc.desc    Verify join with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const separator = '\b\n\r\t\\\'\"\0';

      const result = arr.join(separator);

      expect(result).assertEqual('1' + separator + '2' + separator + '3');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0800
     * @tc.desc    Verify join with Unicode escape sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const separator = '\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\ude3c' +
        '\ud83d\udd27\ud83d\udc87\ud83e\udd3c\u200d\u2642\ufe0f\ud83d\udee2\ud83c\udc04\ud83c\udff4';

      const result = arr.join(separator);

      expect(result).assertEqual('1' + separator + '2' + separator + '3');
    });

    /**
     * @tc.name    builtinsArrayJoinTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_0900
     * @tc.desc    Verify join with illegal Unicode escape sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayJoinTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const separator = '\udc04\ud83d\udff4';

      const result = arr.join(separator);

      expect(result).assertEqual('1' + separator + '2' + separator + '3');
    });

    /**
     * @tc.name    builtinsArrayJoinTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_1000
     * @tc.desc    Verify join with keywords
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const keywords = ['0', 'NaN', ''];

      for (const keyword of keywords) {
        const result = arr.join(keyword);
        expect(result).assertEqual('1' + keyword + '2' + keyword + '3');
      }
    });

    /**
     * @tc.name    builtinsArrayJoinTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_1100
     * @tc.desc    Verify join with large string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayJoinTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const largeSeparator = init(1000);
      const startTime1 = Date.now();
      const result1 = arr.join(largeSeparator);
      const endTime1 = Date.now();
      const time1 = endTime1 - startTime1;

      const normalSeparator = ',';
      const startTime2 = Date.now();
      const result2 = arr.join(normalSeparator);
      const endTime2 = Date.now();
      const time2 = endTime2 - startTime2;

      expect(result1).assertEqual('1' + largeSeparator + '2' + largeSeparator + '3');
      expect(result2).assertEqual('1,2,3');

      console.log(`Large string separator time: ${time1}ms`);
      console.log(`Normal string separator time: ${time2}ms`);
    });

    /**
     * @tc.name    builtinsArrayJoinTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_1200
     * @tc.desc    Verify join with sliced string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayJoinTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      let str = '{k1:value1,k2:value2}';
      let result = str.substring(0, str.length - 2);

      for (let i = 0; i < 10; i++) {
        const joinResult = arr.join(result);
        expect(joinResult).assertEqual('1' + result + '2' + result + '3');
      }
    });

    /**
     * @tc.name    builtinsArrayJoinTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_1300
     * @tc.desc    Verify join with large string memory usage
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayJoinTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const largeStr = "a".repeat(1024);
      
      const result = arr.join(largeStr);
      expect(result).assertEqual('1' + largeStr + '2' + largeStr + '3');
    });

    /**
     * @tc.name    builtinsArrayJoinTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_1400
     * @tc.desc    Verify join with GC behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayJoinTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      let largeStr = "a".repeat(100000);

      const result = arr.join(largeStr);
      expect(result).assertEqual('1' + largeStr + '2' + largeStr + '3');

      largeStr = "";
    });

    /**
     * @tc.name    builtinsArrayJoinTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_1500
     * @tc.desc    Verify join with empty array (returns empty string)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayJoinTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.join();
      
      expect(result).assertEqual('');
    });

    /**
     * @tc.name    builtinsArrayJoinTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_JOIN_TEST_1600
     * @tc.desc    Verify join with array containing objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayJoinTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = Array.create<Person>(3, { name: '', age: 0 });
      arr[0] = { name: 'Alice', age: 30 };
      arr[1] = { name: 'Bob', age: 25 };
      arr[2] = { name: 'Charlie', age: 35 };

      const result = arr.join(',');

      expect(result).assertEqual('[object Object],[object Object],[object Object]');
    });

  })
}