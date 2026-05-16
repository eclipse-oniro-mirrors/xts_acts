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

export default function preferencesCallBackErrTest() {
  describe("preferencesCallBackErrTest", () => {
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
     * @tc.name   testPreferencesGetPreferencesErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(context, undefined, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(context, '', (err, preferences) => {
          console.info("testPreferencesGetPreferencesErr0200" + preferences);
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(context, '', (err, preferences) => {
          console.info("testPreferencesGetPreferencesErr0300" + preferences);
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(null, NAME1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(undefined, NAME1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesGetPreferencesErr0600
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(undefined, options1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0600 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesErr0700
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(null, options1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0700 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPreferencesErr0800
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesErr0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.getPreferences(null, options2, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferencesErr0800 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_0900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.deletePreferences(null, options2, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeletePreferencesErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.deletePreferences(undefined, options1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeletePreferencesErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.deletePreferences(undefined, "", (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeletePreferencesErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.deletePreferences(context, undefined, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeletePreferencesErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.deletePreferences(context, null, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeletePreferencesErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesDeletePreferencesErr0600
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesErr0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.deletePreferences(null, NAME1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeletePreferencesErr0600 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesErr0700
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeletePreferencesErr0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.deletePreferences(undefined, NAME1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeletePreferencesErr0700 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheCallBackErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.removePreferencesFromCache(undefined, NAME1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheCallBackErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.removePreferencesFromCache(null, NAME1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheCallBackErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheCallBackErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.removePreferencesFromCache(context, "", (err, preferences) => {
          console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0300" + preferences);
          done();
        });
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheCallBackErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_1900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheCallBackErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.removePreferencesFromCache(context, null, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheCallBackErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheCallBackErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.removePreferencesFromCache(context, undefined, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheCallBackErr0600
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheCallBackErr0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.removePreferencesFromCache(null, options1, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0600 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheCallBackErr0700
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheCallBackErr0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        dataPreferences.removePreferencesFromCache(undefined, options2, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheCallBackErr0700 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutCallBackErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.put(undefined, 'default', (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesPutCallBackErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutCallBackErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.put(null, 'default', (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesPutCallBackErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutCallBackErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutCallBackErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.put('', 'default', (err, preferences) => {
          mPreferences.get('', 'default', (err, pre) => {
            expect(pre).assertEqual('default');
          })
          done();
        });
      } catch (err) {
        console.info("testPreferencesPutCallBackErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutCallBackErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutCallBackErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.put(KEY_TEST_FLOAT_ELEMENT, null, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesPutCallBackErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutCallBackErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutCallBackErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.put(KEY_TEST_FLOAT_ELEMENT, undefined, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesPutCallBackErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetCallBackErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.get(undefined, 'default', (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetCallBackErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_2900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetCallBackErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.get(null, 'default', (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetCallBackErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetCallBackErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetCallBackErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.get("", 'default', (err, preferences) => {
          expect(preferences).assertEqual('default');
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetCallBackErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetCallBackErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetCallBackErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.get(KEY_TEST_INT_ELEMENT, null, (err, preferences) => {
          expect(preferences).assertEqual(null);
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetCallBackErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetCallBackErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetCallBackErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.get(KEY_TEST_INT_ELEMENT, undefined, (err, preferences) => {
          expect(preferences).assertEqual(undefined);
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetCallBackErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeleteCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeleteCallBackErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.delete(null, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetCallBackErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeleteCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeleteCallBackErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.delete(undefined, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeleteCallBackErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeleteCallBackErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeleteCallBackErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.delete("", (err, preferences) => {
          expect(err.code).assertEqual(15500000);
          done();
        });
      } catch (err) {
        console.info("testPreferencesDeleteCallBackErr0300 fail: " + err.message + "code: " + err.code);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasCallBackErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.has("", (err, preferences) => {
          expect(preferences).assertEqual(false);
          done();
        });
      } catch (err) {
        console.info("testPreferencesHasCallBackErr0100 fail: " + err.message + "code: " + err.code);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasCallBackErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.has(null, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesHasCallBackErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasCallBackErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasCallBackErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.has(undefined, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesHasCallBackErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesOnChangeCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_3900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesOnChangeCallBackErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        await mPreferences.clear();
        let observer = (key: string) => {
          console.info("testPreferencesOn001 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
          mPreferences.off("change", null);
        };
        mPreferences.on("change", null);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
        await mPreferences.flush();
      } catch (err) {
        console.info("Failed to testPreferencesOn001. code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesOnChangeCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_4000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesOnChangeCallBackErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        await mPreferences.clear();
        let observer = (key: string) => {
          console.info("testPreferencesOn001 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
          mPreferences.off("change", undefined);
        };
        mPreferences.on("change", undefined);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
        await mPreferences.flush();
      } catch (err) {
        console.info("Failed to testPreferencesOnChangeCallBackErr0200. code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesOnMultiProcessChangeCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_4100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesOnMultiProcessChangeCallBackErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let observer = (key: string) => {
        console.info(TAG + 'testPreferenceOnErrTest0100 keyValue' +
          mPreferences.getSync(KEY_STRING, "aaa"));
        done();
        expect('abc').assertEqual(mPreferences.getSync(KEY_STRING, "aaa"));
        mPreferences.off('multiProcessChange');
      };
      try {
        mPreferences.on('multiProcessChange', null);
        mPreferences.putSync(KEY_STRING, 'abc');
        await mPreferences.flush();
        expect().assertFail();
        done();
      } catch (err) {
        console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect('401').assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesOnMultiProcessChangeCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_4200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesOnMultiProcessChangeCallBackErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let observer = (key: string) => {
        console.info(TAG + 'testPreferenceOnErrTest0100 keyValue' +
          mPreferences.getSync(KEY_STRING, "aaa"));
        done();
        expect('abc').assertEqual(mPreferences.getSync(KEY_STRING, "aaa"));
        mPreferences.off('multiProcessChange');
      };
      try {
        mPreferences.on('multiProcessChange', undefined);
        mPreferences.putSync(KEY_STRING, 'abc');
        await mPreferences.flush();
        expect().assertFail();
        done();
      } catch (err) {
        console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect('401').assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesOFFDataChangeCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_4300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOFFDataChangeCallBackErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await mPreferences.clear();
      let observer = (key: lang.ISendable) => {
        console.info('testPreferencesOFFDataChangeCallBackErr0100 keyValue' +
          mPreferences.getSync(KEY_STRING, "aaa"));
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING, "aaa"));
        mPreferences.off('dataChange', null);
        }
        try {
          mPreferences.on('dataChange', null);
          expect().assertFail();
          done();
        } catch (err) {
          console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
          expect('401').assertEqual(err.code);
          done();
        }
      });


    /**
     * @tc.name   testPreferencesOnDataChangeCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_4400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnDataChangeCallBackErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await mPreferences.clear();
      let observer = (key: lang.ISendable) => {
        console.info('testPreferenceOffErrTest0100 keyValue' +
          mPreferences.getSync(KEY_STRING, "aaa"));
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING, "aaa"));
        mPreferences.off('dataChange', undefined);
      }
      try {
        mPreferences.on('dataChange', undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect('401').assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.name   testPreferencesOffMultiProcessChangeCallBackErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_4500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOffMultiProcessChangeCallBackErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let observer = (key: string) => {
        console.info(TAG + 'testPreferencesOffMultiProcessChangeCallBackErr0100 keyValue' +
          mPreferences.getSync(KEY_STRING, "aaa"));
        done();
        expect('abc').assertEqual(mPreferences.getSync(KEY_STRING, "aaa"));
        mPreferences.off('multiProcessChange',null);
      };
      try {
        mPreferences.on('multiProcessChange', observer);
        expect().assertFail();
        done();
      } catch (err) {
        console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect('401').assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesOffMultiProcessChangeCallBackErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Preference_Ets_Err_Api_CallbackTest_4600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOffMultiProcessChangeCallBackErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let observer = (key: string) => {
        console.info(TAG + 'testPreferencesOffMultiProcessChangeCallBackErr0100 keyValue' +
          mPreferences.getSync(KEY_STRING, "aaa"));
        done();
        expect('abc').assertEqual(mPreferences.getSync(KEY_STRING, "aaa"));
        mPreferences.off('multiProcessChange',undefined);
      };
      try {
        mPreferences.on('multiProcessChange', observer);
        expect().assertFail();
        done();
      } catch (err) {
        console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect('401').assertEqual(err.code);
        done();
      }
    })
  })
}