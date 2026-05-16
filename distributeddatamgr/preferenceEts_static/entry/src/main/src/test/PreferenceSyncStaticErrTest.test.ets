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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import dataPreferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";
import { BusinessError } from "@ohos.base"
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'

let domain: int = 0x0000;
let tag: string = 'testTag';
hilog.info(domain, tag, '%{public}s', '================ export preferencetest start ....');
const KEY_TEST_DOUBLE_ELEMENT = 'key_test_double';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_DOUBLE_ARRAY_ELEMENT = 'key_test_double_array';
const KEY_TEST_BIGINT_ELEMENT = 'key_test_bigint';
const KEY_TEST_UINT8ARRAY_ELEMENT = 'key_test_uint8array';
const KEY_TEST_OBJECT_ELEMENT = 'key_test_object';
const KEY_TEST_INT_ARRAY_ELEMENT = 'key_test_int_array';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const MAX_KEY_LENGTH = 'X'.repeat(1024);
const MAX_VALUE_LENGTH = 'y'.repeat(16*1024*1024);
const NAME = 'test_preferences';
const NAME1 = "getPreferencesTest";
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';

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

let mPreferences: dataPreferences.Preferences |undefined = undefined;
let context: common.UIAbilityContext | undefined = undefined;
const TAG = '[PREFERENCES_CALLBACK_JSUNIT_TEST]'

class User {
  name: string = '';
  age: int;
  salary: double
};

class Company {
  cName: string = '';
  enName: string = '';
  year: int;
  money: BigInt = 0n;
  isActive: boolean = false;
  groups: string[] = [];
  users: User[] = [];
}

export default function preferenceSyncStaticTest() {
  describe('preferenceSyncStaticTest', (): void => {
    (async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll')
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          context = abilitys.context
          context!.stageMode = true;
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err: BusinessError | null): void => {
        if (err && err.code != 0) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.preferences");
      await Utils.msSleep(6000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })


    afterAll(async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll')
    })

    beforeEach(async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach, stagemode is ' + context!.stageMode)
      mPreferences = await dataPreferences.getPreferences(context!, NAME);
      mPreferences!.clearSync();
      mPreferences!.flush();
    })

    afterEach(async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterEach')
      await dataPreferences.deletePreferences(context!, NAME);
    })


    /**
     * @tc.name   PreferencesMaxValueStaticSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0100
     * @tc.desc   MAX_VALUE_LENGTH promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PreferencesMaxValueStaticSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesMaxValueStaticSync0100 start');
      mPreferences!.clearSync();
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesMaxValueStaticSync0100 start 2');
      const doubleVar = 6.666;
      mPreferences!.putSync(KEY_TEST_DOUBLE_ELEMENT, MAX_VALUE_LENGTH);
      mPreferences!.getSync(KEY_TEST_DOUBLE_ELEMENT, "defaultValue");
      expect(MAX_VALUE_LENGTH).assertEqual('defaultValue');
      done();
    })


    /**
     * @tc.name   testPreferencesGetPreferencesSyncStaticErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0200
     * @tc.desc   getPreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesGetPreferencesSyncStaticErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mPreferences = dataPreferences.getPreferences(context!, "");
        console.info("testPreferencesGetPreferencesSyncStaticErr0100" + mPreferences);
        expect(mPreferences).assertUndefined();
        done();
      } catch (err) {
        console.info("testPreferencesGetPreferencesSyncStaticErr0100 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePreferencesSyncStaticErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0300
     * @tc.desc   getPreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesDeletePreferencesSyncStaticErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mPreferences = dataPreferences.deletePreferences(context!, "");
        console.info("testPreferencesDeletePreferencesSyncStaticErr0100" + mPreferences);
        expect(mPreferences).assertUndefined();
        done();
      } catch (err) {
        console.info("testPreferencesDeletePreferencesSyncStaticErr0100 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesRemovePreferencesFromCacheSyncStaticErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0400
     * @tc.desc   getPreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesRemovePreferencesFromCacheSyncStaticErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        dataPreferences.removePreferencesFromCacheSync(context!, "");
        console.info("testPreferencesRemovePreferencesFromCacheSyncStaticErr0100");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCacheSyncStaticErr0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutSyncStaticErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0600
     * @tc.desc   getPreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesPutSyncStaticErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        mPreferences!.putSync("", 'default');
        console.info("testPreferencesPutSyncStaticErr0100");
        done();
      } catch (err) {
        console.info("testPreferencesPutSyncStaticErr0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetSyncStaticErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0700
     * @tc.desc   getPreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesGetSyncStaticErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        mPreferences!.putSync('', 'default');
        let value = mPreferences!.getSync('', 'default');
        console.info("testPreferencesGetSyncStaticErr0100" + value );
        expect(value).assertEqual('default');
        done();
      } catch (err) {
        console.info("testPreferencesGetSyncStaticErr0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeleteSyncStaticErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0800
     * @tc.desc   deleteSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesDeleteSyncStaticErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        mPreferences!.deleteSync('');
        console.info("testPreferencesDeleteSyncStaticErr0100");
        done();
      } catch (err) {
        console.info("testPreferencesDeleteSyncStaticErr0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasSyncStaticErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_Ets_Sync_ApiTest_0900
     * @tc.desc   deleteSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesHasSyncStaticErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let isExist: boolean = mPreferences!.hasSync("");
        console.info("testPreferencesHasSyncStaticErr0100" + isExist);
        expect(isExist).assertEqual(false);
        done();
      } catch (err) {
        console.info("testPreferencesHasSyncStaticErr0100 fail: " + err.message + "code: " + err.code);
        expect().assertFail();
        done();
      }
    });
  })
}