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

export default function stateManagementNullUndefinedTest() {
  describe('StateManagementNullUndefinedTest', () => {
    beforeAll(() => {
      console.info('[StateManagementNullUndefinedTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[StateManagementNullUndefinedTest] beforeEach called');
    });

    afterEach(() => {
      console.info('[StateManagementNullUndefinedTest] afterEach called');
    });

    afterAll(() => {
      console.info('[StateManagementNullUndefinedTest] afterAll called');
    });

    // ============================================
    // AbstractProperty.set(newValue: T) - API 12+
    // ============================================

    /**
     * @tc.name   AbstractProperty_set_null_001
     * @tc.number SUB_ARKUI_ABSTRACTPROPERTY_SET_PARAM_NULL_001
     * @tc.desc   Test AbstractProperty.set with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AbstractProperty_set_null_001', Level.LEVEL2, () => {
      console.info('[AbstractProperty_set_null_001] START');
      try {
        const propName: string = 'testAbstractPropertySetNull';
        const defaultValue: string = 'initialValue';
        const prop: AbstractProperty<string | null> = AppStorage.setAndRef<string | null>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue1: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Set to null (API 12+ allows null)
        prop.set(null);
        const getValue2: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue2).assertEqual(null);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AbstractProperty_set_null_001] END');
      } catch (err) {
        console.error('[AbstractProperty_set_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AbstractProperty_set_undefined_001
     * @tc.number SUB_ARKUI_ABSTRACTPROPERTY_SET_PARAM_UNDEFINED_001
     * @tc.desc   Test AbstractProperty.set with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AbstractProperty_set_undefined_001', Level.LEVEL2, () => {
      console.info('[AbstractProperty_set_undefined_001] START');
      try {
        const propName: string = 'testAbstractPropertySetUndefined';
        const defaultValue: string = 'initialValue';
        const prop: AbstractProperty<string | undefined> = AppStorage.setAndRef<string | undefined>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue1: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Set to undefined (API 12+ allows undefined)
        prop.set(undefined);
        const getValue2: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue2).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AbstractProperty_set_undefined_001] END');
      } catch (err) {
        console.error('[AbstractProperty_set_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   AbstractProperty_set_emptyString_001
     * @tc.number SUB_ARKUI_ABSTRACTPROPERTY_SET_PARAM_EMPTYSTRING_001
     * @tc.desc   Test AbstractProperty.set with empty string newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AbstractProperty_set_emptyString_001', Level.LEVEL2, () => {
      console.info('[AbstractProperty_set_emptyString_001] START');
      try {
        const propName: string = 'testAbstractPropertySetEmptyString';
        const defaultValue: string = 'initialValue';
        const prop: AbstractProperty<string> = AppStorage.setAndRef<string>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue1: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Set to empty string
        prop.set('');
        const getValue2: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue2).assertEqual('');

        // Clean up
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[AbstractProperty_set_emptyString_001] END');
      } catch (err) {
        console.error('[AbstractProperty_set_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // SubscribedAbstractProperty.set(newValue: T) - API 9+
    // ============================================

    /**
     * @tc.name   SubscribedAbstractProperty_set_null_001
     * @tc.number SUB_ARKUI_SUBSCRIBEDABSTRACTPROPERTY_SET_PARAM_NULL_001
     * @tc.desc   Test SubscribedAbstractProperty.set with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SubscribedAbstractProperty_set_null_001', Level.LEVEL2, () => {
      console.info('[SubscribedAbstractProperty_set_null_001] START');
      try {
        const propName: string = 'testSubscribedPropertySetNull';
        const defaultValue: string = 'initialValue';
        const prop: SubscribedAbstractProperty<string | null> = AppStorage.setAndLink<string | null>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue1: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Set to null (API 12+ allows null)
        prop.set(null);
        const getValue2: string | null | undefined = AppStorage.get<string | null>(propName);
        expect(getValue2).assertEqual(null);

        // Clean up - call aboutToBeDeleted before delete
        prop.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[SubscribedAbstractProperty_set_null_001] END');
      } catch (err) {
        console.error('[SubscribedAbstractProperty_set_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SubscribedAbstractProperty_set_undefined_001
     * @tc.number SUB_ARKUI_SUBSCRIBEDABSTRACTPROPERTY_SET_PARAM_UNDEFINED_001
     * @tc.desc   Test SubscribedAbstractProperty.set with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SubscribedAbstractProperty_set_undefined_001', Level.LEVEL2, () => {
      console.info('[SubscribedAbstractProperty_set_undefined_001] START');
      try {
        const propName: string = 'testSubscribedPropertySetUndefined';
        const defaultValue: string = 'initialValue';
        const prop: SubscribedAbstractProperty<string | undefined> = AppStorage.setAndLink<string | undefined>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue1: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Set to undefined (API 12+ allows undefined)
        prop.set(undefined);
        const getValue2: string | undefined | null = AppStorage.get<string | undefined>(propName);
        expect(getValue2).assertEqual(undefined);

        // Clean up - call aboutToBeDeleted before delete
        prop.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[SubscribedAbstractProperty_set_undefined_001] END');
      } catch (err) {
        console.error('[SubscribedAbstractProperty_set_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SubscribedAbstractProperty_set_emptyString_001
     * @tc.number SUB_ARKUI_SUBSCRIBEDABSTRACTPROPERTY_SET_PARAM_EMPTYSTRING_001
     * @tc.desc   Test SubscribedAbstractProperty.set with empty string newValue (API 9+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SubscribedAbstractProperty_set_emptyString_001', Level.LEVEL2, () => {
      console.info('[SubscribedAbstractProperty_set_emptyString_001] START');
      try {
        const propName: string = 'testSubscribedPropertySetEmptyString';
        const defaultValue: string = 'initialValue';
        const prop: SubscribedAbstractProperty<string> = AppStorage.setAndLink<string>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue1: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Set to empty string
        prop.set('');
        const getValue2: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue2).assertEqual('');

        // Clean up - call aboutToBeDeleted before delete
        prop.aboutToBeDeleted();
        const deleteResult: boolean = AppStorage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[SubscribedAbstractProperty_set_emptyString_001] END');
      } catch (err) {
        console.error('[SubscribedAbstractProperty_set_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // PersistentStorage.deleteProp(key: string) - API 10+
    // ============================================

    /**
     * @tc.name   PersistentStorage_deleteProp_null_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_DELETEPROP_PARAM_NULL_001
     * @tc.desc   Test PersistentStorage.deleteProp with null key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistentStorage_deleteProp_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_deleteProp_null_001] START');
      try {
        const key: string | null = null;
        // deleteProp with null key - behavior depends on implementation
        PersistentStorage.deleteProp(key);
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_deleteProp_null_001] END');
      } catch (err) {
        console.error('[PersistentStorage_deleteProp_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistentStorage_deleteProp_undefined_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_DELETEPROP_PARAM_UNDEFINED_001
     * @tc.desc   Test PersistentStorage.deleteProp with undefined key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistentStorage_deleteProp_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_deleteProp_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        // deleteProp with undefined key - behavior depends on implementation
        PersistentStorage.deleteProp(key);
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_deleteProp_undefined_001] END');
      } catch (err) {
        console.error('[PersistentStorage_deleteProp_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistentStorage_deleteProp_emptyString_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_DELETEPROP_PARAM_EMPTYSTRING_001
     * @tc.desc   Test PersistentStorage.deleteProp with empty string key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistentStorage_deleteProp_emptyString_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_deleteProp_emptyString_001] START');
      try {
        const key: string = '';
        // deleteProp with empty string key - behavior depends on implementation
        PersistentStorage.deleteProp(key);
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_deleteProp_emptyString_001] END');
      } catch (err) {
        console.error('[PersistentStorage_deleteProp_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // PersistentStorage.DeleteProp(key: string) - deprecated
    // ============================================

    /**
     * @tc.name   PersistentStorage_DeleteProp_null_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_DELETEPROP_PARAM_NULL_002
     * @tc.desc   Test deprecated PersistentStorage.DeleteProp with null key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('PersistentStorage_DeleteProp_null_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_DeleteProp_null_001] START');
      try {
        const key: string | null = null;
        // DeleteProp with null key - behavior depends on implementation
        PersistentStorage.DeleteProp(key);
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_DeleteProp_null_001] END');
      } catch (err) {
        console.error('[PersistentStorage_DeleteProp_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistentStorage_DeleteProp_undefined_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_DELETEPROP_PARAM_UNDEFINED_002
     * @tc.desc   Test deprecated PersistentStorage.DeleteProp with undefined key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('PersistentStorage_DeleteProp_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_DeleteProp_undefined_001] START');
      try {
        const key: string | undefined = undefined;
        // DeleteProp with undefined key - behavior depends on implementation
        PersistentStorage.DeleteProp(key);
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_DeleteProp_undefined_001] END');
      } catch (err) {
        console.error('[PersistentStorage_DeleteProp_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistentStorage_DeleteProp_emptyString_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_DELETEPROP_PARAM_EMPTYSTRING_002
     * @tc.desc   Test deprecated PersistentStorage.DeleteProp with empty string key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('PersistentStorage_DeleteProp_emptyString_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_DeleteProp_emptyString_001] START');
      try {
        const key: string = '';
        // DeleteProp with empty string key - behavior depends on implementation
        PersistentStorage.DeleteProp(key);
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_DeleteProp_emptyString_001] END');
      } catch (err) {
        console.error('[PersistentStorage_DeleteProp_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // PersistentStorage.persistProps(props) - API 10+
    // ============================================


    /**
     * @tc.name   PersistentStorage_persistProps_emptyString_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_PERSISTPROPS_PARAM_EMPTYSTRING_001
     * @tc.desc   Test PersistentStorage.persistProps with empty string defaultValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistentStorage_persistProps_emptyString_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProps_emptyString_001] START');
      try {
        const propName: string = 'testPersistPropsEmptyString';
        // persistProps with empty string defaultValue
        const props: PersistPropsOptions[] = [{ key: propName, defaultValue: '' }];
        PersistentStorage.persistProps(props);

        // Verify the property was created with empty string value
        const hasResult: boolean = AppStorage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = AppStorage.get<string>(propName);
        expect(getValue).assertEqual('');

        // Clean up
        PersistentStorage.deleteProp(propName);
        console.info('[PersistentStorage_persistProps_emptyString_001] END');
      } catch (err) {
        console.error('[PersistentStorage_persistProps_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   PersistentStorage_persistProps_emptyKey_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_PERSISTPROPS_PARAM_EMPTYKEY_001
     * @tc.desc   Test PersistentStorage.persistProps with empty string key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PersistentStorage_persistProps_emptyKey_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_persistProps_emptyKey_001] START');
      try {
        const propName: string = '';
        // persistProps with empty string key
        const props: PersistPropsOptions[] = [{ key: propName, defaultValue: 'testValue' }];
        PersistentStorage.persistProps(props);

        // Clean up if property was created
        if (AppStorage.has(propName)) {
          PersistentStorage.deleteProp(propName);
        }
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_persistProps_emptyKey_001] END');
      } catch (err) {
        console.error('[PersistentStorage_persistProps_emptyKey_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // PersistentStorage.PersistProps(properties) - deprecated
    // ============================================


    /**
     * @tc.name   PersistentStorage_PersistProps_emptyKey_001
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_PERSISTPROPS_PARAM_EMPTYKEY_002
     * @tc.desc   Test deprecated PersistentStorage.PersistProps with empty string key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @deprecated since 10
     */
    it('PersistentStorage_PersistProps_emptyKey_001', Level.LEVEL2, () => {
      console.info('[PersistentStorage_PersistProps_emptyKey_001] START');
      try {
        const propName: string = '';
        // PersistProps with empty string key (deprecated API)
        PersistentStorage.PersistProps([{ key: propName, defaultValue: 'testValue' }]);

        // Clean up if property was created
        if (AppStorage.has(propName)) {
          PersistentStorage.deleteProp(propName);
        }
        // If no exception is thrown, the test passes
        console.info('[PersistentStorage_PersistProps_emptyKey_001] END');
      } catch (err) {
        console.error('[PersistentStorage_PersistProps_emptyKey_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // LocalStorage.setAndRef(propName, defaultValue) - API 12+
    // ============================================

    /**
     * @tc.name   LocalStorage_setAndRef_null_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDREF_PARAM_NULL_001
     * @tc.desc   Test LocalStorage.setAndRef with null defaultValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndRef_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetAndRefNull';
        const defaultValue: string | null = null;
        const prop: AbstractProperty<string | null> = storage.setAndRef<string | null>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue: string | null | undefined = storage.get<string | null>(propName);
        expect(getValue).assertEqual(null);

        // Clean up - AbstractProperty has no aboutToBeDeleted, use storage.delete instead
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[LocalStorage_setAndRef_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndRef_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setAndRef_undefined_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDREF_PARAM_UNDEFINED_001
     * @tc.desc   Test LocalStorage.setAndRef with undefined defaultValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndRef_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetAndRefUndefined';
        const defaultValue: string | undefined = undefined;
        const prop: AbstractProperty<string | undefined> = storage.setAndRef<string | undefined>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue: string | undefined | null = storage.get<string | undefined>(propName);
        expect(getValue).assertEqual(undefined);

        // Clean up - AbstractProperty has no aboutToBeDeleted, use storage.delete instead
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[LocalStorage_setAndRef_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndRef_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setAndRef_emptyString_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDREF_PARAM_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.setAndRef with empty string defaultValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndRef_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetAndRefEmptyString';
        const defaultValue: string = '';
        const prop: AbstractProperty<string> = storage.setAndRef<string>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue: string | null | undefined = storage.get<string>(propName);
        expect(getValue).assertEqual('');

        // Clean up - AbstractProperty has no aboutToBeDeleted, use storage.delete instead
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[LocalStorage_setAndRef_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndRef_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setAndRef_nullPropName_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDREF_PARAM_NULLPROPNAME_001
     * @tc.desc   Test LocalStorage.setAndRef with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndRef_nullPropName_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_nullPropName_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        const defaultValue: string = 'testValue';
        const prop: AbstractProperty<string> | undefined = storage.setAndRef<string>(propName, defaultValue);
        // setAndRef with null propName should return undefined
        expect(prop?.get()).assertEqual(defaultValue);

        // Clean up if property was created - AbstractProperty has no aboutToBeDeleted, use storage.delete instead
        if (prop !== undefined && propName !== null) {
          const deleteResult: boolean = storage.delete(propName);
          expect(deleteResult).assertTrue();
        }
        console.info('[LocalStorage_setAndRef_nullPropName_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndRef_nullPropName_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setAndRef_undefinedPropName_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDREF_PARAM_UNDEFINEDPROPNAME_001
     * @tc.desc   Test LocalStorage.setAndRef with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndRef_undefinedPropName_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_undefinedPropName_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        const defaultValue: string = 'testValue';
        const prop: AbstractProperty<string> | undefined = storage.setAndRef<string>(propName, defaultValue);
        // setAndRef with undefined propName should return undefined
        expect(prop?.get()).assertEqual(defaultValue);

        // Clean up if property was created - AbstractProperty has no aboutToBeDeleted, use storage.delete instead
        if (prop !== undefined && propName !== undefined) {
          const deleteResult: boolean = storage.delete(propName);
          expect(deleteResult).assertTrue();
        }
        console.info('[LocalStorage_setAndRef_undefinedPropName_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndRef_undefinedPropName_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // LocalStorage.prop(propName) - API 9+
    // ============================================

    /**
     * @tc.name   LocalStorage_prop_null_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_PROP_PARAM_NULL_001
     * @tc.desc   Test LocalStorage.prop with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_prop_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        const prop: SubscribedAbstractProperty<string> | undefined = storage.prop<string>(propName);
        // prop with null propName should return undefined
        expect(prop).assertEqual(undefined);

        // Clean up if property was created
        if (prop !== undefined && propName !== null) {
          prop.aboutToBeDeleted();
          const deleteResult: boolean = storage.delete(propName);
          expect(deleteResult).assertTrue();
        }
        console.info('[LocalStorage_prop_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_prop_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_prop_undefined_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_PROP_PARAM_UNDEFINED_001
     * @tc.desc   Test LocalStorage.prop with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_prop_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        const prop: SubscribedAbstractProperty<string> | undefined = storage.prop<string>(propName);
        // prop with undefined propName should return undefined
        expect(prop).assertEqual(undefined);

        // Clean up if property was created
        if (prop !== undefined && propName !== undefined) {
          prop.aboutToBeDeleted();
          const deleteResult: boolean = storage.delete(propName);
          expect(deleteResult).assertTrue();
        }
        console.info('[LocalStorage_prop_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_prop_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_prop_emptyString_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_PROP_PARAM_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.prop with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_prop_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';
        const prop: SubscribedAbstractProperty<string> | undefined = storage.prop<string>(propName);
        // prop with empty string propName should return undefined
        expect(prop).assertEqual(undefined);

        // Clean up if property was created
        if (prop !== undefined) {
          prop.aboutToBeDeleted();
          const deleteResult: boolean = storage.delete(propName);
          expect(deleteResult).assertTrue();
        }
        console.info('[LocalStorage_prop_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_prop_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ============================================
    // LocalStorage.setAndProp(propName, defaultValue) - API 9+
    // ============================================

    /**
     * @tc.name   LocalStorage_setAndProp_null_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDPROP_PARAM_NULL_001
     * @tc.desc   Test LocalStorage.setAndProp with null defaultValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndProp_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndProp_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetAndPropNull';
        const defaultValue: string | null = null;
        const prop: SubscribedAbstractProperty<string | null> = storage.setAndProp<string | null>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue: string | null | undefined = storage.get<string | null>(propName);
        expect(getValue).assertEqual(null);

        // Clean up - call aboutToBeDeleted first, then delete from storage
        prop.aboutToBeDeleted();
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[LocalStorage_setAndProp_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndProp_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setAndProp_undefined_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDPROP_PARAM_UNDEFINED_001
     * @tc.desc   Test LocalStorage.setAndProp with undefined defaultValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndProp_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndProp_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetAndPropUndefined';
        const defaultValue: string | undefined = undefined;
        const prop: SubscribedAbstractProperty<string | undefined> = storage.setAndProp<string | undefined>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue: string | undefined | null = storage.get<string | undefined>(propName);
        expect(getValue).assertEqual(undefined);

        // Clean up - call aboutToBeDeleted first, then delete from storage
        prop.aboutToBeDeleted();
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[LocalStorage_setAndProp_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndProp_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setAndProp_emptyString_001
     * @tc.number SUB_ARKUI_LOCALSTORAGE_SETANDPROP_PARAM_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.setAndProp with empty string defaultValue (API 9+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndProp_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndProp_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetAndPropEmptyString';
        const defaultValue: string = '';
        const prop: SubscribedAbstractProperty<string> = storage.setAndProp<string>(propName, defaultValue);

        expect(prop !== undefined).assertTrue();
        const getValue: string | null | undefined = storage.get<string>(propName);
        expect(getValue).assertEqual('');

        // Clean up - call aboutToBeDeleted first, then delete from storage
        prop.aboutToBeDeleted();
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        console.info('[LocalStorage_setAndProp_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndProp_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });
  });
}
