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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
export default function builtinsBooleanBoxConstructorText() {
  describe("builtinsBooleanBoxConstructorText", () => {
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
     * @tc.name    builtinsBooleanBoxConstructorText0001
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0001
     * @tc.desc    Test BooleanBox constructor with true parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox(true);
      const result: boolean = box.get();
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0002
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0002
     * @tc.desc    Test BooleanBox constructor with false parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox(false);
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0003
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0003
     * @tc.desc    Test BooleanBox constructor with 0 converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue: boolean = Boolean(0);
      const box = new BooleanBox(boolValue);
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0004
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0004
     * @tc.desc    Test BooleanBox constructor with NaN converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue: boolean = Boolean(NaN);
      const box = new BooleanBox(boolValue);
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0005
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0005
     * @tc.desc    Test BooleanBox constructor with empty string converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue: boolean = Boolean("");
      const box = new BooleanBox(boolValue);
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0006
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0006
     * @tc.desc    Test BooleanBox constructor with null converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue: boolean = Boolean(null);
      const box = new BooleanBox(boolValue);
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0007
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0007
     * @tc.desc    Test BooleanBox constructor with undefined converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue: boolean = Boolean(undefined);
      const box = new BooleanBox(boolValue);
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0008
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0008
     * @tc.desc    Test BooleanBox constructor with !'s' operation result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue: boolean = !'s';
      const box = new BooleanBox(boolValue);
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0009
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0009
     * @tc.desc    Test BooleanBox constructor with !0 operation result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue: boolean = !0;
      const box = new BooleanBox(boolValue);
      const result: boolean = box.get();
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0010
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0010
     * @tc.desc    Test BooleanBox constructor without parameters initializes value to false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const result: boolean = box.get();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxConstructorText0011
     * @tc.number  BUILTINS_BOOLEAN_BOX_CONSTRUCTOR_TEXT_0011
     * @tc.desc    Test BooleanBox constructor without parameters instances are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxConstructorText0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box1 = new BooleanBox();
      const box2 = new BooleanBox();
      expect(box1.get()).assertFalse();
      expect(box2.get()).assertFalse();
      box1.set(true);
      box2.set(false);
      expect(box1.get()).assertTrue();
      expect(box2.get()).assertFalse();
    });
  })
}