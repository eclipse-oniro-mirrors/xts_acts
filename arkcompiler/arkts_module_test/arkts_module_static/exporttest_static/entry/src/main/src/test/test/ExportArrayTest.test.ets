'use static'
/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the License);
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an AS IS BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import arr, { arr1, arr2, arr3, typeArr } from '../default/DefaultLetArray';
import * as arr5 from '../utils/ArrayAll';
import { arr4 } from '../utils/ArrayNameAll';
import defaultArr from '../default/DefaultArray';
import defaultTypeArr from '../default/DefaultTypeArray';
import { sleep } from '../utils/Utils';

export default function exportArrayTest() {
  describe('ExportArrayTest', () => {
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
     * @tc.number SUB_EXPORT_ARRAY_TEST_0100
     * @tc.name exportArrayTestTest1001
     * @tc.desc Test name *
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('exportArrayTestTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // expect(arr4.default).assertDeepEquals([1, 2, 3]);   // case ： 问题确认中，显式的使用xxx.default，编译报错，1.2语法不支持
      const target1: Array<number> = [2, 3, 4];
      const target2: Array<number> = [3, 4, 5];
      expect(arr4.arr1).assertDeepEquals(target1);
      expect(arr4.arr2).assertDeepEquals(target2);
      // expect(arr4.arr3).assertDeepEquals([3, 4, 5]);   // case : 问题确认中，export * as XX + export {A as B} 的组合场景，编译报错
    })

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0200
     * @tc.name exportArrayTestTest1002
     * @tc.desc Test default let array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const target: Array<number> = [1, 2, 3];
      expect(arr).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0300
     * @tc.name exportArrayTestTest1003
     * @tc.desc Test type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: typeArr<number> = [6, 7, 8];
      const target: Array<number> = [6, 7, 8];
      expect(arr).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0400
     * @tc.name exportArrayTestTest1004
     * @tc.desc Test let inline array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const target: Array<number> = [2, 3, 4];
      expect(arr1).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0500
     * @tc.name exportArrayTestTest1005
     * @tc.desc Test let array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const target: Array<number> = [3, 4, 5];
      expect(arr2).assertDeepEquals(target);
    })

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0600
     * @tc.name exportArrayTestTest1006
     * @tc.desc Test name array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const target: Array<number> = [3, 4, 5];
      expect(arr3).assertDeepEquals(target);
    })

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0700
     * @tc.name exportArrayTestTest1007
     * @tc.desc Test *
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const target1: Array<number> = [2, 3, 4];
      const target2: Array<number> = [3, 4, 5];
      expect(arr5.arr1).assertDeepEquals(target1);
      expect(arr5.arr2).assertDeepEquals(target2);
      // expect(arr5.arr3).assertDeepEquals([3, 4, 5]);   // case : 问题确认中，export * as XX + export {A as B} 的组合场景，编译报错
    })

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0800
     * @tc.name exportArrayTestTest1008
     * @tc.desc Test default array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const target: Array<int> = [4, 5, 6];
      expect(defaultArr).assertDeepEquals(target);
    })

    /**
     * @tc.number SUB_EXPORT_ARRAY_TEST_0900
     * @tc.name exportArrayTestTest1009
     * @tc.desc Test default type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportArrayTestTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: defaultTypeArr<number> = [7, 8, 9];
      const target: Array<number> = [7, 8, 9];
      expect(arr).assertDeepEquals(target);
    })
  });
}