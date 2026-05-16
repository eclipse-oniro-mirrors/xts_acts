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

export default function builtinsShortBoxConstructorText() {
  describe("builtinsShortBoxConstructorText", () => {
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
     * @tc.name    builtinsShortBoxConstructorText0001
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0001
     * @tc.desc    Test ShortBox constructor with minimum value -32768
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox(-32768);
      const result: short = box.get();
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0002
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0002
     * @tc.desc    Test ShortBox constructor with maximum value 32767
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox(32767);
      const result: short = box.get();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0003
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0003
     * @tc.desc    Test ShortBox constructor with underflow value -32769
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const underflowValue: number = -32769;
        const shortValue: short = underflowValue.toShort();
        const box = new ShortBox(shortValue);
        const result: short = box.get();
        expect(result).assertEqual(32767);
      } catch (error) {
        console.log(`Short constructor underflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0004
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0004
     * @tc.desc    Test ShortBox constructor with overflow value 32768
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const overflowValue: number = 32768;
        const shortValue: short = overflowValue.toShort();
        const box = new ShortBox(shortValue);
        const result: short = box.get();
        expect(result).assertEqual(-32768);
      } catch (error) {
        console.log(`Short constructor overflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0005
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0005
     * @tc.desc    Test ShortBox constructor with 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox(0);
      const result: short = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0006
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0006
     * @tc.desc    Test ShortBox constructor with -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox(-1);
      const result: short = box.get();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0007
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0007
     * @tc.desc    Test ShortBox constructor with 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox(1);
      const result: short = box.get();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0008
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0008
     * @tc.desc    Test ShortBox constructor with -16384
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox(-16384);
      const result: short = box.get();
      expect(result).assertEqual(-16384);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0009
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0009
     * @tc.desc    Test ShortBox constructor with 16384
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox(16384);
      const result: short = box.get();
      expect(result).assertEqual(16384);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0010
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0010
     * @tc.desc    Test ShortBox constructor without parameters initializes to 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ShortBox();
      const result: short = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsShortBoxConstructorText0011
     * @tc.number  BUILTINS_SHORT_BOX_CONSTRUCTOR_TEXT_0011
     * @tc.desc    Test ShortBox default constructor instances are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsShortBoxConstructorText0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box1 = new ShortBox();
      const box2 = new ShortBox();

      expect(box1.get()).assertEqual(0);
      expect(box2.get()).assertEqual(0);

      box1.set(-1000);
      box2.set(1000);

      expect(box1.get()).assertEqual(-1000);
      expect(box2.get()).assertEqual(1000);
    });
  })
}