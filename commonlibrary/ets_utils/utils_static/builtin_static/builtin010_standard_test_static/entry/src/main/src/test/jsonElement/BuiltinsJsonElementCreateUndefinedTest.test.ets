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

export default function builtinsJsonElementCreateUndefinedTest() {
  describe("builtinsJsonElementCreateUndefinedTest", () => {
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
     * @tc.name    builtinsJsonElementCreateUndefinedTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_UNDEFINED_TEST_0001
     * @tc.desc    Test JsonElement.createUndefined normal case
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateUndefinedTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem = jsonx.JsonElement.createUndefined();
      expect(elem.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      try { elem.asString(); } catch (e) {
        expect(e instanceof jsonx.JsonTypeError).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateUndefinedTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_UNDEFINED_TEST_0002
     * @tc.desc    Test multiple createUndefined instances are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateUndefinedTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a = jsonx.JsonElement.createUndefined();
      const b = jsonx.JsonElement.createUndefined();
      expect(a !== b).assertTrue();
      expect(a.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      expect(b.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name    builtinsJsonElementCreateUndefinedTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_UNDEFINED_TEST_0003
     * @tc.desc    Test createUndefined -> setString -> setUndefined round-trip
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateUndefinedTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem = jsonx.JsonElement.createUndefined();
      elem.setString("tmp");
      expect(elem.jsonType).assertEqual(jsonx.JsonType.JsonString);
      elem.setUndefined();
      expect(elem.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name    builtinsJsonElementCreateUndefinedTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_UNDEFINED_TEST_0004
     * @tc.desc    Test createUndefined independence after state transition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateUndefinedTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a = jsonx.JsonElement.createUndefined();
      const b = jsonx.JsonElement.createUndefined();
      a.setInteger(123);
      expect(a.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(b.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

  })
}
