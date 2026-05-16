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

export default function builtinsFloatBoxBoxText() {
  describe("builtinsFloatBoxBoxText", () => {
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
     * @tc.name    builtinsFloatBoxBoxText0001
     * @tc.number  BUILTINS_FLOAT_BOX_BOX_TEXT_0001
     * @tc.desc    Test FloatBox.box method with float minimum positive value 1.40129846432481707e-45
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsFloatBoxBoxText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value: float = (1.40129846432481707e-45).toFloat();
        const box: FloatBox = FloatBox.box(value);
        expect(box.get()).assertEqual(value);
      } catch (error) {
        console.log(`Min positive float test failed: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsFloatBoxBoxText0002
     * @tc.number  BUILTINS_FLOAT_BOX_BOX_TEXT_0002
     * @tc.desc    Test FloatBox.box method with float maximum positive value 3.40282346638528860e+38
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsFloatBoxBoxText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value: float = (3.40282346638528860e+38).toFloat();
        const box: FloatBox = FloatBox.box(value);
        expect(box.get()).assertEqual(value);
      } catch (error) {
        console.log(`Max positive float test failed: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsFloatBoxBoxText0003
     * @tc.number  BUILTINS_FLOAT_BOX_BOX_TEXT_0003
     * @tc.desc    Test FloatBox.box method with float minimum negative value -1.40129846432481707e-45
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsFloatBoxBoxText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value: float = (-1.40129846432481707e-45).toFloat();
        const box: FloatBox = FloatBox.box(value);
        expect(box.get()).assertEqual(value);
      } catch (error) {
        console.log(`Min negative float test failed: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsFloatBoxBoxText0004
     * @tc.number  BUILTINS_FLOAT_BOX_BOX_TEXT_0004
     * @tc.desc    Test FloatBox.box method with float maximum negative value -3.40282346638528860e+38
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsFloatBoxBoxText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value: float = (-3.40282346638528860e+38).toFloat();
        const box: FloatBox = FloatBox.box(value);
        expect(box.get()).assertEqual(value);
      } catch (error) {
        console.log(`Max negative float test failed: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsFloatBoxBoxText0005
     * @tc.number  BUILTINS_FLOAT_BOX_BOX_TEXT_0005
     * @tc.desc    Test FloatBox.box method with hex literal 0xcafebabe
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxBoxText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value: float = (0xcafebabe).toFloat();
        const box: FloatBox = FloatBox.box(value);
        expect(box.get()).assertEqual(value);
      } catch (error) {
        console.log(`Hex literal test failed: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsFloatBoxBoxText0006
     * @tc.number  BUILTINS_FLOAT_BOX_BOX_TEXT_0006
     * @tc.desc    Test FloatBox.box method with underflow positive value (< min denormal)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsFloatBoxBoxText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value: float = (1.0e-46).toFloat();
        const box: FloatBox = FloatBox.box(value);
        expect(box.get()).assertEqual(0.0.toFloat());
      } catch (error) {
        console.log(`Underflow positive test failed: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsFloatBoxBoxText0007
     * @tc.number  BUILTINS_FLOAT_BOX_BOX_TEXT_0007
     * @tc.desc    Test FloatBox.box method with underflow negative value (> max negative denormal)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsFloatBoxBoxText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value: float = (-1.0e-46).toFloat();
        const box: FloatBox = FloatBox.box(value);
        expect(box.get()).assertEqual((-0.0).toFloat());
      } catch (error) {
        console.log(`Underflow negative test failed: ${error.message}`);
      }
    });
  })
}