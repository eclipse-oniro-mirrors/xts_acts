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

export default function builtinsJsonElementCreateIntegerTest() {
  describe("builtinsJsonElementCreateIntegerTest", () => {
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
     * @tc.name    builtinsJsonElementCreateIntegerTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0001
     * @tc.desc    Test JsonElement.createInteger with value 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createInteger(0);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(element.asInteger()).assertEqual(0);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateIntegerTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0002
     * @tc.desc    Test JsonElement.createInteger with positive value 2147483647 (max int)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createInteger(2147483647);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(element.asInteger()).assertEqual(2147483647);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateIntegerTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0003
     * @tc.desc    Test JsonElement.createInteger with negative value -2147483648 (min int)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createInteger(-2147483648);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(element.asInteger()).assertEqual(-2147483648);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateIntegerTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0004
     * @tc.desc    Test JsonElement.createInteger with positive value 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createInteger(1);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(element.asInteger()).assertEqual(1);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateIntegerTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0005
     * @tc.desc    Test JsonElement.createInteger with negative value -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createInteger(-1);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(element.asInteger()).assertEqual(-1);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateIntegerTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0006
     * @tc.desc    Test JsonElement.createInteger with positive boundary value 2147483646 (max-1)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createInteger(2147483646);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(element.asInteger()).assertEqual(2147483646);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateIntegerTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0007
     * @tc.desc    Test JsonElement.createInteger with negative boundary value -2147483647 (min+1)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createInteger(-2147483647);
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
        expect(element.asInteger()).assertEqual(-2147483647);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateIntegerTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_INTEGER_TEST_0008
     * @tc.desc    Test JsonElement.createInteger multiple independent instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateIntegerTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const a = jsonx.JsonElement.createInteger(100);
        const b = jsonx.JsonElement.createInteger(200);
        expect(a.asInteger()).assertEqual(100);
        expect(b.asInteger()).assertEqual(200);
        a.setInteger(300);
        expect(a.asInteger()).assertEqual(300);
        expect(b.asInteger()).assertEqual(200);
      } catch (error) { throw error; }
    });
  })
}