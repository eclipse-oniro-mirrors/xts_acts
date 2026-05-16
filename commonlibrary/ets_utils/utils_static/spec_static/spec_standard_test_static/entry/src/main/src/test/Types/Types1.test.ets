/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
function test(): double {
  let a1: int = 1;
  let a2: int = 1;
  let a3: int = 1;
  let a4: int = 1;
  let a5: int = 1;
  let a6: int = 1;
  let a7: int = 1;
  let a8: int = 1;
  let a9: int = 1;
  let a10: int = 1;
  let a11: int = 1;
  let a12: int = 1;
  let a13: int = 1;
  let a14: int = 1;
  let a15: int = 1;
  let a16: int = 1;
  return a16.toDouble();
}
export default function SpecTypeTest1() {
  describe('SpecTypeTest1', (): void => {
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_REGALLOC_0100
     * @tc.name RegisterAllocationTest001
     * @tc.desc Test register type allocation with 16 local variables returning union type toDouble()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RegisterAllocationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a: int | double = 1;
      let a1: int = 1;
      let a2: int = 1;
      let a3: int = 1;
      let a4: int = 1;
      let a5: int = 1;
      let a6: int = 1;
      let a7: int = 1;
      let a8: int = 1;
      let a9: int = 1;
      let a10: int = 1;
      let a11: int = 1;
      let a12: int = 1;
      let a13: int = 1;
      let a14: int = 1;
      let a15: int = 1;
      let a16: int = 1;
      let a17: int = 1;
      let a18: int = 1;
      let result: double = a.toDouble();
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_REGALLOC_0200
     * @tc.name RegisterAllocationTest002
     * @tc.desc Test register allocation with mixed type local variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RegisterAllocationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let val: int | double = 256;
      test();
      let result: int = val.toInt();
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_REGALLOC_0300
     * @tc.name RegisterAllocationTest003
     * @tc.desc Test register allocation with toFloat() on union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RegisterAllocationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a: int | float = 128;
      let a1: int = 1;
      let a2: int = 1;
      let a3: int = 1;
      let a4: int = 1;
      let a5: int = 1;
      let a6: int = 1;
      let a7: int = 1;
      let a8: int = 1;
      let a9: int = 1;
      let a10: int = 1;
      let a11: int = 1;
      let a12: float = 1.2f;
      let a13: float = 1.2f;
      let a14: float = 1.2f;
      let a15: float = 1.2f;
      let a16: float = 1.2f;
      let result: float = a.toFloat();
      expect(result).assertEqual(128.0);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_REGALLOC_0400
     * @tc.name RegisterAllocationTest004
     * @tc.desc Test register allocation accessing outer variable in nested scope
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('RegisterAllocationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let x: int | double = 555;
      let v1: int = 1;
      let v2: int = 2;
      let v3: int = 3;
      let v4: int = 4;
      let v5: int = 5;
      let v6: int = 6;
      let v7: int = 7;
      let int_8: int = 8;
      {
        let block1: int = 100;
        let block2: int = 200;
        let x1: int = 1;
        let x2: int = 1;
        let x3: int = 1;
        let x4: int = 1;
        {
          let inner1: int = 300;
          let inner2: int = 400;
          let y1: int = 1;
          let y2: int = 1;
          let y3: int = 1;
          let y4: int = 1;
          let result: double = x.toDouble();
          expect(result).assertEqual(555.0);
        }
      }
    });

  });
}
