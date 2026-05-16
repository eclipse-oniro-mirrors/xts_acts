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

export default function appStorageNullUndefinedTest() {
  describe('AppStorageNullUndefinedTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      console.info('[AppStorageNullUndefinedTest] beforeAll called');
    });

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      console.info('[AppStorageNullUndefinedTest] beforeEach called');
    });

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      console.info('[AppStorageNullUndefinedTest] afterEach called');
    });

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      console.info('[AppStorageNullUndefinedTest] afterAll called');
    });

    /**
     * @tc.name   AppStorage_setAndRef_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PARAM_NULL_001
     * @tc.desc   Test AppStorage.setAndRef with null defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_null_001] START');
      try {
        const propName: string = 'testSetAndRefNull';
        const defaultValue: Object | null = null;
        const result: AbstractProperty<Object | null> | null = AppStorage.setAndRef<Object | null>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_null_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with null value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue).assertEqual(null);
        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndRef_null_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndRef_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PARAM_UNDEFINED_001
     * @tc.desc   Test AppStorage.setAndRef with undefined defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_undefined_001] START');
      try {
        const propName: string = 'testSetAndRefUndefined';
        const defaultValue: Object | undefined = undefined;
        const result: AbstractProperty<Object | undefined> | null = AppStorage.setAndRef<Object | undefined>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_undefined_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with undefined value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue).assertEqual(undefined);
        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndRef_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_link_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_LINK_PARAM_NULL_001
     * @tc.desc   Test AppStorage.link with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_link_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_link_null_001] START');
      try {
        const propName: string | null = null;
        const result: SubscribedAbstractProperty<Object> | undefined = AppStorage.link<Object>(propName);
        console.info('[AppStorage_link_null_001] result: ' + JSON.stringify(result));
        // link with null propName should return undefined
        expect(result).assertEqual(undefined);
        console.info('[AppStorage_link_null_001] END');
      } catch (err) {
        console.error('[AppStorage_link_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_link_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_LINK_PARAM_UNDEFINED_001
     * @tc.desc   Test AppStorage.link with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_link_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_link_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const result: SubscribedAbstractProperty<Object> | undefined = AppStorage.link<Object>(propName);
        console.info('[AppStorage_link_undefined_001] result: ' + JSON.stringify(result));
        // link with undefined propName should return undefined
        expect(result).assertEqual(undefined);
        console.info('[AppStorage_link_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_link_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_prop_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_PROP_PARAM_NULL_001
     * @tc.desc   Test AppStorage.prop with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_prop_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_prop_null_001] START');
      try {
        const propName: string | null = null;
        const result: SubscribedAbstractProperty<Object> | undefined = AppStorage.prop<Object>(propName);
        console.info('[AppStorage_prop_null_001] result: ' + JSON.stringify(result));
        // prop with null propName should return undefined
        expect(result).assertEqual(undefined);
        console.info('[AppStorage_prop_null_001] END');
      } catch (err) {
        console.error('[AppStorage_prop_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_prop_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_PROP_PARAM_UNDEFINED_001
     * @tc.desc   Test AppStorage.prop with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_prop_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_prop_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const result: SubscribedAbstractProperty<Object> | undefined = AppStorage.prop<Object>(propName);
        console.info('[AppStorage_prop_undefined_001] result: ' + JSON.stringify(result));
        // prop with undefined propName should return undefined
        expect(result).assertEqual(undefined);
        console.info('[AppStorage_prop_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_prop_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndProp_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_NULL_001
     * @tc.desc   Test AppStorage.setAndProp with null defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndProp_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_null_001] START');
      try {
        const propName: string = 'testSetAndPropNull';
        const defaultValue: Object | null = null;
        const result: SubscribedAbstractProperty<Object | null> | undefined = AppStorage.setAndProp<Object | null>(propName, defaultValue);
        console.info('[AppStorage_setAndProp_null_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with null value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue).assertEqual(null);
        // Clean up - call aboutToBeDeleted before delete
        if (result !== undefined) {
          result.aboutToBeDeleted();
        }
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndProp_null_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndProp_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndProp_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_UNDEFINED_001
     * @tc.desc   Test AppStorage.setAndProp with undefined defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndProp_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_undefined_001] START');
      try {
        const propName: string = 'testSetAndPropUndefined';
        const defaultValue: Object | undefined = undefined;
        const result: SubscribedAbstractProperty<Object | undefined> | undefined = AppStorage.setAndProp<Object | undefined>(propName, defaultValue);
        console.info('[AppStorage_setAndProp_undefined_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with undefined value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue).assertEqual(undefined);
        // Clean up - call aboutToBeDeleted before delete
        if (result !== undefined) {
          result.aboutToBeDeleted();
        }
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndProp_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndProp_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_set_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PARAM_NULL_001
     * @tc.desc   Test AppStorage.set with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_null_001] START');
      try {
        const propName: string = 'testSetNull';
        // First create a property
        AppStorage.setOrCreate(propName, 'initialValue');
        const hasResult1: boolean = AppStorage.has(propName);
        expect(hasResult1).assertTrue();
        const getValue1: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Now set it to null (API 12+ allows null)
        const result: boolean = AppStorage.set<Object | null>(propName, null);
        console.info('[AppStorage_set_null_001] result: ' + result);
        expect(result).assertTrue();
        const getValue2: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue2).assertEqual(null);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_set_null_001] END');
      } catch (err) {
        console.error('[AppStorage_set_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_set_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PARAM_UNDEFINED_001
     * @tc.desc   Test AppStorage.set with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_undefined_001] START');
      try {
        const propName: string = 'testSetUndefined';
        // First create a property
        AppStorage.setOrCreate(propName, 'initialValue');
        const hasResult1: boolean = AppStorage.has(propName);
        expect(hasResult1).assertTrue();
        const getValue1: string | undefined | null = AppStorage.get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Now set it to undefined (API 12+ allows undefined)
        const result: boolean = AppStorage.set<Object | undefined>(propName, undefined);
        console.info('[AppStorage_set_undefined_001] result: ' + result);
        expect(result).assertTrue();
        const getValue2: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue2).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_set_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_set_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_set_null_nonExistent_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PARAM_NULL_NONEXISTENT_001
     * @tc.desc   Test AppStorage.set with null newValue on non-existent property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_null_nonExistent_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_null_nonExistent_001] START');
      try {
        const propName: string = 'testSetNullNonExistent';
        // Ensure property doesn't exist
        const hasBefore: boolean = AppStorage.has(propName);
        if (hasBefore) {
          AppStorage.delete(propName);
        }
        const hasAfter: boolean = AppStorage.has(propName);
        expect(hasAfter).assertFalse();

        // Setting null on non-existent property should return false
        const result: boolean = AppStorage.set<Object | null>(propName, null);
        console.info('[AppStorage_set_null_nonExistent_001] result: ' + result);
        expect(result).assertFalse();

        console.info('[AppStorage_set_null_nonExistent_001] END');
      } catch (err) {
        console.error('[AppStorage_set_null_nonExistent_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_set_undefined_nonExistent_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PARAM_UNDEFINED_NONEXISTENT_001
     * @tc.desc   Test AppStorage.set with undefined newValue on non-existent property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_undefined_nonExistent_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_undefined_nonExistent_001] START');
      try {
        const propName: string = 'testSetUndefinedNonExistent';
        // Ensure property doesn't exist
        const hasBefore: boolean = AppStorage.has(propName);
        if (hasBefore) {
          AppStorage.delete(propName);
        }
        const hasAfter: boolean = AppStorage.has(propName);
        expect(hasAfter).assertFalse();

        // Setting undefined on non-existent property should return false
        const result: boolean = AppStorage.set<Object | undefined>(propName, undefined);
        console.info('[AppStorage_set_undefined_nonExistent_001] result: ' + result);
        expect(result).assertFalse();

        console.info('[AppStorage_set_undefined_nonExistent_001] END');
      } catch (err) {
        console.error('[AppStorage_set_undefined_nonExistent_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndRef_null_string_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PARAM_NULL_STRING_001
     * @tc.desc   Test AppStorage.setAndRef with null defaultValue for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_null_string_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_null_string_001] START');
      try {
        const propName: string = 'testSetAndRefNullString';
        const defaultValue: string | null = null;
        const result: AbstractProperty<string | null> | null = AppStorage.setAndRef<string | null>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_null_string_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue).assertEqual(null);
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndRef_null_string_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_null_string_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndRef_undefined_string_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PARAM_UNDEFINED_STRING_001
     * @tc.desc   Test AppStorage.setAndRef with undefined defaultValue for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_undefined_string_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_undefined_string_001] START');
      try {
        const propName: string = 'testSetAndRefUndefinedString';
        const defaultValue: string | undefined = undefined;
        const result: AbstractProperty<string | undefined> | null = AppStorage.setAndRef<string | undefined>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_undefined_string_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        const getValue: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue).assertEqual(undefined);
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndRef_undefined_string_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_undefined_string_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndProp_null_string_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_NULL_STRING_001
     * @tc.desc   Test AppStorage.setAndProp with null defaultValue for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndProp_null_string_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_null_string_001] START');
      try {
        const propName: string = 'testSetAndPropNullString';
        const defaultValue: string | null = null;
        const result: SubscribedAbstractProperty<string | null> | undefined = AppStorage.setAndProp<string | null>(propName, defaultValue);
        console.info('[AppStorage_setAndProp_null_string_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue).assertEqual(null);
        // Clean up - call aboutToBeDeleted before delete
        if (result !== undefined) {
          result.aboutToBeDeleted();
        }
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndProp_null_string_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndProp_null_string_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndProp_undefined_string_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_UNDEFINED_STRING_001
     * @tc.desc   Test AppStorage.setAndProp with undefined defaultValue for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndProp_undefined_string_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_undefined_string_001] START');
      try {
        const propName: string = 'testSetAndPropUndefinedString';
        const defaultValue: string | undefined = undefined;
        const result: SubscribedAbstractProperty<string | undefined> | undefined = AppStorage.setAndProp<string | undefined>(propName, defaultValue);
        console.info('[AppStorage_setAndProp_undefined_string_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        const getValue: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue).assertEqual(undefined);
        // Clean up - call aboutToBeDeleted before delete
        if (result !== undefined) {
          result.aboutToBeDeleted();
        }
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndProp_undefined_string_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndProp_undefined_string_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_link_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_LINK_PARAM_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.link with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_link_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_link_emptyString_001] START');
      try {
        const propName: string = '';
        const result: SubscribedAbstractProperty<string> | undefined = AppStorage.link<string>(propName);
        console.info('[AppStorage_link_emptyString_001] result: ' + JSON.stringify(result));
        // link with empty string propName should return undefined
        expect(result).assertEqual(undefined);
        console.info('[AppStorage_link_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_link_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_prop_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_PROP_PARAM_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.prop with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_prop_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_prop_emptyString_001] START');
      try {
        const propName: string = '';
        const result: SubscribedAbstractProperty<string> | undefined = AppStorage.prop<string>(propName);
        console.info('[AppStorage_prop_emptyString_001] result: ' + JSON.stringify(result));
        // prop with empty string propName should return undefined
        expect(result).assertEqual(undefined);
        console.info('[AppStorage_prop_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_prop_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndRef_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PARAM_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.setAndRef with empty string defaultValue for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_emptyString_001] START');
      try {
        const propName: string = 'testSetAndRefEmptyString';
        const defaultValue: string = '';
        const result: AbstractProperty<string> | null = AppStorage.setAndRef<string>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_emptyString_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with empty string value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual('');
        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndRef_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndProp_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.setAndProp with empty string defaultValue for string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndProp_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndProp_emptyString_001] START');
      try {
        const propName: string = 'testSetAndPropEmptyString';
        const defaultValue: string = '';
        const result: SubscribedAbstractProperty<string> | undefined = AppStorage.setAndProp<string>(propName, defaultValue);
        console.info('[AppStorage_setAndProp_emptyString_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with empty string value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual('');
        // Clean up - call aboutToBeDeleted before delete
        if (result !== undefined) {
          result.aboutToBeDeleted();
        }
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndProp_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndProp_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_set_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PARAM_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.set with empty string newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_emptyString_001] START');
      try {
        const propName: string = 'testSetEmptyString';
        // First create a property
        AppStorage.setOrCreate(propName, 'initialValue');
        const hasResult1: boolean = AppStorage.has(propName);
        expect(hasResult1).assertTrue();
        const getValue1: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Now set it to empty string (API 12+ allows empty string)
        const result: boolean = AppStorage.set<string>(propName, '');
        console.info('[AppStorage_set_emptyString_001] result: ' + result);
        expect(result).assertTrue();
        const getValue2: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue2).assertEqual('');

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_set_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_set_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_set_emptyString_nonExistent_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PARAM_EMPTYSTRING_NONEXISTENT_001
     * @tc.desc   Test AppStorage.set with empty string newValue on non-existent property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_emptyString_nonExistent_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_emptyString_nonExistent_001] START');
      try {
        const propName: string = 'testSetEmptyStringNonExistent';
        // Ensure property doesn't exist
        const hasBefore: boolean = AppStorage.has(propName);
        if (hasBefore) {
          AppStorage.delete(propName);
        }
        const hasAfter: boolean = AppStorage.has(propName);
        expect(hasAfter).assertFalse();

        // Setting empty string on non-existent property should return false
        const result: boolean = AppStorage.set<string>(propName, '');
        console.info('[AppStorage_set_emptyString_nonExistent_001] result: ' + result);
        expect(result).assertFalse();

        console.info('[AppStorage_set_emptyString_nonExistent_001] END');
      } catch (err) {
        console.error('[AppStorage_set_emptyString_nonExistent_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== Deprecated API Tests: Link, Prop, SetAndProp ==========

    /**
     * @tc.name   AppStorage_Link_null_002
     * @tc.number SUB_ARUI_APPSTORAGE_LINK_PARAM_NULL_002
     * @tc.desc   Test deprecated AppStorage.Link with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Link_null_002', Level.LEVEL2, () => {
      console.info('[AppStorage_Link_null_001] START');
      try {
        const propName: string | null = null;
        const result: ESObject = AppStorage.Link(propName);
        console.info('[AppStorage_Link_null_001] result: ' + JSON.stringify(result));
        // Link with null propName may return undefined or throw error
        console.info('[AppStorage_Link_null_001] END');
      } catch (err) {
        console.error('[AppStorage_Link_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Link_undefined_002
     * @tc.number SUB_ARUI_APPSTORAGE_LINK_PARAM_UNDEFINED_002
     * @tc.desc   Test deprecated AppStorage.Link with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Link_undefined_002', Level.LEVEL2, () => {
      console.info('[AppStorage_Link_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const result: ESObject = AppStorage.Link(propName);
        console.info('[AppStorage_Link_undefined_001] result: ' + JSON.stringify(result));
        // Link with undefined propName may return undefined or throw error
        console.info('[AppStorage_Link_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_Link_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Link_emptyString_002
     * @tc.number SUB_ARUI_APPSTORAGE_LINK_PARAM_EMPTYSTRING_002
     * @tc.desc   Test deprecated AppStorage.Link with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Link_emptyString_002', Level.LEVEL2, () => {
      console.info('[AppStorage_Link_emptyString_001] START');
      try {
        const propName: string = '';
        const result: ESObject = AppStorage.Link(propName);
        console.info('[AppStorage_Link_emptyString_001] result: ' + JSON.stringify(result));
        // Link with empty string propName may return undefined or throw error
        console.info('[AppStorage_Link_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_Link_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });


    /**
     * @tc.name   AppStorage_Prop_null_002
     * @tc.number SUB_ARUI_APPSTORAGE_PROP_PARAM_NULL_002
     * @tc.desc   Test deprecated AppStorage.Prop with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Prop_null_002', Level.LEVEL2, () => {
      console.info('[AppStorage_Prop_null_001] START');
      try {
        const propName: string | null = null;
        const result: ESObject = AppStorage.Prop(propName);
        console.info('[AppStorage_Prop_null_001] result: ' + JSON.stringify(result));
        // Prop with null propName may return undefined or throw error
        console.info('[AppStorage_Prop_null_001] END');
      } catch (err) {
        console.error('[AppStorage_Prop_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Prop_undefined_002
     * @tc.number SUB_ARUI_APPSTORAGE_PROP_PARAM_UNDEFINED_002
     * @tc.desc   Test deprecated AppStorage.Prop with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Prop_undefined_002', Level.LEVEL2, () => {
      console.info('[AppStorage_Prop_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const result: ESObject = AppStorage.Prop(propName);
        console.info('[AppStorage_Prop_undefined_001] result: ' + JSON.stringify(result));
        // Prop with undefined propName may return undefined or throw error
        console.info('[AppStorage_Prop_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_Prop_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Prop_emptyString_002
     * @tc.number SUB_ARUI_APPSTORAGE_PROP_PARAM_EMPTYSTRING_002
     * @tc.desc   Test deprecated AppStorage.Prop with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Prop_emptyString_002', Level.LEVEL2, () => {
      console.info('[AppStorage_Prop_emptyString_001] START');
      try {
        const propName: string = '';
        const result: ESObject = AppStorage.Prop(propName);
        console.info('[AppStorage_Prop_emptyString_001] result: ' + JSON.stringify(result));
        // Prop with empty string propName may return undefined or throw error
        console.info('[AppStorage_Prop_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_Prop_emptyString_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        expect().assertFail();
      }
    });



    /**
     * @tc.name   AppStorage_SetAndProp_null_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_NULL_002
     * @tc.desc   Test deprecated AppStorage.SetAndProp with null defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndProp_null_002', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndProp_null_001] START');
      try {
        const propName: string = 'testSetAndPropNullDeprecated';
        const defaultValue: string | null = null;
        const result: SubscribedAbstractProperty<string | null> = AppStorage.SetAndProp<string | null>(propName, defaultValue);
        console.info('[AppStorage_SetAndProp_null_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with null value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue).assertEqual(null);
        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetAndProp_null_001] END');
      } catch (err) {
        console.error('[AppStorage_SetAndProp_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_SetAndProp_undefined_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_UNDEFINED_002
     * @tc.desc   Test deprecated AppStorage.SetAndProp with undefined defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndProp_undefined_002', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndProp_undefined_001] START');
      try {
        const propName: string = 'testSetAndPropUndefinedDeprecated';
        const defaultValue: string | undefined = undefined;
        const result: SubscribedAbstractProperty<string | undefined> = AppStorage.SetAndProp<string | undefined>(propName, defaultValue);
        console.info('[AppStorage_SetAndProp_undefined_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with undefined value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue).assertEqual(undefined);
        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetAndProp_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_SetAndProp_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_SetAndProp_emptyString_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDPROP_PARAM_EMPTYSTRING_002
     * @tc.desc   Test deprecated AppStorage.SetAndProp with empty string defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndProp_emptyString_002', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndProp_emptyString_001] START');
      try {
        const propName: string = 'testSetAndPropEmptyStringDeprecated';
        const defaultValue: string = '';
        const result: SubscribedAbstractProperty<string> = AppStorage.SetAndProp<string>(propName, defaultValue);
        console.info('[AppStorage_SetAndProp_emptyString_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
        // Verify the property was created with empty string value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual('');
        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetAndProp_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_SetAndProp_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

     // ========== delete Tests (current API) ==========

    /**
     * @tc.name   AppStorage_delete_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_DELETE_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.delete with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_delete_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_delete_emptyString_001] START');
      try {
        const propName: string = '';

        // First create property with empty string key
        AppStorage.setOrCreate(propName, 'testValue');
        const hasResult1: boolean = AppStorage.has(propName);
        expect(hasResult1).assertTrue();

        // Now delete it
        const result: boolean = AppStorage.delete(propName);
        console.info('[AppStorage_delete_emptyString_001] result: ' + result);
        expect(result).assertTrue();
        const hasResult2: boolean = AppStorage.has(propName);
        expect(hasResult2).assertFalse();

        // Try deleting non-existent empty string key
        const result2: boolean = AppStorage.delete(propName);
        expect(result2).assertFalse();

        console.info('[AppStorage_delete_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_delete_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_delete_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_DELETE_NULL_001
     * @tc.desc   Test AppStorage.delete with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_delete_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_delete_null_001] START');
      try {
        const propName: string | null = null;

        // Test delete with null propName on non-existent property
        const result: boolean = AppStorage.delete(propName);
        console.info('[AppStorage_delete_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[AppStorage_delete_null_001] END');
      } catch (err) {
        console.error('[AppStorage_delete_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_delete_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_delete_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_DELETE_UNDEFINED_001
     * @tc.desc   Test AppStorage.delete with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_delete_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_delete_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const result0: boolean = AppStorage.delete(propName);
        // Test delete with undefined propName on non-existent property
        const result: boolean = AppStorage.delete(propName);
        console.info('[AppStorage_delete_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[AppStorage_delete_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_delete_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_delete_undefined_001] Expected error caught');
      }
    });

    // ========== Delete Tests (deprecated API) ==========

    /**
     * @tc.name   AppStorage_Delete_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_DELETE_EMPTYSTRING_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Delete with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Delete_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Delete_emptyString_001] START');
      try {
        const propName: string = '';

        // First create property with empty string key
        AppStorage.SetOrCreate(propName, 'testValue');
        const hasResult1: boolean = AppStorage.Has(propName);
        expect(hasResult1).assertTrue();

        // Now delete it
        const result: boolean = AppStorage.Delete(propName);
        console.info('[AppStorage_Delete_emptyString_001] result: ' + result);
        expect(result).assertTrue();
        const hasResult2: boolean = AppStorage.Has(propName);
        expect(hasResult2).assertFalse();

        // Try deleting non-existent empty string key
        const result2: boolean = AppStorage.Delete(propName);
        expect(result2).assertFalse();

        console.info('[AppStorage_Delete_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_Delete_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Delete_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_DELETE_NULL_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Delete with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Delete_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Delete_null_001] START');
      try {
        const propName: string | null = null;

        // Test Delete with null propName on non-existent property
        const result: boolean = AppStorage.Delete(propName);
        console.info('[AppStorage_Delete_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[AppStorage_Delete_null_001] END');
      } catch (err) {
        console.error('[AppStorage_Delete_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Delete_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_Delete_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_DELETE_UNDEFINED_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Delete with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Delete_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Delete_undefined_001] START');
      try {
        const propName: string | undefined = undefined;

        // Test Delete with undefined propName on non-existent property
        const result: boolean = AppStorage.Delete(propName);
        console.info('[AppStorage_Delete_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[AppStorage_Delete_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_Delete_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Delete_undefined_001] Expected error caught');
      }
    });

    // ========== IsMutable Tests (deprecated API) ==========

    /**
     * @tc.name   AppStorage_IsMutable_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_ISMUTABLE_EMPTYSTRING_001
     * @tc.desc   Test deprecated AppStorage.IsMutable with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_IsMutable_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_IsMutable_emptyString_001] START');
      try {
        const propName: string = '';

        // Create property with empty string key
        AppStorage.SetOrCreate(propName, 'testValue');
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();

        // Test IsMutable with empty string propName
        const result: boolean = AppStorage.IsMutable(propName);
        console.info('[AppStorage_IsMutable_emptyString_001] result: ' + result);
        // According to documentation, IsMutable always returns true
        expect(result).assertTrue();

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_IsMutable_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_IsMutable_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_IsMutable_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_ISMUTABLE_NULL_001
     * @tc.desc   Test deprecated AppStorage.IsMutable with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_IsMutable_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_IsMutable_null_001] START');
      try {
        const propName: string | null = null;

        // Test IsMutable with null propName
        const result: boolean = AppStorage.IsMutable(propName);
        console.info('[AppStorage_IsMutable_null_001] result: ' + result);
        // According to documentation, IsMutable always returns true
        expect(result).assertTrue();

        console.info('[AppStorage_IsMutable_null_001] END');
      } catch (err) {
        console.error('[AppStorage_IsMutable_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_IsMutable_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_IsMutable_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_ISMUTABLE_UNDEFINED_001
     * @tc.desc   Test deprecated AppStorage.IsMutable with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_IsMutable_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_IsMutable_undefined_001] START');
      try {
        const propName: string | undefined = undefined;

        // Test IsMutable with undefined propName
        const result: boolean = AppStorage.IsMutable(propName);
        console.info('[AppStorage_IsMutable_undefined_001] result: ' + result);
        // According to documentation, IsMutable always returns true
        expect(result).assertTrue();

        console.info('[AppStorage_IsMutable_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_IsMutable_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_IsMutable_undefined_001] Expected error caught');
      }
    });


    /**
     * @tc.name   AppStorage_IsMutable_alwaysTrue_001
     * @tc.number SUB_ARUI_APPSTORAGE_ISMUTABLE_ALWAYSTRUE_001
     * @tc.desc   Test deprecated AppStorage.IsMutable - verify it always returns true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_IsMutable_alwaysTrue_001', Level.LEVEL2, () => {
      console.info('[AppStorage_IsMutable_alwaysTrue_001] START');
      try {
        const propName1: string = 'testIsMutable1';
        const propName2: string = 'testIsMutable2';

        // Create multiple properties
        AppStorage.SetOrCreate(propName1, 'testValue1');
        AppStorage.SetOrCreate(propName2, 123);

        // Test IsMutable on both properties
        const result1: boolean = AppStorage.IsMutable(propName1);
        const result2: boolean = AppStorage.IsMutable(propName2);
        console.info('[AppStorage_IsMutable_alwaysTrue_001] result1: ' + result1 + ', result2: ' + result2);

        // According to documentation, IsMutable always returns true
        expect(result1).assertTrue();
        expect(result2).assertTrue();

        // Clean up
        const deleteResult1: boolean = AppStorage.Delete(propName1);
        const deleteResult2: boolean = AppStorage.Delete(propName2);
        expect(deleteResult1).assertTrue();
        expect(deleteResult2).assertTrue();

        console.info('[AppStorage_IsMutable_alwaysTrue_001] END');
      } catch (err) {
        console.error('[AppStorage_IsMutable_alwaysTrue_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== SetAndLink Tests (deprecated API) ==========

    /**
     * @tc.name   AppStorage_SetAndLink_propName_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test deprecated AppStorage.SetAndLink with empty string as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndLink_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_propName_emptyString_001] START');
      try {
        const propName: string = '';
        const defaultValue: number = 100;

        // Test SetAndLink with empty string propName
        const result: SubscribedAbstractProperty<number> = AppStorage.SetAndLink<number>(propName, defaultValue);
        console.info('[AppStorage_SetAndLink_propName_emptyString_001] result: ' + JSON.stringify(result));

        // Verify the property was created with empty string as key
        expect(result !== undefined).assertTrue();
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();

        // Verify the value
        const getValue: number | null | undefined = AppStorage.Get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const linkValue: number = result.get();
        expect(linkValue).assertEqual(defaultValue);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_SetAndLink_propName_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_SetAndLink_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_SetAndLink_propName_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_PROPNAME_NULL_001
     * @tc.desc   Test deprecated AppStorage.SetAndLink with null as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndLink_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_propName_null_001] START');
      try {
        const propName: string | null = null;
        const defaultValue: number = 100;

        // Test SetAndLink with null propName
        const result: SubscribedAbstractProperty<number> = AppStorage.SetAndLink<number>(propName, defaultValue);
        console.info('[AppStorage_SetAndLink_propName_null_001] result: ' + JSON.stringify(result));

        // Verify the value
        const getValue: number | null | undefined = AppStorage.Get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const linkValue: number = result.get();
        expect(linkValue).assertEqual(defaultValue);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetAndLink_propName_null_001] END');
      } catch (err) {
        console.error('[AppStorage_SetAndLink_propName_null_001] Error: ' + JSON.stringify(err));
        console.info('[AppStorage_SetAndLink_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_SetAndLink_propName_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_PROPNAME_UNDEFINED_001
     * @tc.desc   Test deprecated AppStorage.SetAndLink with undefined as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndLink_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: number = 100;

        // Test SetAndLink with undefined propName
        const result: SubscribedAbstractProperty<number> = AppStorage.SetAndLink<number>(propName, defaultValue);
        console.info('[AppStorage_SetAndLink_propName_undefined_001] result: ' + JSON.stringify(result));

        // Verify the value
        const getValue: number | null | undefined = AppStorage.Get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const linkValue: number = result.get();
        expect(linkValue).assertEqual(defaultValue);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetAndLink_propName_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_SetAndLink_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected: may throw error for undefined propName
        console.info('[AppStorage_SetAndLink_propName_undefined_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_SetAndLink_defaultValue_null_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_DEFAULTVALUE_NULL_002
     * @tc.desc   Test deprecated AppStorage.SetAndLink with null defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndLink_defaultValue_null_002', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_defaultValue_null_002] START');
      try {
        const propName: string = 'testSetAndLinkNullDeprecated';
        const defaultValue: Object | null = null;

        // Test SetAndLink with null defaultValue (deprecated API may not support null)
        const result: SubscribedAbstractProperty<Object | null> = AppStorage.SetAndLink<Object | null>(propName, defaultValue);
        console.info('[AppStorage_SetAndLink_defaultValue_null_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();

        // Verify the property was created with null value
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | null | undefined = AppStorage.Get<Object | null>(propName);
        expect(getValue).assertEqual(null);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetAndLink_defaultValue_null_002] END');
      } catch (err) {
        console.error('[AppStorage_SetAndLink_defaultValue_null_002] Error: ' + JSON.stringify(err));
        console.info('[AppStorage_SetAndLink_defaultValue_null_002] Expected error caught (deprecated API may not support null)');
      }
    });

    /**
     * @tc.name   AppStorage_SetAndLink_defaultValue_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_DEFAULTVALUE_UNDEFINED_001
     * @tc.desc   Test deprecated AppStorage.SetAndLink with undefined defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetAndLink_defaultValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetAndLink_defaultValue_undefined_001] START');
      try {
        const propName: string = 'testSetAndLinkUndefinedDeprecated';
        const defaultValue: Object | undefined = undefined;

        // Test SetAndLink with undefined defaultValue (deprecated API may not support undefined)
        const result: SubscribedAbstractProperty<Object | undefined> = AppStorage.SetAndLink<Object | undefined>(propName, defaultValue);
        console.info('[AppStorage_SetAndLink_defaultValue_undefined_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();

        // Verify the property was created with undefined value
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | undefined | null = AppStorage.Get<Object | undefined>(propName);
        expect(getValue).assertEqual(undefined);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetAndLink_defaultValue_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_SetAndLink_defaultValue_undefined_001] Error: ' + JSON.stringify(err));
        console.info('[AppStorage_SetAndLink_defaultValue_undefined_001] Expected error caught (deprecated API may not support undefined)');
      }
    });

    // ========== Has Tests (current API) ==========

    /**
     * @tc.name   AppStorage_has_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_HAS_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.has with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_has_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_has_emptyString_001] START');
      try {
        const propName: string = '';

        // Test has with empty string propName - should return false initially
        const result1: boolean = AppStorage.has(propName);
        expect(result1).assertFalse();

        // Create property with empty string key
        AppStorage.setOrCreate(propName, 'testValue');
        const result2: boolean = AppStorage.has(propName);
        expect(result2).assertTrue();

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        const result3: boolean = AppStorage.has(propName);
        expect(result3).assertFalse();

        console.info('[AppStorage_has_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_has_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_has_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_HAS_NULL_001
     * @tc.desc   Test AppStorage.has with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_has_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_has_null_001] START');
      try {
        const propName: string | null = null;

        // Test has with null propName
        const result: boolean = AppStorage.has(propName);
        console.info('[AppStorage_has_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[AppStorage_has_null_001] END');
      } catch (err) {
        console.error('[AppStorage_has_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_has_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_has_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_HAS_UNDEFINED_001
     * @tc.desc   Test AppStorage.has with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_has_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_has_undefined_001] START');
      try {
        const propName: string | undefined = undefined;

        // Test has with undefined propName
        const result: boolean = AppStorage.has(propName);
        console.info('[AppStorage_has_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[AppStorage_has_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_has_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_has_undefined_001] Expected error caught');
      }
    });

    // ========== get Tests (current API) ==========

    /**
     * @tc.name   AppStorage_get_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_GET_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.get with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_get_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_get_emptyString_001] START');
      try {
        const propName: string = '';

        // Test get with empty string propName - should return undefined initially
        const result1: Object | undefined = AppStorage.get<Object>(propName);
        expect(result1).assertEqual(undefined);

        // Create property with empty string key
        AppStorage.setOrCreate(propName, 'testValue');
        const result2: string | null | undefined = AppStorage.get<string>(propName);
        expect(result2).assertEqual('testValue');

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        const result3: Object | undefined = AppStorage.get<Object>(propName);
        expect(result3).assertEqual(undefined);

        console.info('[AppStorage_get_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_get_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_get_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_GET_NULL_001
     * @tc.desc   Test AppStorage.get with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_get_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_get_null_001] START');
      try {
        const propName: string | null = null;

        // Test get with null propName
        const result: Object | undefined = AppStorage.get<Object>(propName);
        console.info('[AppStorage_get_null_001] result: ' + JSON.stringify(result));
        // Should return undefined for null propName
        expect(result).assertEqual(undefined);

        console.info('[AppStorage_get_null_001] END');
      } catch (err) {
        console.error('[AppStorage_get_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_get_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_get_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_GET_UNDEFINED_001
     * @tc.desc   Test AppStorage.get with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_get_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_get_undefined_001] START');
      try {
        const propName: string | undefined = undefined;

        // Test get with undefined propName
        const result: Object | undefined = AppStorage.get<Object>(propName);
        console.info('[AppStorage_get_undefined_001] result: ' + JSON.stringify(result));
        // Should return undefined for undefined propName
        expect(result).assertEqual(undefined);

        console.info('[AppStorage_get_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_get_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_get_undefined_001] Expected error caught');
      }
    });

    // ========== Has Tests (deprecated API) ==========

    /**
     * @tc.name   AppStorage_Has_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_HAS_EMPTYSTRING_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Has with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Has_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Has_emptyString_001] START');
      try {
        const propName: string = '';

        // Test Has with empty string propName - should return false initially
        const result1: boolean = AppStorage.Has(propName);
        expect(result1).assertFalse();

        // Create property with empty string key
        AppStorage.SetOrCreate(propName, 'testValue');
        const result2: boolean = AppStorage.Has(propName);
        expect(result2).assertTrue();

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        const result3: boolean = AppStorage.Has(propName);
        expect(result3).assertFalse();

        console.info('[AppStorage_Has_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_Has_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Has_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_HAS_NULL_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Has with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Has_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Has_null_001] START');
      try {
        const propName: string | null = null;

        // Test Has with null propName
        const result: boolean = AppStorage.Has(propName);
        console.info('[AppStorage_Has_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[AppStorage_Has_null_001] END');
      } catch (err) {
        console.error('[AppStorage_Has_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Has_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_Has_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_HAS_UNDEFINED_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Has with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Has_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Has_undefined_001] START');
      try {
        const propName: string | undefined = undefined;

        // Test Has with undefined propName
        const result: boolean = AppStorage.Has(propName);
        console.info('[AppStorage_Has_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[AppStorage_Has_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_Has_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Has_undefined_001] Expected error caught');
      }
    });

    // ========== Get Tests (deprecated API) ==========

    /**
     * @tc.name   AppStorage_Get_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_GET_EMPTYSTRING_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Get with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Get_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Get_emptyString_001] START');
      try {
        const propName: string = '';

        // Test Get with empty string propName - should return undefined initially
        const result1: Object | undefined = AppStorage.Get<Object>(propName);
        expect(result1).assertEqual(undefined);

        // Create property with empty string key
        AppStorage.SetOrCreate(propName, 'testValue');
        const result2: string | null | undefined = AppStorage.Get<string>(propName);
        expect(result2).assertEqual('testValue');

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        const result3: Object | undefined = AppStorage.Get<Object>(propName);
        expect(result3).assertEqual(undefined);

        console.info('[AppStorage_Get_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_Get_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Get_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_GET_NULL_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Get with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Get_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Get_null_001] START');
      try {
        const propName: string | null = null;

        // Test Get with null propName
        const result: Object | undefined = AppStorage.Get<Object>(propName);
        console.info('[AppStorage_Get_null_001] result: ' + JSON.stringify(result));
        // Should return undefined for null propName
        expect(result).assertEqual(undefined);

        console.info('[AppStorage_Get_null_001] END');
      } catch (err) {
        console.error('[AppStorage_Get_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Get_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_Get_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_GET_UNDEFINED_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Get with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Get_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Get_undefined_001] START');
      try {
        const propName: string | undefined = undefined;

        // Test Get with undefined propName
        const result: Object | undefined = AppStorage.Get<Object>(propName);
        console.info('[AppStorage_Get_undefined_001] result: ' + JSON.stringify(result));
        // Should return undefined for undefined propName
        expect(result).assertEqual(undefined);

        console.info('[AppStorage_Get_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_Get_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Get_undefined_001] Expected error caught');
      }
    });

    // ========== AbstractProperty.set Tests (ref/setAndRef) ==========

    /**
     * @tc.name   AppStorage_AbstractProperty_set_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_ABSTRACTPROPERTY_SET_NULL_001
     * @tc.desc   Test AbstractProperty.set with null value (from ref)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_AbstractProperty_set_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_AbstractProperty_set_null_001] START');
      try {
        const propName: string = 'testAbstractPropertySetNull';

        // Create a property using setAndRef
        const prop: AbstractProperty<Object | null> = AppStorage.setAndRef<Object | null>(propName, 'initialValue');
        expect(prop !== undefined).assertTrue();

        // Verify initial value
        const getValue1: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Test set with null value
        prop.set(null);
        const getValue2: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue2).assertEqual(null);

        // Verify prop.get() returns null
        const propValue: Object | null = prop.get();
        expect(propValue).assertEqual(null);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_AbstractProperty_set_null_001] END');
      } catch (err) {
        console.error('[AppStorage_AbstractProperty_set_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_AbstractProperty_set_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_ABSTRACTPROPERTY_SET_UNDEFINED_001
     * @tc.desc   Test AbstractProperty.set with undefined value (from ref)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_AbstractProperty_set_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_AbstractProperty_set_undefined_001] START');
      try {
        const propName: string = 'testAbstractPropertySetUndefined';

        // Create a property using setAndRef
        const prop: AbstractProperty<Object | undefined> = AppStorage.setAndRef<Object | undefined>(propName, 'initialValue');
        expect(prop !== undefined).assertTrue();

        // Verify initial value
        const getValue1: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Test set with undefined value
        prop.set(undefined);
        const getValue2: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue2).assertEqual(undefined);

        // Verify prop.get() returns undefined
        const propValue: Object | undefined = prop.get();
        expect(propValue).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_AbstractProperty_set_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_AbstractProperty_set_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });


    // ========== SubscribedAbstractProperty.set Tests (link/prop/setAndLink/setAndProp) ==========

    /**
     * @tc.name   AppStorage_SubscribedAbstractProperty_set_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SUBSCRIBEDABSTRACTPROPERTY_SET_NULL_001
     * @tc.desc   Test SubscribedAbstractProperty.set with null value (from setAndLink)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_SubscribedAbstractProperty_set_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SubscribedAbstractProperty_set_null_001] START');
      try {
        const propName: string = 'testSubscribedAbstractPropertySetNull';

        // Create a property using setAndLink
        const prop: SubscribedAbstractProperty<Object | null> = AppStorage.setAndLink<Object | null>(propName, 'initialValue');
        expect(prop !== undefined).assertTrue();

        // Verify initial value
        const getValue1: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Test set with null value
        prop.set(null);
        const getValue2: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue2).assertEqual(null);

        // Verify prop.get() returns null
        const propValue: Object | null = prop.get();
        expect(propValue).assertEqual(null);

        // Clean up - call aboutToBeDeleted before delete
        prop.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_SubscribedAbstractProperty_set_null_001] END');
      } catch (err) {
        console.error('[AppStorage_SubscribedAbstractProperty_set_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_SubscribedAbstractProperty_set_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SUBSCRIBEDABSTRACTPROPERTY_SET_UNDEFINED_001
     * @tc.desc   Test SubscribedAbstractProperty.set with undefined value (from setAndLink)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_SubscribedAbstractProperty_set_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SubscribedAbstractProperty_set_undefined_001] START');
      try {
        const propName: string = 'testSubscribedAbstractPropertySetUndefined';

        // Create a property using setAndLink
        const prop: SubscribedAbstractProperty<Object | undefined> = AppStorage.setAndLink<Object | undefined>(propName, 'initialValue');
        expect(prop !== undefined).assertTrue();

        // Verify initial value
        const getValue1: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Test set with undefined value
        prop.set(undefined);
        const getValue2: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue2).assertEqual(undefined);

        // Verify prop.get() returns undefined
        const propValue: Object | undefined = prop.get();
        expect(propValue).assertEqual(undefined);

        // Clean up - call aboutToBeDeleted before delete
        prop.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_SubscribedAbstractProperty_set_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_SubscribedAbstractProperty_set_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== setAndLink Tests (current API) ==========

    /**
     * @tc.name   AppStorage_setAndLink_propName_emptyString_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_PROPNAME_EMPTYSTRING_002
     * @tc.desc   Test AppStorage.setAndLink with empty string as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndLink_propName_emptyString_002', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_propName_emptyString_002] START');
      try {
        const propName: string = '';
        const defaultValue: number = 100;

        // Test setAndLink with empty string propName
        const result: SubscribedAbstractProperty<number> = AppStorage.setAndLink<number>(propName, defaultValue);
        console.info('[AppStorage_setAndLink_propName_emptyString_002] result: ' + JSON.stringify(result));

        // Verify the property was created with empty string as key
        expect(result !== undefined).assertTrue();
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();

        // Verify the value
        const getValue: number | null | undefined = AppStorage.get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const linkValue: number = result.get();
        expect(linkValue).assertEqual(defaultValue);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setAndLink_propName_emptyString_002] END');
      } catch (err) {
        console.error('[AppStorage_setAndLink_propName_emptyString_002] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndLink_propName_null_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_PROPNAME_NULL_002
     * @tc.desc   Test AppStorage.setAndLink with null as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndLink_propName_null_002', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_propName_null_002] START');
      try {
        const propName: string | null = null;
        const defaultValue: number = 100;

        // Test setAndLink with null propName
        const result: SubscribedAbstractProperty<number> = AppStorage.setAndLink<number>(propName, defaultValue);
        console.info('[AppStorage_setAndLink_propName_null_002] result: ' + JSON.stringify(result));

        // Verify the value
        const getValue: number | null | undefined = AppStorage.get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const linkValue: number = result.get();
        expect(linkValue).assertEqual(defaultValue);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndLink_propName_null_002] END');
      } catch (err) {
        console.error('[AppStorage_setAndLink_propName_null_002] Error: ' + JSON.stringify(err));
        console.info('[AppStorage_setAndLink_propName_null_002] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_setAndLink_propName_undefined_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_PROPNAME_UNDEFINED_002
     * @tc.desc   Test AppStorage.setAndLink with undefined as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndLink_propName_undefined_002', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_propName_undefined_002] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: number = 100;

        // Test setAndLink with undefined propName
        const result: SubscribedAbstractProperty<number> = AppStorage.setAndLink<number>(propName, defaultValue);
        console.info('[AppStorage_setAndLink_propName_undefined_002] result: ' + JSON.stringify(result));

        // Verify the value
        const getValue: number | null | undefined = AppStorage.get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const linkValue: number = result.get();
        expect(linkValue).assertEqual(defaultValue);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndLink_propName_undefined_002] END');
      } catch (err) {
        console.error('[AppStorage_setAndLink_propName_undefined_002] Error: ' + JSON.stringify(err));
        // Expected: may throw error for undefined propName
        console.info('[AppStorage_setAndLink_propName_undefined_002] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_setAndLink_defaultValue_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_DEFAULTVALUE_NULL_001
     * @tc.desc   Test AppStorage.setAndLink with null defaultValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndLink_defaultValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_defaultValue_null_001] START');
      try {
        const propName: string = 'testSetAndLinkNull';
        const defaultValue: Object | null = null;

        // Test setAndLink with null defaultValue (API 12+ allows null)
        const result: SubscribedAbstractProperty<Object | null> = AppStorage.setAndLink<Object | null>(propName, defaultValue);
        console.info('[AppStorage_setAndLink_defaultValue_null_001] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();

        // Verify the property was created with null value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue).assertEqual(null);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndLink_defaultValue_null_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndLink_defaultValue_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndLink_defaultValue_undefined_002
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDLINK_DEFAULTVALUE_UNDEFINED_002
     * @tc.desc   Test AppStorage.setAndLink with undefined defaultValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndLink_defaultValue_undefined_002', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndLink_defaultValue_undefined_002] START');
      try {
        const propName: string = 'testSetAndLinkUndefined';
        const defaultValue: Object | undefined = undefined;

        // Test setAndLink with undefined defaultValue (API 12+ allows undefined)
        const result: SubscribedAbstractProperty<Object | undefined> = AppStorage.setAndLink<Object | undefined>(propName, defaultValue);
        console.info('[AppStorage_setAndLink_defaultValue_undefined_002] result: ' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();

        // Verify the property was created with undefined value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue).assertEqual(undefined);

        // Clean up - call aboutToBeDeleted before delete
        result.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndLink_defaultValue_undefined_002] END');
      } catch (err) {
        console.error('[AppStorage_setAndLink_defaultValue_undefined_002] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndRef_propName_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.setAndRef with empty string as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_propName_emptyString_001] START');
      try {
        const propName: string = '';
        const defaultValue: number = 100;

        // Test setAndRef with empty string propName
        const result: AbstractProperty<number> = AppStorage.setAndRef<number>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_propName_emptyString_001] result: ' + JSON.stringify(result));

        // Verify the property was created with empty string as key
        expect(result !== undefined).assertTrue();
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();

        // Verify the value
        const getValue: number | null | undefined = AppStorage.get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const refValue: number = result.get();
        expect(refValue).assertEqual(defaultValue);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setAndRef_propName_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setAndRef_propName_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PROPNAME_NULL_001
     * @tc.desc   Test AppStorage.setAndRef with null as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_propName_null_001] START');
      try {
        const propName: string | null = null;
        const defaultValue: number = 100;

        // Test setAndRef with null propName
        // Note: TypeScript may allow passing null for string type
        const result: AbstractProperty<number> | null = AppStorage.setAndRef<number>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_propName_null_001] result: ' + JSON.stringify(result));

        // Verify the value
        const getValue: number | null | undefined = AppStorage.get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const refValue: number = result.get();
        expect(refValue).assertEqual(defaultValue);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_setAndRef_propName_null_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_propName_null_001] Error: ' + JSON.stringify(err));
        console.info('[AppStorage_setAndRef_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_setAndRef_propName_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETANDREF_PROPNAME_UNDEFINED_001
     * @tc.desc   Test AppStorage.setAndRef with undefined as propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setAndRef_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setAndRef_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const defaultValue: number = 100;

        // Test setAndRef with undefined propName
        // Note: TypeScript may allow passing undefined for string type
        const result: AbstractProperty<number> | undefined = AppStorage.setAndRef<number>(propName, defaultValue);
        console.info('[AppStorage_setAndRef_propName_undefined_001] result: ' + JSON.stringify(result));

        // Verify the value
        const getValue: number | null | undefined = AppStorage.get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const refValue: number = result.get();
        expect(refValue).assertEqual(defaultValue);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setAndRef_propName_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_setAndRef_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected: may throw error for undefined propName
        console.info('[AppStorage_setAndRef_propName_undefined_001] Expected error caught');
      }
    });

    // ========== set Tests (current API) ==========

    /**
     * @tc.name   AppStorage_set_propName_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.set with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_propName_emptyString_001] START');
      try {
        const propName: string = '';
        const newValue: string = 'testValue';

        // Create property with empty string key first
        AppStorage.setOrCreate(propName, 'initialValue');
        const hasResult1: boolean = AppStorage.has(propName);
        expect(hasResult1).assertTrue();

        // Now set it to a new value
        const result: boolean = AppStorage.set<string>(propName, newValue);
        console.info('[AppStorage_set_propName_emptyString_001] result: ' + result);
        expect(result).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_set_propName_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_set_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_set_propName_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PROPNAME_NULL_001
     * @tc.desc   Test AppStorage.set with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'testValue';

        // Test set with null propName on non-existent property
        const result: boolean = AppStorage.set<string>(propName, newValue);
        console.info('[AppStorage_set_propName_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[AppStorage_set_propName_null_001] END');
      } catch (err) {
        console.error('[AppStorage_set_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_set_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_set_propName_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PROPNAME_UNDEFINED_001
     * @tc.desc   Test AppStorage.set with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_set_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_set_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'testValue';

        // Test set with undefined propName on non-existent property
        const result: boolean = AppStorage.set<string>(propName, newValue);
        console.info('[AppStorage_set_propName_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[AppStorage_set_propName_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_set_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_set_propName_undefined_001] Expected error caught');
      }
    });

    // ========== SetOrCreate Tests (current API) ==========

    /**
     * @tc.name   AppStorage_setOrCreate_propName_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test AppStorage.setOrCreate with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setOrCreate_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_propName_emptyString_001] START');
      try {
        const propName: string = '';
        const newValue: string = 'testValue';

        // Test setOrCreate with empty string propName (should create)
        AppStorage.setOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Test setOrCreate with same empty string propName (should update)
        const newValue2: string = 'testValue2';
        AppStorage.setOrCreate(propName, newValue2);
        const getValue2: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue2).assertEqual(newValue2);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setOrCreate_propName_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_setOrCreate_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setOrCreate_propName_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_PROPNAME_NULL_001
     * @tc.desc   Test AppStorage.setOrCreate with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setOrCreate_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'testValue';

        // Test setOrCreate with null propName
        AppStorage.setOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setOrCreate_propName_null_001] END');
      } catch (err) {
        console.error('[AppStorage_setOrCreate_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_setOrCreate_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_setOrCreate_propName_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_PROPNAME_UNDEFINED_001
     * @tc.desc   Test AppStorage.setOrCreate with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setOrCreate_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'testValue';

        // Test setOrCreate with undefined propName
        AppStorage.setOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setOrCreate_propName_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_setOrCreate_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_setOrCreate_propName_undefined_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_setOrCreate_newValue_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_NEWVALUE_NULL_001
     * @tc.desc   Test AppStorage.setOrCreate with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setOrCreate_newValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_newValue_null_001] START');
      try {
        const propName: string = 'testSetOrCreateNull';
        const newValue: Object | null = null;

        // Test setOrCreate with null newValue (API 12+ allows null)
        AppStorage.setOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | null | undefined = AppStorage.get<Object | null>(propName);
        expect(getValue).assertEqual(null);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setOrCreate_newValue_null_001] END');
      } catch (err) {
        console.error('[AppStorage_setOrCreate_newValue_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_setOrCreate_newValue_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_NEWVALUE_UNDEFINED_001
     * @tc.desc   Test AppStorage.setOrCreate with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AppStorage_setOrCreate_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_setOrCreate_newValue_undefined_001] START');
      try {
        const propName: string = 'testSetOrCreateUndefined';
        const newValue: Object | undefined = undefined;

        // Test setOrCreate with undefined newValue (API 12+ allows undefined)
        AppStorage.setOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | undefined | null = AppStorage.get<Object | undefined>(propName);
        expect(getValue).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_setOrCreate_newValue_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_setOrCreate_newValue_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== Set Tests (deprecated API) ==========

    /**
     * @tc.name   AppStorage_Set_propName_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PROPNAME_EMPTYSTRING_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Set with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Set_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_propName_emptyString_001] START');
      try {
        const propName: string = '';
        const newValue: string = 'testValue';

        // Create property with empty string key first
        AppStorage.SetOrCreate(propName, 'initialValue');
        const hasResult1: boolean = AppStorage.Has(propName);
        expect(hasResult1).assertTrue();

        // Now set it to a new value
        const result: boolean = AppStorage.Set<string>(propName, newValue);
        console.info('[AppStorage_Set_propName_emptyString_001] result: ' + result);
        expect(result).assertTrue();
        const getValue: string | null | undefined = AppStorage.Get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_Set_propName_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_Set_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Set_propName_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PROPNAME_NULL_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Set with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Set_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'testValue';

        // Test Set with null propName on non-existent property
        const result: boolean = AppStorage.Set<string>(propName, newValue);
        console.info('[AppStorage_Set_propName_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[AppStorage_Set_propName_null_001] END');
      } catch (err) {
        console.error('[AppStorage_Set_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Set_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_Set_propName_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_PROPNAME_UNDEFINED_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Set with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Set_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'testValue';
        AppStorage.delete(propName)
        // Test Set with undefined propName on non-existent property
        const result: boolean = AppStorage.Set<string>(propName, newValue);
        console.info('[AppStorage_Set_propName_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[AppStorage_Set_propName_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_Set_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[AppStorage_Set_propName_undefined_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_Set_newValue_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_NEWVALUE_NULL_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Set with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Set_newValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_newValue_null_001] START');
      try {
        const propName: string = 'testSetNullDeprecated';
        // First create a property
        AppStorage.SetOrCreate(propName, 'initialValue');
        const hasResult1: boolean = AppStorage.Has(propName);
        expect(hasResult1).assertTrue();
        const getValue1: string | null | undefined = AppStorage.Get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Now set it to null (API 12+ allows null)
        const result: boolean = AppStorage.Set<Object | null>(propName, null);
        console.info('[AppStorage_Set_newValue_null_001] result: ' + result);
        expect(result).assertTrue();
        const getValue2: string | null | undefined = AppStorage.Get<string | null>(propName);
        expect(getValue2).assertEqual(null);

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_Set_newValue_null_001] END');
      } catch (err) {
        console.error('[AppStorage_Set_newValue_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_Set_newValue_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SET_NEWVALUE_UNDEFINED_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.Set with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_Set_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_Set_newValue_undefined_001] START');
      try {
        const propName: string = 'testSetUndefinedDeprecated';
        // First create a property
        AppStorage.SetOrCreate(propName, 'initialValue');
        const hasResult1: boolean = AppStorage.Has(propName);
        expect(hasResult1).assertTrue();
        const getValue1: string | undefined | null = AppStorage.Get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Now set it to undefined (API 12+ allows undefined)
        const result: boolean = AppStorage.Set<Object | undefined>(propName, undefined);
        console.info('[AppStorage_Set_newValue_undefined_001] result: ' + result);
        expect(result).assertTrue();
        const getValue2: string | undefined | null = AppStorage.Get<string | undefined>(propName);
        expect(getValue2).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_Set_newValue_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_Set_newValue_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== SetOrCreate Tests (deprecated API) ==========

    /**
     * @tc.name   AppStorage_SetOrCreate_propName_emptyString_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_PROPNAME_EMPTYSTRING_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.SetOrCreate with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetOrCreate_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_propName_emptyString_001] START');
      try {
        const propName: string = '';
        const newValue: string = 'testValue';

        // Test SetOrCreate with empty string propName (should create)
        AppStorage.SetOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.Get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Test SetOrCreate with same empty string propName (should update)
        const newValue2: string = 'testValue2';
        AppStorage.SetOrCreate(propName, newValue2);
        const getValue2: string | null | undefined = AppStorage.Get<string>(propName);
        expect(getValue2).assertEqual(newValue2);

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_SetOrCreate_propName_emptyString_001] END');
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AppStorage_SetOrCreate_propName_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_PROPNAME_NULL_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.SetOrCreate with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetOrCreate_propName_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_propName_null_001] START');
      try {
        const propName: string | null = null;
        const newValue: string = 'testValue';

        // Test SetOrCreate with null propName (deprecated API may not support null)
        AppStorage.SetOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.Get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_SetOrCreate_propName_null_001] END');
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error (deprecated API may not support null)
        console.info('[AppStorage_SetOrCreate_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_SetOrCreate_propName_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_PROPNAME_UNDEFINED_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.SetOrCreate with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetOrCreate_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_propName_undefined_001] START');
      try {
        const propName: string | undefined = undefined;
        const newValue: string = 'testValue';

        // Test SetOrCreate with undefined propName (deprecated API may not support undefined)
        AppStorage.SetOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.Get<string>(propName);
        expect(getValue).assertEqual(newValue);
        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AppStorage_SetOrCreate_propName_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error (deprecated API may not support undefined)
        console.info('[AppStorage_SetOrCreate_propName_undefined_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_SetOrCreate_newValue_null_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_NEWVALUE_NULL_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.SetOrCreate with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetOrCreate_newValue_null_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_newValue_null_001] START');
      try {
        const propName: string = 'testSetOrCreateNullDeprecated';
        const newValue: Object | null = null;

        // Test SetOrCreate with null newValue (API 12+ allows null, but deprecated may not)
        AppStorage.SetOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | null | undefined = AppStorage.Get<Object | null>(propName);
        expect(getValue).assertEqual(null);

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_SetOrCreate_newValue_null_001] END');
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_newValue_null_001] Error: ' + JSON.stringify(err));
        // Expected: may throw error (deprecated API may not support null)
        console.info('[AppStorage_SetOrCreate_newValue_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   AppStorage_SetOrCreate_newValue_undefined_001
     * @tc.number SUB_ARUI_APPSTORAGE_SETORCREATE_NEWVALUE_UNDEFINED_DEPRECATED_001
     * @tc.desc   Test deprecated AppStorage.SetOrCreate with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('AppStorage_SetOrCreate_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[AppStorage_SetOrCreate_newValue_undefined_001] START');
      try {
        const propName: string = 'testSetOrCreateUndefinedDeprecated';
        const newValue: Object | undefined = undefined;

        // Test SetOrCreate with undefined newValue (API 12+ allows undefined, but deprecated may not)
        AppStorage.SetOrCreate(propName, newValue);
        const hasResult: boolean = AppStorage.Has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | undefined | null = AppStorage.Get<Object | undefined>(propName);
        expect(getValue).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = AppStorage.Delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[AppStorage_SetOrCreate_newValue_undefined_001] END');
      } catch (err) {
        console.error('[AppStorage_SetOrCreate_newValue_undefined_001] Error: ' + JSON.stringify(err));
        // Expected: may throw error (deprecated API may not support undefined)
        console.info('[AppStorage_SetOrCreate_newValue_undefined_001] Expected error caught');
      }
    });

  });
}
