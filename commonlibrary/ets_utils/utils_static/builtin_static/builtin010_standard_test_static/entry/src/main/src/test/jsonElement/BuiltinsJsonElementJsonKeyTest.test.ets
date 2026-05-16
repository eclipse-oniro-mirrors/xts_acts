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

export default function builtinsJsonElementJsonKeyTest() {
  describe("builtinsJsonElementJsonKeyTest", () => {
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
     * @tc.name    builtinsJsonElementJsonKeyTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0001
     * @tc.desc    Test JsonElement default jsonKey (should be empty string)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(new jsonx.JsonElement().jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0002
     * @tc.desc    Test JsonElement jsonKey for string element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createString("test").jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0003
     * @tc.desc    Test JsonElement jsonKey for double element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createDouble(123.456).jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0004
     * @tc.desc    Test JsonElement jsonKey for integer element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createInteger(123).jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0005
     * @tc.desc    Test JsonElement jsonKey for boolean true element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createBoolean(true).jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0006
     * @tc.desc    Test JsonElement jsonKey for boolean false element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createBoolean(false).jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0007
     * @tc.desc    Test JsonElement jsonKey for null element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createNull().jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0008
     * @tc.desc    Test JsonElement jsonKey for undefined element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createUndefined().jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0009
     * @tc.desc    Test JsonElement jsonKey for array element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = [jsonx.JsonElement.createString("test")];
      expect(jsonx.JsonElement.createArray(arr).jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0010
     * @tc.desc    Test JsonElement jsonKey for object element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map = new Map<string, jsonx.JsonElement>();
      map.set("key", jsonx.JsonElement.createString("value"));
      expect(jsonx.JsonElement.createObject(map).jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0011
     * @tc.desc    Test JsonElement jsonKey with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createArray([]).jsonKey).assertEqual("");
    });

    /**
     * @tc.name    builtinsJsonElementJsonKeyTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_KEY_TEST_0012
     * @tc.desc    Test JsonElement jsonKey with empty object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonKeyTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        expect(element.jsonKey).assertEqual("");
      } catch (error) {
        throw error;
      }
    });

  })
}