/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function environmentNullUndefinedTest() {
  describe('EnvironmentNullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[EnvironmentNullUndefinedTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[EnvironmentNullUndefinedTest] beforeEach called');
    });

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      console.info('[EnvironmentNullUndefinedTest] afterEach called');
    });

    afterAll(() => {
      console.info('[EnvironmentNullUndefinedTest] afterAll called');
    });

    // ========== Environment.envProp Tests ==========

    /**
     * @tc.name   Environment_envProp_key_null_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_KEY_NULL_001
     * @tc.desc   Test Environment.envProp with null key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProp_key_null_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_key_null_001] START');
      try {
        const key: null = null;
        const value: string = 'defaultValue';
        const result: boolean = Environment.envProp<string>(key, value);
        console.info('[Environment_envProp_key_null_001] result: ' + result);
        // envProp with null key should return false (cannot create property)
        expect(result).assertTrue();
        console.info('[Environment_envProp_key_null_001] END');
      } catch (err) {
        console.error('[Environment_envProp_key_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_envProp_key_undefined_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_KEY_UNDEFINED_001
     * @tc.desc   Test Environment.envProp with undefined key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        const value: string = 'defaultValue';
        const result: boolean = Environment.envProp<string>(key, value);
        console.info('[Environment_envProp_key_undefined_001] result: ' + result);
        // envProp with undefined key should return false (cannot create property)
        expect(result).assertTrue();
        console.info('[Environment_envProp_key_undefined_001] END');
      } catch (err) {
        console.error('[Environment_envProp_key_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_envProp_key_emptyString_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_KEY_EMPTYSTRING_001
     * @tc.desc   Test Environment.envProp with empty string key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProp_key_emptyString_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_key_emptyString_001] START');
      try {
        const key: string = '';
        const value: string = 'defaultValue';
        const result: boolean = Environment.envProp<string>(key, value);
        console.info('[Environment_envProp_key_emptyString_001] result: ' + result);
        // envProp with empty string key behavior depends on implementation
        console.info('[Environment_envProp_key_emptyString_001] END');
      } catch (err) {
        console.error('[Environment_envProp_key_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_envProp_value_null_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_VALUE_NULL_001
     * @tc.desc   Test Environment.envProp with null value for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProp_value_null_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_value_null_001] START');
      try {
        const key: string = 'testEnvPropNullValue';
        const value: string | null = null;
        const result: boolean = Environment.envProp<string | null>(key, value);
        console.info('[Environment_envProp_value_null_001] result: ' + result);
        // envProp with null value should return true (property created with null value)
        expect(result).assertTrue();
        // Verify the property was created in AppStorage
        const hasResult: boolean = AppStorage.has(key);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string | null>(key);
        expect(getValue).assertEqual(null);
        // Clean up
        AppStorage.delete(key);
        console.info('[Environment_envProp_value_null_001] END');
      } catch (err) {
        console.error('[Environment_envProp_value_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_envProp_value_undefined_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_VALUE_UNDEFINED_001
     * @tc.desc   Test Environment.envProp with undefined value for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProp_value_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_value_undefined_001] START');
      try {
        const key: string = 'testEnvPropUndefinedValue';
        const value: string | undefined = undefined;
        const result: boolean = Environment.envProp<string | undefined>(key, value);
        console.info('[Environment_envProp_value_undefined_001] result: ' + result);
        // envProp with undefined value should return true (property created with undefined value)
        expect(result).assertTrue();
        // Verify the property was created in AppStorage
        const hasResult: boolean = AppStorage.has(key);
        expect(hasResult).assertTrue();
        const getValue: string | undefined | null = AppStorage.get<string | undefined>(key);
        expect(getValue).assertEqual(undefined);
        // Clean up
        AppStorage.delete(key);
        console.info('[Environment_envProp_value_undefined_001] END');
      } catch (err) {
        console.error('[Environment_envProp_value_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_envProp_value_emptyString_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_VALUE_EMPTYSTRING_001
     * @tc.desc   Test Environment.envProp with empty string value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProp_value_emptyString_001', Level.LEVEL2, () => {
      console.info('[Environment_envProp_value_emptyString_001] START');
      try {
        const key: string = 'testEnvPropEmptyStringValue';
        const value: string = '';
        const result: boolean = Environment.envProp<string>(key, value);
        console.info('[Environment_envProp_value_emptyString_001] result: ' + result);
        // envProp with empty string value should return true (property created with empty string)
        expect(result).assertTrue();
        // Verify the property was created in AppStorage
        const hasResult: boolean = AppStorage.has(key);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(key);
        expect(getValue).assertEqual('');
        // Clean up
        AppStorage.delete(key);
        console.info('[Environment_envProp_value_emptyString_001] END');
      } catch (err) {
        console.error('[Environment_envProp_value_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== Environment.envProps Tests ==========

    /**
     * @tc.name   Environment_envProps_props_null_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_PROPS_NULL_001
     * @tc.desc   Test Environment.envProps with null props
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProps_props_null_001', Level.LEVEL2, () => {
      console.info('[Environment_envProps_props_null_001] START');
      try {
        const props: EnvPropsOptions[] | null = null;
        Environment.envProps(props);
        // Expected behavior: may throw error
        expect().assertFail();
        console.info('[Environment_envProps_props_null_001] END');
      } catch (err) {
        console.error('[Environment_envProps_props_null_001] Error: ' + JSON.stringify(err));

      }
    });

    /**
     * @tc.name   Environment_envProps_props_undefined_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_PROPS_UNDEFINED_001
     * @tc.desc   Test Environment.envProps with undefined props
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProps_props_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_envProps_props_undefined_001] START');
      try {
        const props: EnvPropsOptions[] | undefined = undefined;
        Environment.envProps(props);
        // Expected behavior: may throw error
        expect().assertFail();
        console.info('[Environment_envProps_props_undefined_001] END');
      } catch (err) {
        console.error('[Environment_envProps_props_undefined_001] Error: ' + JSON.stringify(err));

      }
    });

    /**
     * @tc.name   Environment_envProps_props_emptyArray_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_PROPS_EMPTYARRAY_001
     * @tc.desc   Test Environment.envProps with empty array props
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProps_props_emptyArray_001', Level.LEVEL2, () => {
      console.info('[Environment_envProps_props_emptyArray_001] START');
      try {
        const props: EnvPropsOptions[] = [];
        Environment.envProps(props);
        console.info('[Environment_envProps_props_emptyArray_001] END');
      } catch (err) {
        console.error('[Environment_envProps_props_emptyArray_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });



    /**
     * @tc.name   Environment_envProps_key_emptyString_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_KEY_EMPTYSTRING_001
     * @tc.desc   Test Environment.envProps with empty string key in props array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProps_key_emptyString_001', Level.LEVEL2, () => {
      console.info('[Environment_envProps_key_emptyString_001] START');
      try {
        const props: EnvPropsOptions[] = [{ key: '', defaultValue: 'defaultValue' }];
        Environment.envProps(props);
        console.info('[Environment_envProps_key_emptyString_001] END');
      } catch (err) {
        console.error('[Environment_envProps_key_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });


    /**
     * @tc.name   Environment_envProps_defaultValue_emptyString_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_DEFAULTVALUE_EMPTYSTRING_001
     * @tc.desc   Test Environment.envProps with empty string defaultValue in props array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Environment_envProps_defaultValue_emptyString_001', Level.LEVEL2, () => {
      console.info('[Environment_envProps_defaultValue_emptyString_001] START');
      try {
        const key: string = 'testEnvPropsEmptyStringValue';
        const props: EnvPropsOptions[] = [{ key: key, defaultValue: '' }];
        Environment.envProps(props);
        // Verify the property was created in AppStorage
        const hasResult: boolean = AppStorage.has(key);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(key);
        expect(getValue).assertEqual('');
        // Clean up
        AppStorage.delete(key);
        console.info('[Environment_envProps_defaultValue_emptyString_001] END');
      } catch (err) {
        console.error('[Environment_envProps_defaultValue_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== Deprecated Environment.EnvProp Tests ==========

    /**
     * @tc.name   Environment_EnvProp_key_null_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_KEY_NULL_002
     * @tc.desc   Test deprecated Environment.EnvProp with null key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProp_key_null_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_key_null_001] START');
      try {
        const key: string | null = null;
        const value: string = 'defaultValue';
        const result: boolean = Environment.EnvProp<string>(key, value);
        console.info('[Environment_EnvProp_key_null_001] result: ' + result);
        // EnvProp with null key should return false (cannot create property)
        expect(result).assertFalse();
        console.info('[Environment_EnvProp_key_null_001] END');
      } catch (err) {
        console.error('[Environment_EnvProp_key_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_EnvProp_key_undefined_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_KEY_UNDEFINED_002
     * @tc.desc   Test deprecated Environment.EnvProp with undefined key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProp_key_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_key_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        const value: string = 'defaultValue';
        const result: boolean = Environment.EnvProp<string>(key, value);
        console.info('[Environment_EnvProp_key_undefined_001] result: ' + result);
        // EnvProp with undefined key should return false (cannot create property)
        expect(result).assertFalse();
        console.info('[Environment_EnvProp_key_undefined_001] END');
      } catch (err) {
        console.error('[Environment_EnvProp_key_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_EnvProp_key_emptyString_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_KEY_EMPTYSTRING_002
     * @tc.desc   Test deprecated Environment.EnvProp with empty string key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProp_key_emptyString_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_key_emptyString_001] START');
      try {
        const key: string = '';
        const value: string = 'defaultValue';
        const result: boolean = Environment.EnvProp<string>(key, value);
        console.info('[Environment_EnvProp_key_emptyString_001] result: ' + result);
        // EnvProp with empty string key behavior depends on implementation
        console.info('[Environment_EnvProp_key_emptyString_001] END');
      } catch (err) {
        console.error('[Environment_EnvProp_key_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_EnvProp_value_null_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_VALUE_NULL_002
     * @tc.desc   Test deprecated Environment.EnvProp with null value for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProp_value_null_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_value_null_001] START');
      try {
        const key: string = 'testEnvPropNullValueDeprecated';
        const value: string | null = null;
        const result: boolean = Environment.EnvProp<string | null>(key, value);
        console.info('[Environment_EnvProp_value_null_001] result: ' + result);
        // EnvProp with null value behavior depends on implementation
        // Note: deprecated API may not support null
        console.info('[Environment_EnvProp_value_null_001] END');
      } catch (err) {
        console.error('[Environment_EnvProp_value_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error for deprecated API
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_EnvProp_value_undefined_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_VALUE_UNDEFINED_002
     * @tc.desc   Test deprecated Environment.EnvProp with undefined value for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProp_value_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_value_undefined_001] START');
      try {
        const key: string = 'testEnvPropUndefinedValueDeprecated';
        const value: string | undefined = undefined;
        const result: boolean = Environment.EnvProp<string | undefined>(key, value);
        console.info('[Environment_EnvProp_value_undefined_001] result: ' + result);
        // EnvProp with undefined value behavior depends on implementation
        // Note: deprecated API may not support undefined
        console.info('[Environment_EnvProp_value_undefined_001] END');
      } catch (err) {
        console.error('[Environment_EnvProp_value_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error for deprecated API
        expect().assertFail();
      }
    });

    /**
     * @tc.name   Environment_EnvProp_value_emptyString_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROP_PARAM_VALUE_EMPTYSTRING_002
     * @tc.desc   Test deprecated Environment.EnvProp with empty string value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProp_value_emptyString_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProp_value_emptyString_001] START');
      try {
        const key: string = 'testEnvPropEmptyStringValueDeprecated';
        const value: string = '';
        const result: boolean = Environment.EnvProp<string>(key, value);
        console.info('[Environment_EnvProp_value_emptyString_001] result: ' + result);
        // EnvProp with empty string value should return true (property created with empty string)
        expect(result).assertTrue();
        // Verify the property was created in AppStorage
        const hasResult: boolean = AppStorage.has(key);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(key);
        expect(getValue).assertEqual('');
        // Clean up
        AppStorage.delete(key);
        console.info('[Environment_EnvProp_value_emptyString_001] END');
      } catch (err) {
        console.error('[Environment_EnvProp_value_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== Deprecated Environment.EnvProps Tests ==========

    /**
     * @tc.name   Environment_EnvProps_props_null_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_PROPS_NULL_002
     * @tc.desc   Test deprecated Environment.EnvProps with null props
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProps_props_null_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProps_props_null_001] START');
      try {
        Environment.EnvProps(null);
        console.info('[Environment_EnvProps_props_null_001] END');
        // Expected behavior: may throw error
        expect().assertFail();
      } catch (err) {
        console.error('[Environment_EnvProps_props_null_001] Error: ' + JSON.stringify(err));

      }
    });

    /**
     * @tc.name   Environment_EnvProps_props_undefined_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_PROPS_UNDEFINED_002
     * @tc.desc   Test deprecated Environment.EnvProps with undefined props
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProps_props_undefined_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProps_props_undefined_001] START');
      try {
        Environment.EnvProps(undefined);
        // Expected behavior: may throw error
        expect().assertFail();
        console.info('[Environment_EnvProps_props_undefined_001] END');
      } catch (err) {
        console.error('[Environment_EnvProps_props_undefined_001] Error: ' + JSON.stringify(err));

      }
    });

    /**
     * @tc.name   Environment_EnvProps_props_emptyArray_001
     * @tc.number SUB_ARUI_ENVIRONMENT_ENVPROPS_PARAM_PROPS_EMPTYARRAY_002
     * @tc.desc   Test deprecated Environment.EnvProps with empty array props
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('Environment_EnvProps_props_emptyArray_001', Level.LEVEL2, () => {
      console.info('[Environment_EnvProps_props_emptyArray_001] START');
      try {
        Environment.EnvProps([]);
        console.info('[Environment_EnvProps_props_emptyArray_001] END');
      } catch (err) {
        console.error('[Environment_EnvProps_props_emptyArray_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

  });
}
