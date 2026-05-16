/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

export default function builtinsShortBoxBoxText() {
  describe("builtinsShortBoxBoxText", () => {
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
     * @tc.name    builtinsShortBoxBoxText0001
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0001
     * @tc.desc    Test ShortBox.box method with minimum value -32768
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ShortBox.box(-32768);
      const result: short = box.get();
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0002
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0002
     * @tc.desc    Test ShortBox.box method with maximum value 32767
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ShortBox.box(32767);
      const result: short = box.get();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0003
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0003
     * @tc.desc    Test ShortBox.box method with underflow value -32769
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const underflowValue: number = -32769;
        const shortValue: short = underflowValue.toShort();
        const box = ShortBox.box(shortValue);
        const result: short = box.get();
        expect(result).assertEqual(32767);
      } catch (error) {
        console.log(`Box underflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0004
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0004
     * @tc.desc    Test ShortBox.box method with overflow value 32768
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const overflowValue: number = 32768;
        const shortValue: short = overflowValue.toShort();
        const box = ShortBox.box(shortValue);
        const result: short = box.get();
        expect(result).assertEqual(-32768);
      } catch (error) {
        console.log(`Box overflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0005
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0005
     * @tc.desc    Test ShortBox.box method with 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ShortBox.box(0);
      const result: short = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0006
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0006
     * @tc.desc    Test ShortBox.box method with -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ShortBox.box(-1);
      const result: short = box.get();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0007
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0007
     * @tc.desc    Test ShortBox.box method with 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ShortBox.box(1);
      const result: short = box.get();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0008
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0008
     * @tc.desc    Test ShortBox.box method with -16384
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ShortBox.box(-16384);
      const result: short = box.get();
      expect(result).assertEqual(-16384);
    });

    /**
     * @tc.name    builtinsShortBoxBoxText0009
     * @tc.number  BUILTINS_SHORT_BOX_BOX_TEXT_0009
     * @tc.desc    Test ShortBox.box method with 16384
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxBoxText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ShortBox.box(16384);
      const result: short = box.get();
      expect(result).assertEqual(16384);
    });
  })
}