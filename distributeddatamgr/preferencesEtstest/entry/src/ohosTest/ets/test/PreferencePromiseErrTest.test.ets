/*
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import dataPreferences from "@ohos.data.preferences";
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { xml } from "@kit.ArkTS";

const NAME = "test_preferences";
const NAME1 = "getPreferencesTest";
const KEY_TEST_INT_ELEMENT = "key_test_int";
const KEY_TEST_LONG_ELEMENT = "key_test_long";
const KEY_TEST_FLOAT_ELEMENT = "key_test_float";
const KEY_TEST_BOOLEAN_ELEMENT = "key_test_boolean";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
const KEY_TEST_NUMBER_ARRAY_ELEMENT = "key_test_number_array";
const KEY_TEST_STRING_ARRAY_ELEMENT = "key_test_string_array";
const KEY_TEST_BOOL_ARRAY_ELEMENT = "key_test_bool_array";
let mPreferences: dataPreferences.Preferences;
const TAG = "[PREFERENCES_CALLBACK_JSUNIT_TEST]";
const options1:dataPreferences.Options = {
  name: NAME,
  dataGroupId:"",
  storageType:dataPreferences.StorageType.XML
}

const options2:dataPreferences.Options = {
  name: NAME,
  dataGroupId:"",
  storageType:dataPreferences.StorageType.GSKV
}

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

export default function preferencesPromiseErrTest() {
  describe("preferencesPromiseErrTest", () => {
    beforeAll(async () => {
      console.info("beforeAll");
      console.info("context=======>" + context);
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    });

    afterAll(async () => {
      console.info("afterAll");
      await dataPreferences.deletePreferences(context, NAME);
    });

    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(null, NAME1)
        console.info("testPreferencesGetPreferencesPromiseErr0100" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(undefined, NAME1)
        console.info("testPreferencesGetPreferencesPromiseErr0200" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = await dataPreferences.getPreferences(context, "");
        console.info("testPreferencesGetPreferencesPromiseErr0300" + mPreferences);
        expect(mPreferences).assertUndefined();
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0300 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(context, null);
        console.info("testPreferencesGetPreferencesPromiseErr0400" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(context, undefined);
        console.info("testPreferencesGetPreferencesPromiseErr0400" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0600
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(null, options1)
        console.info("testPreferencesGetPreferencesPromiseErr0600" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0600 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0700
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(undefined, options2)
        console.info("testPreferencesGetPreferencesPromiseErr0700" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0700 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0800
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(context, null);
        console.info("testPreferencesGetPreferencesPromiseErr0800" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0800 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr0900
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_0900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.getPreferences(context, undefined);
        console.info("testPreferencesGetPreferencesPromiseErr0900" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr0900 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromiseErr1000
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromiseErr1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isXmlSupported = dataPreferences.isStorageTypeSupported(null);
        console.info(TAG + "isXmlSupported: ${isXmlSupported}");
        expect(isXmlSupported).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesPromiseErr1000 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesPromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.deletePreferences(null, NAME1);
        console.info("testPreferencesDeletePreferencesPromiseErr0100" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesPromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesPromiseErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.deletePreferences(undefined, NAME1)
        console.info("testPreferencesDeletePreferencesPromiseErr0200" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesPromiseErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesPromiseErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = await dataPreferences.deletePreferences(context, "");
        console.info("testPreferencesDeletePreferencesPromiseErr0300" + mPreferences);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesPromiseErr0300 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesPromiseErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.deletePreferences(context, null);
        console.info("testPreferencesDeletePreferencesPromiseErr0400" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesPromiseErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesPromiseErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.deletePreferences(context, undefined);
        console.info("testPreferencesDeletePreferencesPromiseErr0500" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesPromiseErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0600
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesPromiseErr0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.deletePreferences(null, options1);
        console.info("testPreferencesDeletePreferencesPromiseErr0600" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesPromiseErr0600 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0700
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesPromiseErr0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.deletePreferences(undefined, options2);
        console.info("testPreferencesDeletePreferencesPromiseErr0700" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesPromiseErr0700 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(context, null);
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_1900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(context, undefined);
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0200" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(context, "");
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0300" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0300 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(null, NAME1);
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0400" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(undefined, NAME1);
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0500" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0600
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(null, options2);
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0600" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0600 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0700
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(null, options1);
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0700" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0700 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0800
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreferences = dataPreferences.removePreferencesFromCache(undefined, options1);
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0800" + mPreferences);
        expect(mPreferences).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0800 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPromiseErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPromiseErrTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.get("", null);
        console.info("testPreferencesGetPromiseErrTest0100");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesGetPromiseErrTest0100 fail: " + err.message + "code: " + err.code);
        expect('401').assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPromiseErrTest0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPromiseErrTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.get(KEY_TEST_STRING_ELEMENT, null);
        console.info("testPreferencesGetPromiseErrTest0200");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesGetPromiseErrTest0200 fail: " + err.message + "code: " + err.code);
        expect('401').assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPromiseErrTest0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPromiseErrTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.get(null, "default");
        console.info("testPreferencesGetPromiseErrTest0300");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesGetPromiseErrTest0300 fail: " + err.message + "code: " + err.code);
        expect('401').assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPromiseErrTest0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_2900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPromiseErrTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.get(undefined, "default");
        console.info("testPreferencesGetPromiseErrTest0400");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesGetPromiseErrTest0400 fail: " + err.message + "code: " + err.code);
        expect('401').assertEqual(err.code);
        done();
      }
    });
    /**
     * @tc.name   testPreferencesGetPromiseErrTest0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPromiseErrTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.get(KEY_TEST_STRING_ELEMENT, undefined);
        console.info("testPreferencesGetPromiseErrTest0500");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesGetPromiseErrTest0500 fail: " + err.message + "code: " + err.code);
        expect('401').assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutPromiseErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutPromiseErrTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put("", null);
        console.info("testPreferencesPutPromiseErrTest0100");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesPutPromiseErrTest0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutPromiseErrTest0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutPromiseErrTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, null);
        console.info("testPreferencesPutPromiseErrTest0200");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesPutPromiseErrTest0200 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutPromiseErrTest0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutPromiseErrTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, undefined);
        console.info("testPreferencesPutPromiseErrTest0300");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesPutPromiseErrTest0300 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutPromiseErrTest0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutPromiseErrTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put(null, "default");
        console.info("testPreferencesPutPromiseErrTest0400");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesPutPromiseErrTest0400 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutPromiseErrTest0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutPromiseErrTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put(undefined, "default");
        console.info("testPreferencesPutPromiseErrTest0500");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesPutPromiseErrTest0500 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePromiseErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePromiseErrTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.delete("");
        console.info("testPreferencesDeletePromiseErrTest0100");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesDeletePromiseErrTest0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePromiseErrTest0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePromiseErrTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.delete(null);
        console.info("testPreferencesDeletePromiseErrTest0200");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesDeletePromiseErrTest0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePromiseErrTest0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePromiseErrTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.delete(undefined);
        console.info("testPreferencesDeletePromiseErrTest0300");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesDeletePromiseErrTest0300 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasPromiseErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_3900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasPromiseErrTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.has(undefined);
        console.info("testPreferencesHasPromiseErrTest0100");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesHasPromiseErrTest0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasPromiseErrTest0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_4000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasPromiseErrTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.has(null);
        console.info("testPreferencesHasPromiseErrTest0200");
        expect().assertFail();
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesHasPromiseErrTest0200 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasPromiseErrTest0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_Promise_Test_4100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasPromiseErrTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let ret = await mPreferences.has("");
        console.info("testPreferencesDeletePromiseErr0100");
        expect(ret).assertEqual(false);
        done();
      } catch (err:BusinessError) {
        console.info("testPreferencesDeletePromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect().assertFail();
        done();
      }
    });
  })
}