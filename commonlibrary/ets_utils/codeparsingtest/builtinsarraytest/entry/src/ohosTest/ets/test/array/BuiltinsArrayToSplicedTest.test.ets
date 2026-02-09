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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { SpliceBoolean, SpliceNumber, SpliceObj, SpliceString } from "../../testability/pages/DataFlg";
import { toSplicedRes } from "../../testability/pages/JsMethodTest";
import { sleep } from "../../testability/pages/Utils";

export default function builtinsArrayToSplicedTest() {
  describe('BuiltinsArrayToSplicedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   builtinsArrayToSplicedTest1001
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0100
     * @tc.desc   Test basic splice with replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayToSplicedTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(toSplicedRes([1, 2, 3, 4, 5], 2, 2, 'a', 'b'))
        .assertDeepEquals([1, 2, 'a', 'b', 5]);
      expect(toSplicedRes([1, 2, 3, 4, 5], 2, -1, 'a', 'b'))
        .assertDeepEquals([1, 2, "a", "b", 3, 4, 5]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1002
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0200
     * @tc.desc   Test insertion at beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([2, 3, 4], 0, 0, 1))
        .assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1003
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0300
     * @tc.desc   Test insertion beyond array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2], 2, 0, 3))
        .assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1004
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0400
     * @tc.desc   Test empty array insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([], 0, 0, 1))
        .assertDeepEquals([1]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1005
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0500
     * @tc.desc   Handle sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, , 3], 1, 1, 2))
        .assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1006
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0600
     * @tc.desc   Insert undefined/null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2, 3, 4, 5], -2, 1))
        .assertDeepEquals([1, 2, 3, 5]);
      expect(toSplicedRes([1, 2, 3, 4, 5], 1, 0, undefined))
        .assertDeepEquals([1, undefined, 2, 3, 4, 5]);
      expect(toSplicedRes([1, 2, 3, 4, 5], 1, 0, null))
        .assertDeepEquals([1, null, 2, 3, 4, 5]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1007
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0700
     * @tc.desc   Insert number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2, 3], 0, 3))
        .assertDeepEquals([]);
      expect(toSplicedRes([1, 2, 3], 1, 0, 'a', 'b'))
        .assertDeepEquals([1, 'a', 'b', 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1008
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0800
     * @tc.desc   Insert string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSplicedRes([1, 2, 3], 1, 0, 'a', 'b'))
        .assertDeepEquals([1, 'a', 'b', 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1009
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_0900
     * @tc.desc   Handle special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testData: SpliceString[] = [
        {
          start: 1,
          deleteCount: 0,
          items: ["!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"],
          expected: ['a', "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~", 'b'],
          description: 'ASCII特殊字符插入'
        },
        {
          start: 0,
          deleteCount: 1,
          items: [undefined],
          expected: [undefined, 'b'],
          description: 'Undefined值替换'
        },
        {
          start: 2,
          deleteCount: 0,
          items: [null],
          expected: ['a', 'b', null],
          description: '末尾插入null'
        },
        {
          start: 1,
          deleteCount: 0,
          items: [""],
          expected: ['a', '', 'b'],
          description: '空字符串插入'
        },
        {
          start: 0,
          deleteCount: 0,
          items: ["😊"],
          expected: ["😊", 'a', 'b'],
          description: '表情符号头部插入'
        },
        {
          start: 1,
          deleteCount: 1,
          items: ["\uD83D\uDE00"], // 😀
          expected: ['a', "\uD83D\uDE00"],
          description: '有效Unicode代理对替换'
        },
        {
          start: 1,
          deleteCount: 0,
          items: ["\uDC04\uD83D\uDFF4"],
          expected: ['a', "\uDC04\uD83D\uDFF4", 'b'],
          description: '非法代理组合插入'
        },
        {
          start: 0,
          deleteCount: 0,
          items: ["\a\b\f\n\r\t\v"],
          expected: ["\a\b\f\n\r\t\v", 'a', 'b'],
          description: '控制字符插入'
        },
        {
          start: 2,
          deleteCount: 0,
          items: ["\\\'\"\?\0"],
          expected: ['a', 'b', "\\'\"?\0"],
          description: '转义符号尾部插入'
        },
        {
          start: 0,
          deleteCount: 2,
          items: ["\x41\u0042"],
          expected: ["AB"],
          description: '十六进制/Unicode转义替换'
        },
      ];
      testData.forEach((item, index) => {
        try {
          const original = ['a', 'b'];
          expect(toSplicedRes(original, item.start, item.deleteCount, ...item.items)).assertDeepEquals(item.expected);
          expect(original).assertDeepEquals(['a', 'b']);
        } catch (e) {
          throw new Error(`用例#${index + 1} [${e.description}] 失败: ${e.message}\n` +
            `参数: start=${e.start}, deleteCount=${e.deleteCount}, items=${JSON.stringify(e.items)}`);
        }
      });
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1010
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_1000
     * @tc.desc   Test number handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numberTestData: SpliceNumber[] = [
        {
          start: 1,
          deleteCount: 0,
          items: [Math.floor(1.5)], // 1
          expected: ['a', 1, 'b'],
          description: '插入Math.floor结果'
        },
        {
          start: 0,
          deleteCount: 1,
          items: [0, -0],
          expected: [0, -0, 'b'],
          description: '替换0和-0值'
        },
        {
          start: 2,
          deleteCount: 0,
          items: [NaN],
          expected: ['a', 'b', NaN],
          description: '尾部插入NaN'
        },
        {
          start: 1,
          deleteCount: 1,
          items: [Infinity, -Infinity],
          expected: ['a', Infinity, -Infinity],
          description: '替换无限值'
        },
        {
          start: 0,
          deleteCount: 0,
          items: [Number.EPSILON],
          expected: [Number.EPSILON, 'a', 'b'],
          description: '头部插入EPSILON'
        },
        {
          start: 1,
          deleteCount: 0,
          items: [Number.MIN_VALUE],
          expected: ['a', Number.MIN_VALUE, 'b'],
          description: '插入最小正数'
        },
        {
          start: 2,
          deleteCount: 1,
          items: [Number.MAX_VALUE],
          expected: ['a', 'b', Number.MAX_VALUE],
          description: '替换为最大数值'
        },
        {
          start: 1,
          deleteCount: 0,
          items: [0xCAFEBABE],
          expected: ['a', 0xCAFEBABE, 'b'],
          description: '十六进制大数插入'
        },
        {
          start: 0,
          deleteCount: 2,
          items: [0x01020304],
          expected: [0x01020304],
          description: '替换为多字节十六进制值'
        },
        {
          start: 1,
          deleteCount: 0,
          items: [0o777],
          expected: ['a', 0o777, 'b'],
          description: '八进制数插入'
        }
      ];
      numberTestData.forEach((item, index) => {
        try {
          const original = ['a', 'b'];
          const result: Object[] = toSplicedRes(original, item.start, item.deleteCount, ...item.items);
          if (item.items.includes(NaN)) {
            expect(result.length).assertEqual(item.expected.length);
            expect(result[2]).assertNaN();
          } else {
            expect(result).assertDeepEquals(item.expected);
          }
          expect(original).assertDeepEquals(['a', 'b']);
        } catch (e) {
          throw new Error(`数值用例#${index + 1} [${item.description}] 失败: ${e.message}\n` +
            `参数: start=${item.start}, deleteCount=${item.deleteCount}, items=${JSON.stringify(item.items)}`);
        }
      });
    });

    /**
     * @tc.name   builtinsArrayToSplicedTest1011
     * @tc.number SUB_BUILTINS_ARRAY_TOSPLICED_TEST_1100
     * @tc.desc   Test boolean handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSplicedTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const booleanTestData: SpliceBoolean[] = [
        {
          start: 1,
          deleteCount: 0,
          items: [true],
          expected: ['a', true, 'b'],
          description: '中间插入true'
        },
        {
          start: 0,
          deleteCount: 1,
          items: [false],
          expected: [false, 'b'],
          description: '头部替换为false'
        },
        {
          start: 2,
          deleteCount: 0,
          items: [!0],
          expected: ['a', 'b', true],
          description: '尾部插入!0结果'
        },
        {
          start: 1,
          deleteCount: 1,
          items: [!'s'],
          expected: ['a', false],
          description: '替换为!string结果'
        },
        {
          start: 1,
          deleteCount: 0,
          items: [Boolean(NaN)],
          expected: ['a', false, 'b'],
          description: '中间插入NaN'
        },
        {
          start: 0,
          deleteCount: 2,
          items: [!!NaN],
          expected: [false],
          description: '双非NaN转布尔'
        }
      ];
      booleanTestData.forEach((item, index) => {
        try {
          const original = ['a', 'b'];
          const result: Object[] = toSplicedRes(original, item.start, item.deleteCount, ...item.items);
          if (item.items.some(x => typeof x === 'number' && isNaN(x))) {
            const nanIndex = item.expected.findIndex(x => typeof x === 'number' && isNaN(x));
            expect(result[nanIndex]).assertNaN();
            const filteredResult = result.filter((_, i) => i !== nanIndex);
            const filteredExpected = item.expected.filter((_, i) => i !== nanIndex);
            expect(filteredResult).assertDeepEquals(filteredExpected);
          } else {
            expect(result).assertDeepEquals(item.expected);
          }
          expect(original).assertDeepEquals(['a', 'b']);
        } catch (e) {
          throw new Error(`布尔用例#${index + 1} [${item.description}] 失败: ${e.message}\n` +
            `参数: start=${item.start}, deleteCount=${item.deleteCount}, items=${JSON.stringify(item.items)}`);
        }
      });
      const complexCase: SpliceObj = {
        start: 1,
        deleteCount: 0,
        items: [true, false, NaN],
        expected: ['a', true, false, NaN, 'b'],
        description: '混合插入布尔和NaN'
      };
      try {
        const original = ['a', 'b'];
        const result: Object[] =
          toSplicedRes(original, complexCase.start, complexCase.deleteCount, ...complexCase.items);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual('a');
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(false);
        expect(result[3]).assertNaN();
        expect(result[4]).assertEqual('b');
        expect(original).assertDeepEquals(['a', 'b']);
      } catch (e) {
        throw new Error(`混合用例失败: ${e.message}`);
      }
    });
  });
}