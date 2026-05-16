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
export default function builtinsBooleanBoxSetText() {
  describe("builtinsBooleanBoxSetText", () => {
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
     * @tc.name    builtinsBooleanBoxSetText0001
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0001
     * @tc.desc    Test BooleanBox set method with true value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const setResult: boolean = box.set(true);
      expect(setResult).assertTrue();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0002
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0002
     * @tc.desc    Test BooleanBox set method with false value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const setResult: boolean = box.set(false);
      expect(setResult).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0003
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0003
     * @tc.desc    Test BooleanBox set method with 0 converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const boolValue: boolean = Boolean(0);
      const setResult: boolean = box.set(boolValue);
      expect(setResult).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0004
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0004
     * @tc.desc    Test BooleanBox set method with NaN converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const boolValue: boolean = Boolean(NaN);
      const setResult: boolean = box.set(boolValue);
      expect(setResult).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0005
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0005
     * @tc.desc    Test BooleanBox set method with empty string converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const boolValue: boolean = Boolean("");
      const setResult: boolean = box.set(boolValue);
      expect(setResult).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0006
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0006
     * @tc.desc    Test BooleanBox set method with null converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const boolValue: boolean = Boolean(null);
      const setResult: boolean = box.set(boolValue);
      expect(setResult).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0007
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0007
     * @tc.desc    Test BooleanBox set method with undefined converted to boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const boolValue: boolean = Boolean(undefined);
      const setResult: boolean = box.set(boolValue);
      expect(setResult).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0008
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0008
     * @tc.desc    Test BooleanBox set method with !'s' operation result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const boolValue: boolean = !'s';
      const setResult: boolean = box.set(boolValue);
      expect(setResult).assertFalse();
    });

    /**
     * @tc.name    builtinsBooleanBoxSetText0009
     * @tc.number  BUILTINS_BOOLEAN_BOX_SET_TEXT_0009
     * @tc.desc    Test BooleanBox set method with !0 operation result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBooleanBoxSetText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new BooleanBox();
      const boolValue: boolean = !0;
      const setResult: boolean = box.set(boolValue);
      expect(setResult).assertTrue();
    });
  })
}