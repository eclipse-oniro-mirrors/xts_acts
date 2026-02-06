/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsArrayFilterPrototypebTest(){
  describe('builtinsArrayFilterPrototypebTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0100
     * @tc.name builtinsArrayFilterPrototypebTest0100
     * @tc.desc filter(self: FixedArray<boolean>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0200
     * @tc.name builtinsArrayFilterPrototypebTest0200
     * @tc.desc filter(self: FixedArray<boolean>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0300
     * @tc.name builtinsArrayFilterPrototypebTest0300
     * @tc.desc filter(self: FixedArray<boolean>, fn) 只保留true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = filter(arr, (v, k, array) => v === true);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0400
     * @tc.name builtinsArrayFilterPrototypebTest0400
     * @tc.desc filter(self: FixedArray<boolean>, fn) 只保留false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = filter(arr, (v, k, array) => v === false);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0500
     * @tc.name builtinsArrayFilterPrototypebTest0500
     * @tc.desc filter(self: FixedArray<boolean>, fn) 根据索引保留偶数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const result = filter(arr, (v, k, array) => k % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0600
     * @tc.name builtinsArrayFilterPrototypebTest0600
     * @tc.desc filter(self: FixedArray<boolean>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0700
     * @tc.name builtinsArrayFilterPrototypebTest0700
     * @tc.desc filter(self: FixedArray<boolean>, fn) 保留第一个true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, true, false, true];
        const result = filter(arr, (v, k, array) => k === 1);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0800
     * @tc.name builtinsArrayFilterPrototypebTest0800
     * @tc.desc filter(self: FixedArray<boolean>, fn) 复杂条件：只保留true且索引为奇数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, false, true, false, true];
        const result = filter(arr, (v, k, array) => v && k % 2 === 1);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest0900
     * @tc.name builtinsArrayFilterPrototypebTest0900
     * @tc.desc filter(self: FixedArray<byte>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1  , 2  , 3  ];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1  );
        expect(result[1]).assertEqual(2  );
        expect(result[2]).assertEqual(3  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1000
     * @tc.name builtinsArrayFilterPrototypebTest1000
     * @tc.desc filter(self: FixedArray<byte>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1  , 2  , 3  ];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1100
     * @tc.name builtinsArrayFilterPrototypebTest1100
     * @tc.desc filter(self: FixedArray<byte>, fn) 只保留偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1  , 2  , 3  , 4  ];
        const result = filter(arr, (v, k, array) => v % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2  );
        expect(result[1]).assertEqual(4  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1200
     * @tc.name builtinsArrayFilterPrototypebTest1200
     * @tc.desc filter(self: FixedArray<byte>, fn) 只保留大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1  , 2  , 3  , 4  ];
        const result = filter(arr, (v, k, array) => v > 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3  );
        expect(result[1]).assertEqual(4  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1300
     * @tc.name builtinsArrayFilterPrototypebTest1300
     * @tc.desc filter(self: FixedArray<byte>, fn) 根据索引保留奇数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1  , 2  , 3  , 4  , 5  ];
        const result = filter(arr, (v, k, array) => k % 2 === 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2  );
        expect(result[1]).assertEqual(4  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1400
     * @tc.name builtinsArrayFilterPrototypebTest1400
     * @tc.desc filter(self: FixedArray<byte>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1500
     * @tc.name builtinsArrayFilterPrototypebTest1500
     * @tc.desc filter(self: FixedArray<byte>, fn) 保留第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1  , 2  , 3  ];
        const result = filter(arr, (v, k, array) => k === 0);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1600
     * @tc.name builtinsArrayFilterPrototypebTest1600
     * @tc.desc filter(self: FixedArray<byte>, fn) 复杂条件：只保留大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1  , 2  , 3  , 4  , 5  ];
        const result = filter(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3  );
        expect(result[1]).assertEqual(5  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1700
     * @tc.name builtinsArrayFilterPrototypebTest1700
     * @tc.desc filter(self: FixedArray<char>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(c'a');
        expect(result[1]).assertEqual(c'b');
        expect(result[2]).assertEqual(c'c');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1800
     * @tc.name builtinsArrayFilterPrototypebTest1800
     * @tc.desc filter(self: FixedArray<char>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest1900
     * @tc.name builtinsArrayFilterPrototypebTest1900
     * @tc.desc filter(self: FixedArray<char>, fn) 只保留元音字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'e', c'f'];
        const result = filter(arr, (v, k, array) => v === c'a' || v === c'e');
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(c'a');
        expect(result[1]).assertEqual(c'e');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2000
     * @tc.name builtinsArrayFilterPrototypebTest2000
     * @tc.desc filter(self: FixedArray<char>, fn) 只保留辅音字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'e', c'f'];
        const result = filter(arr, (v, k, array) => v !== c'a' && v !== c'e');
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(c'b');
        expect(result[1]).assertEqual(c'f');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2100
     * @tc.name builtinsArrayFilterPrototypebTest2100
     * @tc.desc filter(self: FixedArray<char>, fn) 根据索引保留偶数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c', c'd', c'e'];
        const result = filter(arr, (v, k, array) => k % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(c'a');
        expect(result[1]).assertEqual(c'c');
        expect(result[2]).assertEqual(c'e');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2200
     * @tc.name builtinsArrayFilterPrototypebTest2200
     * @tc.desc filter(self: FixedArray<char>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2300
     * @tc.name builtinsArrayFilterPrototypebTest2300
     * @tc.desc filter(self: FixedArray<char>, fn) 保留第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = filter(arr, (v, k, array) => k === 0);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(c'a');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2400
     * @tc.name builtinsArrayFilterPrototypebTest2400
     * @tc.desc filter(self: FixedArray<char>, fn) 复杂条件：只保留元音且索引为奇数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'e', c'i', c'o', c'u'];
        const result = filter(arr, (v, k, array) => (v === c'a' || v === c'e' || v === c'i' || v === c'o' || v === c'u') && k % 2 === 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(c'e');
        expect(result[1]).assertEqual(c'o');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayFilterPrototypebTest2500
     * @tc.name builtinsArrayFilterPrototypebTest2500
     * @tc.desc filter(self: FixedArray<double>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1.1.toDouble());
        expect(result[1]).assertEqual(2.2.toDouble());
        expect(result[2]).assertEqual(3.3.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2600
     * @tc.name builtinsArrayFilterPrototypebTest2600
     * @tc.desc filter(self: FixedArray<double>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2700
     * @tc.name builtinsArrayFilterPrototypebTest2700
     * @tc.desc filter(self: FixedArray<double>, fn) 只保留大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        const result = filter(arr, (v, k, array) => v > 2.0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(2.2.toDouble());
        expect(result[1]).assertEqual(3.3.toDouble());
        expect(result[2]).assertEqual(4.4.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2800
     * @tc.name builtinsArrayFilterPrototypebTest2800
     * @tc.desc filter(self: FixedArray<double>, fn) 只保留小于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        const result = filter(arr, (v, k, array) => v < 3.0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(1.1.toDouble());
        expect(result[1]).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest2900
     * @tc.name builtinsArrayFilterPrototypebTest2900
     * @tc.desc filter(self: FixedArray<double>, fn) 根据索引保留偶数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble(), 5.5.toDouble()];
        const result = filter(arr, (v, k, array) => k % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1.1.toDouble());
        expect(result[1]).assertEqual(3.3.toDouble());
        expect(result[2]).assertEqual(5.5.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3000
     * @tc.name builtinsArrayFilterPrototypebTest3000
     * @tc.desc filter(self: FixedArray<double>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3100
     * @tc.name builtinsArrayFilterPrototypebTest3100
     * @tc.desc filter(self: FixedArray<double>, fn) 保留第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const result = filter(arr, (v, k, array) => k === 0);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1.1.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3200
     * @tc.name builtinsArrayFilterPrototypebTest3200
     * @tc.desc filter(self: FixedArray<double>, fn) 复杂条件：只保留大于2且索引为奇数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble(), 5.5.toDouble()];
        const result = filter(arr, (v, k, array) => v > 2.0 && k % 2 === 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2.2.toDouble());
        expect(result[1]).assertEqual(4.4.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3300
     * @tc.name builtinsArrayFilterPrototypebTest3300
     * @tc.desc filter(self: FixedArray<float>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1.1.toFloat());
        expect(result[1]).assertEqual(2.2.toFloat());
        expect(result[2]).assertEqual(3.3.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3400
     * @tc.name builtinsArrayFilterPrototypebTest3400
     * @tc.desc filter(self: FixedArray<float>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3500
     * @tc.name builtinsArrayFilterPrototypebTest3500
     * @tc.desc filter(self: FixedArray<float>, fn) 只保留大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = filter(arr, (v, k, array) => v > 2.0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(2.2.toFloat());
        expect(result[1]).assertEqual(3.3.toFloat());
        expect(result[2]).assertEqual(4.4.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3600
     * @tc.name builtinsArrayFilterPrototypebTest3600
     * @tc.desc filter(self: FixedArray<float>, fn) 只保留小于3的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const result = filter(arr, (v, k, array) => v < 3.0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(1.1.toFloat());
        expect(result[1]).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3700
     * @tc.name builtinsArrayFilterPrototypebTest3700
     * @tc.desc filter(self: FixedArray<float>, fn) 根据索引保留偶数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat(), 5.5.toFloat()];
        const result = filter(arr, (v, k, array) => k % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1.1.toFloat());
        expect(result[1]).assertEqual(3.3.toFloat());
        expect(result[2]).assertEqual(5.5.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3800
     * @tc.name builtinsArrayFilterPrototypebTest3800
     * @tc.desc filter(self: FixedArray<float>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest3900
     * @tc.name builtinsArrayFilterPrototypebTest3900
     * @tc.desc filter(self: FixedArray<float>, fn) 保留第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = filter(arr, (v, k, array) => k === 0);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1.1.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4000
     * @tc.name builtinsArrayFilterPrototypebTest4000
     * @tc.desc filter(self: FixedArray<float>, fn) 复杂条件：只保留大于2且索引为奇数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat(), 5.5.toFloat()];
        const result = filter(arr, (v, k, array) => v > 2.0 && k % 2 === 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2.2.toFloat());
        expect(result[1]).assertEqual(4.4.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4100
     * @tc.name builtinsArrayFilterPrototypebTest4100
     * @tc.desc filter(self: FixedArray<int>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1  , 2  , 3  ];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1  );
        expect(result[1]).assertEqual(2  );
        expect(result[2]).assertEqual(3  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4200
     * @tc.name builtinsArrayFilterPrototypebTest4200
     * @tc.desc filter(self: FixedArray<int>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1  , 2  , 3  ];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4300
     * @tc.name builtinsArrayFilterPrototypebTest4300
     * @tc.desc filter(self: FixedArray<int>, fn) 只保留偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1  , 2  , 3  , 4  ];
        const result = filter(arr, (v, k, array) => v % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2  );
        expect(result[1]).assertEqual(4  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4400
     * @tc.name builtinsArrayFilterPrototypebTest4400
     * @tc.desc filter(self: FixedArray<int>, fn) 只保留大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1  , 2  , 3  , 4  ];
        const result = filter(arr, (v, k, array) => v > 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3  );
        expect(result[1]).assertEqual(4  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4500
     * @tc.name builtinsArrayFilterPrototypebTest4500
     * @tc.desc filter(self: FixedArray<int>, fn) 根据索引保留奇数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1  , 2  , 3  , 4  , 5  ];
        const result = filter(arr, (v, k, array) => k % 2 === 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2  );
        expect(result[1]).assertEqual(4  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4600
     * @tc.name builtinsArrayFilterPrototypebTest4600
     * @tc.desc filter(self: FixedArray<int>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4700
     * @tc.name builtinsArrayFilterPrototypebTest4700
     * @tc.desc filter(self: FixedArray<int>, fn) 保留第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1  , 2  , 3  ];
        const result = filter(arr, (v, k, array) => k === 0);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4800
     * @tc.name builtinsArrayFilterPrototypebTest4800
     * @tc.desc filter(self: FixedArray<int>, fn) 复杂条件：只保留大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1  , 2  , 3  , 4  , 5  ];
        const result = filter(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3  );
        expect(result[1]).assertEqual(5  );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest4900
     * @tc.name builtinsArrayFilterPrototypebTest4900
     * @tc.desc filter(self: FixedArray<long>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1 as long, 2 as long, 3 as long];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1 as long);
        expect(result[1]).assertEqual(2 as long);
        expect(result[2]).assertEqual(3 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5000
     * @tc.name builtinsArrayFilterPrototypebTest5000
     * @tc.desc filter(self: FixedArray<long>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1 as long, 2 as long, 3 as long];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5100
     * @tc.name builtinsArrayFilterPrototypebTest5100
     * @tc.desc filter(self: FixedArray<long>, fn) 只保留偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1 as long, 2 as long, 3 as long, 4 as long];
        const result = filter(arr, (v, k, array) => v % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2 as long);
        expect(result[1]).assertEqual(4 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5200
     * @tc.name builtinsArrayFilterPrototypebTest5200
     * @tc.desc filter(self: FixedArray<long>, fn) 只保留大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1 as long, 2 as long, 3 as long, 4 as long];
        const result = filter(arr, (v, k, array) => v > 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3 as long);
        expect(result[1]).assertEqual(4 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5300
     * @tc.name builtinsArrayFilterPrototypebTest5300
     * @tc.desc filter(self: FixedArray<long>, fn) 根据索引保留奇数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1 as long, 2 as long, 3 as long, 4 as long, 5 as long];
        const result = filter(arr, (v, k, array) => k % 2 === 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2 as long);
        expect(result[1]).assertEqual(4 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5400
     * @tc.name builtinsArrayFilterPrototypebTest5400
     * @tc.desc filter(self: FixedArray<long>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5500
     * @tc.name builtinsArrayFilterPrototypebTest5500
     * @tc.desc filter(self: FixedArray<long>, fn) 保留第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1 as long, 2 as long, 3 as long];
        const result = filter(arr, (v, k, array) => k === 0);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1 as long);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5600
     * @tc.name builtinsArrayFilterPrototypebTest5600
     * @tc.desc filter(self: FixedArray<long>, fn) 复杂条件：只保留大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1 as long, 2 as long, 3 as long, 4 as long, 5 as long];
        const result = filter(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3 as long);
        expect(result[1]).assertEqual(5 as long);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayFilterPrototypebTest5700
     * @tc.name builtinsArrayFilterPrototypebTest5700
     * @tc.desc filter(self: FixedArray<short>, fn) 全部保留
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1 as short);
        expect(result[1]).assertEqual(2 as short);
        expect(result[2]).assertEqual(3 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5800
     * @tc.name builtinsArrayFilterPrototypebTest5800
     * @tc.desc filter(self: FixedArray<short>, fn) 全部过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        const result = filter(arr, (v, k, array) => false);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest5900
     * @tc.name builtinsArrayFilterPrototypebTest5900
     * @tc.desc filter(self: FixedArray<short>, fn) 只保留偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short, 4 as short];
        const result = filter(arr, (v, k, array) => v % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2 as short);
        expect(result[1]).assertEqual(4 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest6000
     * @tc.name builtinsArrayFilterPrototypebTest6000
     * @tc.desc filter(self: FixedArray<short>, fn) 只保留大于2的元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short, 4 as short];
        const result = filter(arr, (v, k, array) => v > 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3 as short);
        expect(result[1]).assertEqual(4 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest6100
     * @tc.name builtinsArrayFilterPrototypebTest6100
     * @tc.desc filter(self: FixedArray<short>, fn) 根据索引保留奇数位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        const result = filter(arr, (v, k, array) => k % 2 === 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2 as short);
        expect(result[1]).assertEqual(4 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest6200
     * @tc.name builtinsArrayFilterPrototypebTest6200
     * @tc.desc filter(self: FixedArray<short>, fn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = filter(arr, (v, k, array) => true);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest6300
     * @tc.name builtinsArrayFilterPrototypebTest6300
     * @tc.desc filter(self: FixedArray<short>, fn) 保留第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        const result = filter(arr, (v, k, array) => k === 0);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1 as short);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayFilterPrototypebTest6400
     * @tc.name builtinsArrayFilterPrototypebTest6400
     * @tc.desc filter(self: FixedArray<short>, fn) 复杂条件：只保留大于1且索引为偶数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayFilterPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayFilterPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        const result = filter(arr, (v, k, array) => v > 1 && k % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3 as short);
        expect(result[1]).assertEqual(5 as short);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}