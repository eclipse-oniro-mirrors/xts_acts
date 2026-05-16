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

export default function builtinsFloatBoxGetText() {
  describe("builtinsFloatBoxGetText", () => {
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
     * @tc.name    builtinsFloatBoxGetText0001
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0001
     * @tc.desc    Test FloatBox.get method with float minimum positive value 1.40129846432481707e-45
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (1.40129846432481707e-45).toFloat();
      expect(FloatBox.box(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxGetText0002
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0002
     * @tc.desc    Test FloatBox.get method with float maximum positive value 3.40282346638528860e+38
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (3.40282346638528860e+38).toFloat();
      expect(FloatBox.box(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxGetText0003
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0003
     * @tc.desc    Test FloatBox.get method with float minimum negative value -1.40129846432481707e-45
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (-1.40129846432481707e-45).toFloat();
      expect(FloatBox.box(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxGetText0004
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0004
     * @tc.desc    Test FloatBox.get method with float maximum negative value -3.40282346638528860e+38
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (-3.40282346638528860e+38).toFloat();
      expect(FloatBox.box(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxGetText0005
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0005
     * @tc.desc    Test FloatBox.get method with hex literal 0xcafebabe
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (0xcafebabe).toFloat();
      expect(FloatBox.box(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxGetText0006
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0006
     * @tc.desc    Test FloatBox.get method with underflow positive value 1.0e-46
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(FloatBox.box((1.0e-46).toFloat()).get()).assertEqual(0.0.toFloat());
    });

    /**
     * @tc.name    builtinsFloatBoxGetText0007
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0007
     * @tc.desc    Test FloatBox.get method with underflow positive value 1.0e-46
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(FloatBox.box((1.0e-46).toFloat()).get()).assertEqual(0.0.toFloat());
    });

    /**
     * @tc.name    builtinsFloatBoxGetText0008
     * @tc.number  BUILTINS_FLOAT_BOX_GET_TEXT_0008
     * @tc.desc    Test FloatBox.get method with underflow negative value -1.0e-46
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxGetText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(FloatBox.box((-1.0e-46).toFloat()).get()).assertEqual((-0.0).toFloat());
    });
  })
}