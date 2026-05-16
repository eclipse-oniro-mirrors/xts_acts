/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayConstructorTestErr() {
  describe('ArrayConstructorTestErr', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   ArrayConstructor1Test059
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST5900
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const d1 = new Date('2020-01-01');
      const d2 = new Date('2021-01-01');
      const r1: Date[] = [d2, d1];
      expect(r1[0].toISOString()).assertEqual("2021-01-01T00:00:00.000Z");
      expect(r1[1].toISOString()).assertEqual("2020-01-01T00:00:00.000Z");

      const typedArr = new Float64Array([d1.getTime(), d2.getTime()]);
      const r2: number[] = [typedArr[1], typedArr[0]];
      expect(r2[0]).assertEqual(d2.getTime());
      expect(r2[1]).assertEqual(d1.getTime());
    });

    /**
     * @tc.name   ArrayConstructor1Test242
     * @tc.number BUILTINS_ARRAY1_COMBINATION_TEST24200
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConstructor1Test242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const d1 = new Date('2020-01-01');
      const d2 = new Date('2021-01-01');
      const r: Date[] = [d2, d1];
      expect(r[0].toISOString()).assertEqual("2021-01-01T00:00:00.000Z");
      expect(r[1].toISOString()).assertEqual("2020-01-01T00:00:00.000Z");
    });

  });
}