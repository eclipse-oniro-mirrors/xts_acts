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

export default function builtinsByteBoxConstructorText() {
  describe("builtinsByteBoxConstructorText", () => {
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
     * @tc.name    builtinsByteBoxConstructorText0001
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0001
     * @tc.desc    Test ByteBox constructor with minimum value -128
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox(-128);
      const result: byte = box.get();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0002
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0002
     * @tc.desc    Test ByteBox constructor with maximum value 127
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox(127);
      const result: byte = box.get();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0003
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0003
     * @tc.desc    Test ByteBox constructor with underflow value -129
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const underflowValue: number = -129;
      try {
        const byteValue: byte = underflowValue.toByte();
        const box = new ByteBox(byteValue);
        const result: byte = box.get();
        expect(result).assertEqual(127);
      } catch (error) {
        console.log(`Constructor underflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0004
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0004
     * @tc.desc    Test ByteBox constructor with overflow value 128
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowValue: number = 128;
      try {
        const byteValue: byte = overflowValue.toByte();
        const box = new ByteBox(byteValue);
        const result: byte = box.get();
        expect(result).assertEqual(-128);
      } catch (error) {
        console.log(`Constructor overflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0005
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0005
     * @tc.desc    Test ByteBox constructor with 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox(0);
      const result: byte = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0006
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0006
     * @tc.desc    Test ByteBox constructor with -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox(-1);
      const result: byte = box.get();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0007
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0007
     * @tc.desc    Test ByteBox constructor with 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox(1);
      const result: byte = box.get();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0008
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0008
     * @tc.desc    Test ByteBox constructor without parameters initializes to 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const result: byte = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsByteBoxConstructorText0009
     * @tc.number  BUILTINS_BYTE_BOX_CONSTRUCTOR_TEXT_0009
     * @tc.desc    Test ByteBox default constructor instances are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxConstructorText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box1 = new ByteBox();
      const box2 = new ByteBox();

      expect(box1.get()).assertEqual(0);
      expect(box2.get()).assertEqual(0);

      box1.set(-128);
      box2.set(127);

      expect(box1.get()).assertEqual(-128);
      expect(box2.get()).assertEqual(127);
    });
  })
}