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

export default function preferencePromiseStaticTest() {
  describe('preferencePromiseStaticTest', (): void => {
    beforeAll(async () : Promise<void> => {
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
     * @tc.name   testPreferencesGetPreferencesPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Static_strong_basis_Ets_Promise_ApiTest_0100
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesGetPreferencesPromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mPreferences = await dataPreferences.getPreferences(context!, "");
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
     * @tc.name   testPreferencesDeletePreferencesPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Static_strong_basis_Ets_Promise_ApiTest_0200
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesDeletePreferencesPromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mPreferences = await dataPreferences.deletePreferences(context!, "");
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
     * @tc.name   testPreferencesRemovePreferencesFromCachePromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Static_strong_basis_Ets_Promise_ApiTest_0300
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesRemovePreferencesFromCachePromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let mPreferences = await dataPreferences.removePreferencesFromCache(context!, "");
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100" + mPreferences);
        expect(mPreferences!).assertUndefined();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesPutPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Static_strong_basis_Ets_Promise_ApiTest_0400
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesPutPromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "");
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect(401).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesGetPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Static_strong_basis_Ets_Promise_ApiTest_0500
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesGetPromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.get(KEY_TEST_STRING_ELEMENT, "");
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesRemovePreferencesFromCachePromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesDeletePromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Static_strong_basis_Ets_Promise_ApiTest_0600
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesDeletePromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.delete("");
        console.info("testPreferencesDeletePromiseErr0100");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("testPreferencesDeletePromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect(15500000).assertEqual(err.code);
        done();
      }
    });


    /**
     * @tc.name   testPreferencesHasPromiseErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_Static_strong_basis_Ets_Promise_ApiTest_0700
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPreferencesHasPromiseErr0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ret = await mPreferences!.has("");
        console.info("testPreferencesDeletePromiseErr0100");
        expect(ret).assertEqual(false);
        done();
      } catch (err) {
        console.info("testPreferencesDeletePromiseErr0100 fail: " + err.message + "code: " + err.code);
        expect().assertFail();
        done();
      }
    });

  })
}