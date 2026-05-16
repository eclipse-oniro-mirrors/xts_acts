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

export default function builtinsFloatBoxConstructorWithParamText() {
  describe("builtinsFloatBoxConstructorWithParamText", () => {
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
     * @tc.name    builtinsFloatBoxConstructorWithParamText0001
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0001
     * @tc.desc    Test FloatBox constructor with float minimum positive value 1.40129846432481707e-45
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (1.40129846432481707e-45).toFloat();
      expect(new FloatBox(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0002
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0002
     * @tc.desc    Test FloatBox constructor with float maximum positive value 3.40282346638528860e+38
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (3.40282346638528860e+38).toFloat();
      expect(new FloatBox(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0003
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0003
     * @tc.desc    Test FloatBox constructor with float minimum negative value -1.40129846432481707e-45
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (-1.40129846432481707e-45).toFloat();
      expect(new FloatBox(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0004
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0004
     * @tc.desc    Test FloatBox constructor with float maximum negative value -3.40282346638528860e+38
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (-3.40282346638528860e+38).toFloat();
      expect(new FloatBox(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0005
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0005
     * @tc.desc    Test FloatBox constructor with hex literal 0xcafebabe
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (0xcafebabe).toFloat();
      expect(new FloatBox(v).get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0006
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0006
     * @tc.desc    Test FloatBox constructor with underflow positive value 1.0e-46
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (1.0e-46).toFloat();
      expect(new FloatBox(v).get()).assertEqual(0.0.toFloat());
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0007
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0007
     * @tc.desc    Test FloatBox constructor with underflow negative value -1.0e-46
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v: float = (-1.0e-46).toFloat();
      expect(new FloatBox(v).get()).assertEqual((-0.0).toFloat());
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0008
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0008
     * @tc.desc    Test FloatBox default constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const box: FloatBox = new FloatBox();
        const result: float = box.get();
        expect(result).assertEqual(0.0.toFloat());
      } catch (error) {

      }
    });

    /**
     * @tc.name    builtinsFloatBoxConstructorWithParamText0009
     * @tc.number  BUILTINS_FLOAT_BOX_CONSTRUCTOR_WITH_PARAM_TEXT_0009
     * @tc.desc    Test multiple FloatBox default constructor instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxConstructorWithParamText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const box1: FloatBox = new FloatBox();
        const box2: FloatBox = new FloatBox();
        const box3: FloatBox = new FloatBox();

        expect(box1.get()).assertEqual(0.0.toFloat());
        expect(box2.get()).assertEqual(0.0.toFloat());
        expect(box3.get()).assertEqual(0.0.toFloat());
      } catch (error) {
        console.error(`Test case builtinsFloatBoxConstructorTest1100 failed: ${error.message}`);
      }
    });
  })
}
