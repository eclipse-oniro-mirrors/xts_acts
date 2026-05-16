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

export default function builtinsShortBoxSetText() {
  describe("builtinsShortBoxSetText", () => {
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
     * @tc.name    builtinsShortBoxSetText0001
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0001
     * @tc.desc    Test ShortBox set method with minimum value -32768
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const setResult: short = box.set(-32768);
      expect(setResult).assertEqual(-32768);
    });

    /**
     * @tc.name    builtinsShortBoxSetText0002
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0002
     * @tc.desc    Test ShortBox set method with maximum value 32767
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const setResult: short = box.set(32767);
      expect(setResult).assertEqual(32767);
    });

    /**
     * @tc.name    builtinsShortBoxSetText0003
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0003
     * @tc.desc    Test ShortBox set method with underflow value -32769
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      try {
        const underflowValue: number = -32769;
        const shortValue: short = underflowValue.toShort();
        const setResult: short = box.set(shortValue);
        expect(setResult).assertEqual(32767);
      } catch (error) {
        console.log(`Set underflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsShortBoxSetText0004
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0004
     * @tc.desc    Test ShortBox set method with overflow value 32768
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      try {
        const overflowValue: number = 32768;
        const shortValue: short = overflowValue.toShort();
        const setResult: short = box.set(shortValue);
        expect(setResult).assertEqual(-32768);
      } catch (error) {
        console.log(`Set overflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsShortBoxSetText0005
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0005
     * @tc.desc    Test ShortBox set method with 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const setResult: short = box.set(0);
      expect(setResult).assertEqual(0);
    });

    /**
     * @tc.name    builtinsShortBoxSetText0006
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0006
     * @tc.desc    Test ShortBox set method with -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const setResult: short = box.set(-1);
      expect(setResult).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsShortBoxSetText0007
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0007
     * @tc.desc    Test ShortBox set method with 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const setResult: short = box.set(1);
      expect(setResult).assertEqual(1);
    });

    /**
     * @tc.name    builtinsShortBoxSetText0008
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0008
     * @tc.desc    Test ShortBox set method with -16384
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const setResult: short = box.set(-16384);
      expect(setResult).assertEqual(-16384);
    });

    /**
     * @tc.name    builtinsShortBoxSetText0009
     * @tc.number  BUILTINS_SHORT_BOX_SET_TEXT_0009
     * @tc.desc    Test ShortBox set method with 16384
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxSetText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const setResult: short = box.set(16384);
      expect(setResult).assertEqual(16384);
    });

  })
}