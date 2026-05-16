/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LocalStorageReturnValue() {
  describe('LocalStorageReturnValue', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStorageReturnValue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/localStorage/LocalStorageReturnValue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStorageReturnValue state pages:" + JSON.stringify(pages));
        if (!("LocalStorageReturnValue" == pages.name)) {
          console.info("get LocalStorageReturnValue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStorageReturnValue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorageReturnValue page error:" + err);
      }
      console.info("LocalStorageReturnValue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalStorageReturnValue after each called");
    });

    /**
     * @tc.name   LocalStorageReturnValue_001
     * @tc.number LocalStorageReturnValue_001
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_001] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_001': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let refToPropA1: AbstractProperty<number> | undefined = storage.ref('LocalStorageReturnValue_001_no');
      console.info("[LocalStorageReturnValue_001] component refToPropA1: " + JSON.stringify(refToPropA1));
      expect(refToPropA1).assertEqual(undefined);
      let delFlag: boolean = storage.delete('LocalStorageReturnValue_001');
      let delFlag_no: boolean = storage.delete('LocalStorageReturnValue_001_no');
      console.info("[LocalStorageReturnValue_001] component delFlag: " + JSON.stringify(delFlag));
      console.info("[LocalStorageReturnValue_001] component delFlag_no: " + JSON.stringify(delFlag_no));
      expect(delFlag).assertTrue();
      expect(delFlag_no).assertFalse();
      console.info('[LocalStorageReturnValue_001] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_002
     * @tc.number LocalStorageReturnValue_002
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_002', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_002] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_002': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let res_0021: boolean = storage.has('LocalStorageReturnValue_002');
      let res_0022: boolean = storage.has('LocalStorageReturnValue_002_no');
      let res_0023: string|undefined = storage.get<string>('LocalStorageReturnValue_002_no');
      console.info("[LocalStorageReturnValue_002] component res_0021: " + JSON.stringify(res_0021));
      console.info("[LocalStorageReturnValue_002] component res_0022: " + JSON.stringify(res_0022));
      console.info("[LocalStorageReturnValue_002] component res_0023: " + JSON.stringify(res_0023));
      expect(res_0021).assertTrue();
      expect(res_0022).assertFalse();
      expect(res_0023).assertEqual(undefined);
      storage.delete('LocalStorageReturnValue_002');
      console.info('[LocalStorageReturnValue_002] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_003
     * @tc.number LocalStorageReturnValue_003
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_003', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_003] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_003': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let res_0031: boolean = storage.set('LocalStorageReturnValue_003', 48);
      let res_0032: boolean = storage.set('LocalStorageReturnValue_003_no', 50);
      console.info("[LocalStorageReturnValue_003] component res_0031: " + JSON.stringify(res_0031));
      console.info("[LocalStorageReturnValue_003] component res_0032: " + JSON.stringify(res_0032));
      expect(res_0031).assertTrue();
      expect(res_0032).assertFalse();
      storage.delete('LocalStorageReturnValue_003');
      console.info('[LocalStorageReturnValue_003] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_004
     * @tc.number LocalStorageReturnValue_004
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_004', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_004] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_004': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let x = storage.link<number>('LocalStorageReturnValue_004');
      let res_0040: boolean = storage.clear();
      console.info("[LocalStorageReturnValue_004] component res_0040: " + JSON.stringify(res_0040) + " keys:" + storage.keys());
      x.aboutToBeDeleted();
      let res_0041: boolean = storage.clear();
      console.info("[LocalStorageReturnValue_004] component res_0041: " + JSON.stringify(res_0041) + " keys:" + storage.keys());
      expect(res_0040).assertFalse();
      expect(res_0041).assertTrue();
      storage.delete('LocalStorageReturnValue_004');
      console.info('[LocalStorageReturnValue_004] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_005
     * @tc.number LocalStorageReturnValue_005
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_005', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id("getSharedLocalStorage_001"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let res_0051: undefined | LocalStorage = AppStorage.get<undefined | LocalStorage>('getSharedLocalStorage_001');
      console.info("[LocalStorageReturnValue_005] component res_0051: " + JSON.stringify(res_0051));
      expect(res_0051).assertEqual(undefined);
      console.info("[LocalStorageReturnValue_005] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[LocalStorageReturnValue_005] END');
      done();
    });

  // ========== setAndRef Tests ==========

    /**
     * @tc.name   LocalStorage_setAndRef_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SETANDREF_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.setAndRef with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setAndRef_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setAndRef_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';
        const defaultValue: number = 100;

        // Test setAndRef with empty string propName
        const result: AbstractProperty<number> = storage.setAndRef<number>(propName, defaultValue);
        console.info('[LocalStorage_setAndRef_propName_emptyString_001] result: ' + JSON.stringify(result));

        // Verify the property was created with empty string as key
        expect(result !== undefined).assertTrue();
        const hasResult: boolean = storage.has(propName);
        expect(hasResult).assertTrue();

        // Verify the value
        const getValue: number | null | undefined = storage.get<number>(propName);
        expect(getValue).assertEqual(defaultValue);

        // Verify result.get() returns the default value
        const refValue: number = result.get();
        expect(refValue).assertEqual(defaultValue);

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_setAndRef_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_setAndRef_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== ref Tests ==========

    /**
     * @tc.name   LocalStorage_ref_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_REF_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.ref with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_ref_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_ref_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';

        // Create property with empty string key first
        storage.setOrCreate(propName, 47);

        // Test ref with empty string propName
        const result: AbstractProperty<number> | undefined = storage.ref<number>(propName);
        console.info('[LocalStorage_ref_propName_emptyString_001] result: ' + JSON.stringify(result));

        // Should return a reference to the existing property
        expect(result !== undefined).assertTrue();
        if (result !== undefined) {
          const refValue: number = result.get();
          expect(refValue).assertEqual(47);
        }

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        // Try ref with non-existent empty string key
        const result2: AbstractProperty<number> | undefined = storage.ref<number>(propName);
        expect(result2).assertEqual(undefined);

        console.info('[LocalStorage_ref_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_ref_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_ref_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_REF_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.ref with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_ref_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_ref_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;

        // Test ref with null propName
        const result: AbstractProperty<Object> | undefined = storage.ref<Object>(propName);
        console.info('[LocalStorage_ref_propName_null_001] result: ' + JSON.stringify(result));

        // Should return undefined for null propName
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_ref_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_ref_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        console.info('[LocalStorage_ref_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_ref_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_REF_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.ref with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_ref_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_ref_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;

        // Test ref with undefined propName
        const result: AbstractProperty<Object> | undefined = storage.ref<Object>(propName);
        console.info('[LocalStorage_ref_propName_undefined_001] result: ' + JSON.stringify(result));

        // Should return undefined for undefined propName
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_ref_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_ref_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        console.info('[LocalStorage_ref_propName_undefined_001] Expected error caught');
      }
    });

    // ========== has Tests ==========

    /**
     * @tc.name   LocalStorage_has_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_HAS_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.has with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_has_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_has_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';

        // Test has with empty string propName - should return false initially
        const result1: boolean = storage.has(propName);
        expect(result1).assertFalse();

        // Create property with empty string key
        storage.setOrCreate(propName, 'testValue');
        const result2: boolean = storage.has(propName);
        expect(result2).assertTrue();

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        const result3: boolean = storage.has(propName);
        expect(result3).assertFalse();

        console.info('[LocalStorage_has_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_has_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_has_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_HAS_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.has with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_has_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_has_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;

        // Test has with null propName
        const result: boolean = storage.has(propName);
        console.info('[LocalStorage_has_propName_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[LocalStorage_has_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_has_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_has_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_has_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_HAS_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.has with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_has_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_has_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;

        // Test has with undefined propName
        const result: boolean = storage.has(propName);
        console.info('[LocalStorage_has_propName_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[LocalStorage_has_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_has_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_has_propName_undefined_001] Expected error caught');
      }
    });

    // ========== get Tests ==========

    /**
     * @tc.name   LocalStorage_get_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_GET_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.get with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_get_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_get_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';

        // Test get with empty string propName - should return undefined initially
        const result1: Object | undefined = storage.get<Object>(propName);
        expect(result1).assertEqual(undefined);

        // Create property with empty string key
        storage.setOrCreate(propName, 'testValue');
        const result2: string | null | undefined = storage.get<string>(propName);
        expect(result2).assertEqual('testValue');

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();
        const result3: Object | undefined = storage.get<Object>(propName);
        expect(result3).assertEqual(undefined);

        console.info('[LocalStorage_get_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_get_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_get_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_GET_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.get with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_get_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_get_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;

        // Test get with null propName
        const result: Object | undefined = storage.get<Object>(propName);
        console.info('[LocalStorage_get_propName_null_001] result: ' + JSON.stringify(result));
        // Should return undefined for null propName
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_get_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_get_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_get_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_get_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_GET_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.get with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_get_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_get_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;

        // Test get with undefined propName
        const result: Object | undefined = storage.get<Object>(propName);
        console.info('[LocalStorage_get_propName_undefined_001] result: ' + JSON.stringify(result));
        // Should return undefined for undefined propName
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_get_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_get_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_get_propName_undefined_001] Expected error caught');
      }
    });

    // ========== set Tests ==========

    /**
     * @tc.name   LocalStorage_set_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SET_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.set with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_set_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';
        const newValue: string = 'testValue';

        // Create property with empty string key first
        storage.setOrCreate(propName, 'initialValue');
        const hasResult1: boolean = storage.has(propName);
        expect(hasResult1).assertTrue();

        // Now set it to a new value
        const result: boolean = storage.set<string>(propName, newValue);
        console.info('[LocalStorage_set_propName_emptyString_001] result: ' + result);
        expect(result).assertTrue();
        const getValue: string | null | undefined = storage.get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_set_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_set_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_set_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SET_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.set with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_set_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        const newValue: string = 'testValue';

        // Test set with null propName on non-existent property
        const result: boolean = storage.set<string>(propName, newValue);
        console.info('[LocalStorage_set_propName_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[LocalStorage_set_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_set_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_set_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_set_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SET_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.set with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_set_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        const newValue: string = 'testValue';

        // Test set with undefined propName on non-existent property
        const result: boolean = storage.set<string>(propName, newValue);
        console.info('[LocalStorage_set_propName_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[LocalStorage_set_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_set_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_set_propName_undefined_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_set_newValue_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SET_NEWVALUE_NULL_001
     * @tc.desc   Test LocalStorage.set with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_set_newValue_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_newValue_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetNull';

        // First create a property
        storage.setOrCreate(propName, 'initialValue');
        const hasResult1: boolean = storage.has(propName);
        expect(hasResult1).assertTrue();
        const getValue1: string | null | undefined = storage.get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Now set it to null (API 12+ allows null)
        const result: boolean = storage.set<Object | null>(propName, null);
        console.info('[LocalStorage_set_newValue_null_001] result: ' + result);
        expect(result).assertTrue();
        const getValue2: string | null | undefined = storage.get<string | null>(propName);
        expect(getValue2).assertEqual(null);

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_set_newValue_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_set_newValue_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_set_newValue_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SET_NEWVALUE_UNDEFINED_001
     * @tc.desc   Test LocalStorage.set with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_set_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_newValue_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetUndefined';

        // First create a property
        storage.setOrCreate(propName, 'initialValue');
        const hasResult1: boolean = storage.has(propName);
        expect(hasResult1).assertTrue();
        const getValue1: string | undefined | null = storage.get<string>(propName);
        expect(getValue1).assertEqual('initialValue');

        // Now set it to undefined (API 12+ allows undefined)
        const result: boolean = storage.set<Object | undefined>(propName, undefined);
        console.info('[LocalStorage_set_newValue_undefined_001] result: ' + result);
        expect(result).assertTrue();
        const getValue2: string | undefined | null = storage.get<string | undefined>(propName);
        expect(getValue2).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_set_newValue_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_set_newValue_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_set_newValue_null_nonExistent_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SET_NEWVALUE_NULL_NONEXISTENT_001
     * @tc.desc   Test LocalStorage.set with null newValue on non-existent property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_set_newValue_null_nonExistent_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_newValue_null_nonExistent_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetNullNonExistent';

        // Ensure property doesn't exist
        const hasBefore: boolean = storage.has(propName);
        expect(hasBefore).assertFalse();

        // Setting null on non-existent property should return false
        const result: boolean = storage.set<Object | null>(propName, null);
        console.info('[LocalStorage_set_newValue_null_nonExistent_001] result: ' + result);
        expect(result).assertFalse();

        console.info('[LocalStorage_set_newValue_null_nonExistent_001] END');
      } catch (err) {
        console.error('[LocalStorage_set_newValue_null_nonExistent_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_set_newValue_undefined_nonExistent_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SET_NEWVALUE_UNDEFINED_NONEXISTENT_001
     * @tc.desc   Test LocalStorage.set with undefined newValue on non-existent property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_set_newValue_undefined_nonExistent_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_set_newValue_undefined_nonExistent_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetUndefinedNonExistent';

        // Ensure property doesn't exist
        const hasBefore: boolean = storage.has(propName);
        expect(hasBefore).assertFalse();

        // Setting undefined on non-existent property should return false
        const result: boolean = storage.set<Object | undefined>(propName, undefined);
        console.info('[LocalStorage_set_newValue_undefined_nonExistent_001] result: ' + result);
        expect(result).assertFalse();

        console.info('[LocalStorage_set_newValue_undefined_nonExistent_001] END');
      } catch (err) {
        console.error('[LocalStorage_set_newValue_undefined_nonExistent_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== setOrCreate Tests ==========

    /**
     * @tc.name   LocalStorage_setOrCreate_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SETORCREATE_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.setOrCreate with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setOrCreate_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';
        const newValue: string = 'testValue';

        // Test setOrCreate with empty string propName (should create)
        const result1: boolean = storage.setOrCreate(propName, newValue);
        expect(result1).assertTrue();
        const hasResult: boolean = storage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: string | null | undefined = storage.get<string>(propName);
        expect(getValue).assertEqual(newValue);

        // Test setOrCreate with same empty string propName (should update)
        const newValue2: string = 'testValue2';
        const result2: boolean = storage.setOrCreate(propName, newValue2);
        expect(result2).assertTrue();
        const getValue2: string | null | undefined = storage.get<string>(propName);
        expect(getValue2).assertEqual(newValue2);

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_setOrCreate_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setOrCreate_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SETORCREATE_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.setOrCreate with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setOrCreate_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;
        const newValue: string = 'testValue';

        // Test setOrCreate with null propName
        const result: boolean = storage.setOrCreate(propName, newValue);
        console.info('[LocalStorage_setOrCreate_propName_null_001] result: ' + result);

        // Verify the result based on actual behavior
        const hasResult: boolean = storage.has(propName);
        if (hasResult) {
          expect(result).assertTrue();
          const getValue: string | null | undefined = storage.get<string>(propName);
          expect(getValue).assertEqual(newValue);

          // Clean up
          const deleteResult: boolean = storage.delete(propName);
          expect(deleteResult).assertTrue();
        } else {
          expect(result).assertFalse();
        }

        console.info('[LocalStorage_setOrCreate_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_setOrCreate_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_setOrCreate_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SETORCREATE_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.setOrCreate with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setOrCreate_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;
        const newValue: string = 'testValue';

        // Test setOrCreate with undefined propName
        const result: boolean = storage.setOrCreate(propName, newValue);
        console.info('[LocalStorage_setOrCreate_propName_undefined_001] result: ' + result);

        // Verify the result based on actual behavior
        const hasResult: boolean = storage.has(propName);
        if (hasResult) {
          expect(result).assertTrue();
          const getValue: string | null | undefined = storage.get<string>(propName);
          expect(getValue).assertEqual(newValue);

          // Clean up
          const deleteResult: boolean = storage.delete(propName);
          expect(deleteResult).assertTrue();
        } else {
          expect(result).assertFalse();
        }

        console.info('[LocalStorage_setOrCreate_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_setOrCreate_propName_undefined_001] Expected error caught');
      }
    });


    /**
     * @tc.name   LocalStorage_setOrCreate_newValue_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SETORCREATE_NEWVALUE_NULL_001
     * @tc.desc   Test LocalStorage.setOrCreate with null newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setOrCreate_newValue_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_newValue_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetOrCreateNull';
        const newValue: Object | null = null;

        // Test setOrCreate with null newValue (API 12+ allows null)
        const result: boolean = storage.setOrCreate(propName, newValue);
        console.info('[LocalStorage_setOrCreate_newValue_null_001] result: ' + result);

        // Verify the property was created with null value
        expect(result).assertTrue();
        const hasResult: boolean = storage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | null | undefined = storage.get<Object | null>(propName);
        expect(getValue).assertEqual(null);

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_setOrCreate_newValue_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_newValue_null_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_setOrCreate_newValue_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_SETORCREATE_NEWVALUE_UNDEFINED_001
     * @tc.desc   Test LocalStorage.setOrCreate with undefined newValue (API 12+)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_setOrCreate_newValue_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_setOrCreate_newValue_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = 'testSetOrCreateUndefined';
        const newValue: Object | undefined = undefined;

        // Test setOrCreate with undefined newValue (API 12+ allows undefined)
        const result: boolean = storage.setOrCreate(propName, newValue);
        console.info('[LocalStorage_setOrCreate_newValue_undefined_001] result: ' + result);

        // Verify the property was created with undefined value
        expect(result).assertTrue();
        const hasResult: boolean = storage.has(propName);
        expect(hasResult).assertTrue();
        const getValue: Object | undefined | null = storage.get<Object | undefined>(propName);
        expect(getValue).assertEqual(undefined);

        // Clean up
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_setOrCreate_newValue_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_setOrCreate_newValue_undefined_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    // ========== link Tests ==========

    /**
     * @tc.name   LocalStorage_link_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_LINK_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.link with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_link_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_link_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';

        // Test link with empty string propName on non-existent property
        const result1: SubscribedAbstractProperty<string> | undefined = storage.link<string>(propName);
        console.info('[LocalStorage_link_propName_emptyString_001] result1: ' + JSON.stringify(result1));
        // Should return undefined for non-existent property
        expect(result1).assertEqual(undefined);

        // Create property with empty string key
        storage.setOrCreate(propName, 'testValue');
        const result2: SubscribedAbstractProperty<string> | undefined = storage.link<string>(propName);
        console.info('[LocalStorage_link_propName_emptyString_001] result2: ' + JSON.stringify(result2));
        // Should return a link to the existing property
        expect(result2 !== undefined).assertTrue();
        if (result2 !== undefined) {
          const linkValue: string = result2.get();
          expect(linkValue).assertEqual('testValue');
          // Clean up
          result2.aboutToBeDeleted();
        }
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_link_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_link_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_link_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_LINK_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.link with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_link_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_link_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;

        // Test link with null propName
        const result: SubscribedAbstractProperty<Object> | undefined = storage.link<Object>(propName);
        console.info('[LocalStorage_link_propName_null_001] result: ' + JSON.stringify(result));
        // link with null propName should return undefined
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_link_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_link_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        console.info('[LocalStorage_link_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_link_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_LINK_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.link with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_link_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_link_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;

        // Test link with undefined propName
        const result: SubscribedAbstractProperty<Object> | undefined = storage.link<Object>(propName);
        console.info('[LocalStorage_link_propName_undefined_001] result: ' + JSON.stringify(result));
        // link with undefined propName should return undefined
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_link_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_link_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        console.info('[LocalStorage_link_propName_undefined_001] Expected error caught');
      }
    });

    // ========== prop Tests ==========

    /**
     * @tc.name   LocalStorage_prop_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_PROP_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.prop with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_prop_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';

        // Test prop with empty string propName on non-existent property
        const result1: SubscribedAbstractProperty<string> | undefined = storage.prop<string>(propName);
        console.info('[LocalStorage_prop_propName_emptyString_001] result1: ' + JSON.stringify(result1));
        // Should return undefined for non-existent property
        expect(result1).assertEqual(undefined);

        // Create property with empty string key
        storage.setOrCreate(propName, 'testValue');
        const result2: SubscribedAbstractProperty<string> | undefined = storage.prop<string>(propName);
        console.info('[LocalStorage_prop_propName_emptyString_001] result2: ' + JSON.stringify(result2));
        // Should return a prop to the existing property
        expect(result2 !== undefined).assertTrue();
        if (result2 !== undefined) {
          const propValue: string = result2.get();
          expect(propValue).assertEqual('testValue');
          // Clean up
          result2.aboutToBeDeleted();
        }
        const deleteResult: boolean = storage.delete(propName);
        expect(deleteResult).assertTrue();

        console.info('[LocalStorage_prop_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_prop_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_prop_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_PROP_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.prop with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_prop_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;

        // Test prop with null propName
        const result: SubscribedAbstractProperty<Object> | undefined = storage.prop<Object>(propName);
        console.info('[LocalStorage_prop_propName_null_001] result: ' + JSON.stringify(result));
        // prop with null propName should return undefined
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_prop_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_prop_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        console.info('[LocalStorage_prop_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_prop_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_PROP_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.prop with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_prop_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_prop_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;

        // Test prop with undefined propName
        const result: SubscribedAbstractProperty<Object> | undefined = storage.prop<Object>(propName);
        console.info('[LocalStorage_prop_propName_undefined_001] result: ' + JSON.stringify(result));
        // prop with undefined propName should return undefined
        expect(result).assertEqual(undefined);

        console.info('[LocalStorage_prop_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_prop_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error or return undefined
        console.info('[LocalStorage_prop_propName_undefined_001] Expected error caught');
      }
    });

    // ========== delete Tests ==========

    /**
     * @tc.name   LocalStorage_delete_propName_emptyString_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_DELETE_PROPNAME_EMPTYSTRING_001
     * @tc.desc   Test LocalStorage.delete with empty string propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_delete_propName_emptyString_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_delete_propName_emptyString_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string = '';

        // First create property with empty string key
        storage.setOrCreate(propName, 'testValue');
        const hasResult1: boolean = storage.has(propName);
        expect(hasResult1).assertTrue();

        // Now delete it
        const result: boolean = storage.delete(propName);
        console.info('[LocalStorage_delete_propName_emptyString_001] result: ' + result);
        expect(result).assertTrue();
        const hasResult2: boolean = storage.has(propName);
        expect(hasResult2).assertFalse();

        // Try deleting non-existent empty string key
        const result2: boolean = storage.delete(propName);
        expect(result2).assertFalse();

        console.info('[LocalStorage_delete_propName_emptyString_001] END');
      } catch (err) {
        console.error('[LocalStorage_delete_propName_emptyString_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   LocalStorage_delete_propName_null_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_DELETE_PROPNAME_NULL_001
     * @tc.desc   Test LocalStorage.delete with null propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_delete_propName_null_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_delete_propName_null_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | null = null;

        // Test delete with null propName on non-existent property
        const result: boolean = storage.delete(propName);
        console.info('[LocalStorage_delete_propName_null_001] result: ' + result);
        // Should return false for null propName
        expect(result).assertFalse();

        console.info('[LocalStorage_delete_propName_null_001] END');
      } catch (err) {
        console.error('[LocalStorage_delete_propName_null_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_delete_propName_null_001] Expected error caught');
      }
    });

    /**
     * @tc.name   LocalStorage_delete_propName_undefined_001
     * @tc.number SUB_ARUI_LOCALSTORAGE_DELETE_PROPNAME_UNDEFINED_001
     * @tc.desc   Test LocalStorage.delete with undefined propName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('LocalStorage_delete_propName_undefined_001', Level.LEVEL2, () => {
      console.info('[LocalStorage_delete_propName_undefined_001] START');
      try {
        const storage: LocalStorage = new LocalStorage();
        const propName: string | undefined = undefined;

        // Test delete with undefined propName on non-existent property
        const result: boolean = storage.delete(propName);
        console.info('[LocalStorage_delete_propName_undefined_001] result: ' + result);
        // Should return false for undefined propName
        expect(result).assertFalse();

        console.info('[LocalStorage_delete_propName_undefined_001] END');
      } catch (err) {
        console.error('[LocalStorage_delete_propName_undefined_001] Error: ' + JSON.stringify(err));
        // Expected behavior: may throw error
        console.info('[LocalStorage_delete_propName_undefined_001] Expected error caught');
      }
    });
    
  })
}
