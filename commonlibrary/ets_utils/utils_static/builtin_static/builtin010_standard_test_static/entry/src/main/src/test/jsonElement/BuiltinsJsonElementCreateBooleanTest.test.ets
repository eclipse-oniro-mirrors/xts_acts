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

export default function builtinsJsonElementCreateBooleanTest() {
  describe("builtinsJsonElementCreateBooleanTest", () => {
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
     * @tc.name    builtinsJsonElementCreateBooleanTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0001
     * @tc.desc    Test JsonElement.createBoolean with true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createBoolean(true);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
        expect(element.asBoolean()).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0002
     * @tc.desc    Test JsonElement.createBoolean with false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createBoolean(false);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
        expect(element.asBoolean()).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0003
     * @tc.desc    Test JsonElement.createBoolean with Boolean(0) = false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value = Boolean(0);
        const element = jsonx.JsonElement.createBoolean(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
        expect(element.asBoolean()).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0004
     * @tc.desc    Test JsonElement.createBoolean with Boolean(NaN) = false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value = Boolean(NaN);
        const element = jsonx.JsonElement.createBoolean(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
        expect(element.asBoolean()).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0005
     * @tc.desc    Test JsonElement.createBoolean with Boolean("") = false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value = Boolean("");
        const element = jsonx.JsonElement.createBoolean(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
        expect(element.asBoolean()).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0006
     * @tc.desc    Test JsonElement.createBoolean with Boolean(null) = false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value = Boolean(null);
        const element = jsonx.JsonElement.createBoolean(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
        expect(element.asBoolean()).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0007
     * @tc.desc    Test JsonElement.createBoolean with Boolean(undefined) = false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value = Boolean(undefined);
        const element = jsonx.JsonElement.createBoolean(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
        expect(element.asBoolean()).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0008
     * @tc.desc    Test JsonElement.createBoolean with !'s' = false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value = !'s';
        const element = jsonx.JsonElement.createBoolean(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
        expect(element.asBoolean()).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0009
     * @tc.desc    Test JsonElement.createBoolean with !0 = true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const value = !0;
        const element = jsonx.JsonElement.createBoolean(value);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
        expect(element.asBoolean()).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementCreateBooleanTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_BOOLEAN_TEST_0010
     * @tc.desc    Test JsonElement.createBoolean independence (modify instances)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBooleanTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element1 = jsonx.JsonElement.createBoolean(true);
        const element2 = jsonx.JsonElement.createBoolean(true);

        element1.setBoolean(false);

        expect(element1.asBoolean()).assertFalse();
        expect(element2.asBoolean()).assertTrue();
        expect(element1 !== element2).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

  })
}