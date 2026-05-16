/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import dataPreferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";
import { BusinessError } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const NAME = 'test_preferences';
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

const KEY_TEST_STRING_ELEMENT = 'key_test_string';
let mPreferences: dataPreferences.Preferences;
export default function preferencesSyncErrTest() {
  describe('preferencesSyncErrTest', () => {
    beforeAll(async () => {
      console.info('beforeAll');
    });
    afterAll(async () => {
      console.info('afterAll');
    });
    beforeEach(async () => {
      console.info('beforeEach');
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    });
    afterEach(async () => {
      console.info('afterEach');
      await dataPreferences.deletePreferences(context, NAME);
    });


    /**
     * @tc.name   testPreferencesGetPreferencesSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesSyncErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.getPreferencesSync(null, options1);
        console.info("testPreferencesGetPreferencesSyncErr0100" + mPreference);
        expect(mPreference).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesSyncErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetPreferencesSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesSyncErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.getPreferencesSync(undefined, options2);
        console.info("testPreferencesGetPreferencesSyncErr0200" + mPreference);
        expect(mPreference).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesSyncErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetPreferencesSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesSyncErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.getPreferencesSync(context, null);
        console.info("testPreferencesGetPreferencesSyncErr0300" + mPreference);
        expect(mPreference).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesSyncErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetPreferencesSyncErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesSyncErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.getPreferencesSync(context, undefined);
        console.info("testPreferencesGetPreferencesSyncErr0400" + mPreference);
        expect(mPreference).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesSyncErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheSyncErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.removePreferencesFromCacheSync(context, undefined);
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0100" + mPreference);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheSyncErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.removePreferencesFromCacheSync(context, null);
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0200" + mPreference);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheSyncErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.removePreferencesFromCacheSync(context, "");
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0300" + mPreference);
        expect().assertUndefined();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheSyncErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.removePreferencesFromCacheSync(null, NAME);
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0400" + mPreference);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_0900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheSyncErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.removePreferencesFromCacheSync(undefined, NAME);
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0500" + mPreference);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0600
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheSyncErr0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.removePreferencesFromCacheSync(null, options1);
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0600" + mPreference);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0600 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0700
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesRemovePreferencesFromCacheSyncErr0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let mPreference = dataPreferences.removePreferencesFromCacheSync(undefined, options2);
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0700" + mPreference);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncErr0700 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesPutSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutSyncErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.putSync(undefined, 'default');
        console.info("testPreferencesPutSyncErr0100" );
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesPutSyncErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesPutSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutSyncErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.putSync(null, 'default');
        console.info("testPreferencesPutSyncErr0200" );
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesPutSyncErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesPutSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutSyncErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.putSync('', 'default');
        let value = mPreferences.getSync('', 'default');
        console.info("testPreferencesPutSyncErr0300" + value );
        expect(value).assertEqual('default');
        done();
      } catch (err) {
        console.info("testPreferencesPutSyncErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesPutSyncErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutSyncErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.putSync(KEY_TEST_STRING_ELEMENT, undefined);
        console.info("testPreferencesPutSyncErr0400" );
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesPutSyncErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesPutSyncErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesPutSyncErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.putSync(KEY_TEST_STRING_ELEMENT, null);
        console.info("testPreferencesPutSyncErr0500" );
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesPutSyncErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetSyncErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = mPreferences.getSync(undefined, 'default');
        console.info("testPreferencesGetSyncErr0100" + value);
        expect(value).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetSyncErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetSyncErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = mPreferences.getSync(null, 'default');
        console.info("testPreferencesGetSyncErr0200" + value);
        expect(value).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetSyncErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_1900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetSyncErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = mPreferences.getSync('', 3);
        console.info("testPreferencesGetSyncErr0300  value is:" + value);
        expect(value).assertEqual(3);
        done();
      } catch (err) {
        console.info("testPreferencesGetSyncErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetSyncErr0400
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetSyncErr0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, null);
        console.info("testPreferencesGetSyncErr0400" + value);
        expect(value).assertEqual(null);
        done();
      } catch (err) {
        console.info("testPreferencesGetSyncErr0400 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesGetSyncErr0500
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetSyncErr0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, undefined);
        console.info("testPreferencesGetSyncErr0500" + value);
        expect(value).assertEqual(undefined);
        done();
      } catch (err) {
        console.info("testPreferencesGetSyncErr0500 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesDeleteSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeleteSyncErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.deleteSync(null);
        console.info("testPreferencesDeleteSyncErr0100");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesDeleteSyncErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesDeleteSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeleteSyncErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.deleteSync(undefined);
        console.info("testPreferencesDeleteSyncErr0100");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesDeleteSyncErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesDeleteSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDeleteSyncErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.deleteSync('');
        console.info("testPreferencesDeleteSyncErr0300");
        done();
      } catch (err) {
        console.info("testPreferencesDeleteSyncErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesHasSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasSyncErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isExist: boolean = mPreferences.hasSync("");
        console.info("testPreferencesHasSyncErr0100" + isExist);
        expect(isExist).assertEqual(false);
        done();
      } catch (err) {
        console.info("testPreferencesHasSyncErr0100 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesHasSyncErr0200
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasSyncErr0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isExist: boolean = mPreferences.hasSync(null);
        expect(isExist).assertEqual(false);
        console.info("testPreferencesHasSyncErr0200" + isExist);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesHasSyncErr0200 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })


    /**
     * @tc.name   testPreferencesHasSyncErr0300
     * @tc.number SUB_DistributedData_Preference_SDK_Sendable_Preference_Sync_Ets_Err_Api_Test_2700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesHasSyncErr0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isExist: boolean = mPreferences.hasSync(undefined);
        expect(isExist).assertEqual(false);
        console.info("testPreferencesHasSyncErr0300" + isExist);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesHasSyncErr0300 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    })
  })
}