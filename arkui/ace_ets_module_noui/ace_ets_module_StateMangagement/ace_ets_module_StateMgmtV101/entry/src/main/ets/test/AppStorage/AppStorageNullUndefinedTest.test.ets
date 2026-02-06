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
  });
}
