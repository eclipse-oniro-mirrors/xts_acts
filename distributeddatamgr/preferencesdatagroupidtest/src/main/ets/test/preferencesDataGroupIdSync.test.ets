/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import data_preferences from '@ohos.data.preferences';
import common from "@ohos.app.ability.common"
import { BusinessError } from '@ohos.base';

let context: common.UIAbilityContext

const NAME = 'test_preferences_store';
const TAG = "[ttt]";
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
let mPreferences;

export default function preferencesDataGroupIdSync() {
  describe('preferencesDataGroupIdSync', () => {
    beforeAll(async () => {
      console.info('beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;

    })
    afterAll(async () => {
      console.info('afterAll');
      await data_preferences.deletePreferences(context, NAME);
      ;
      mPreferences = null;
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1500
     * @tc.name getPreferencesSync interface test
     * @tc.desc getPreferencesSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0100', 0, async (done: Function) => {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: null
      };
      try {
        mPreferences = data_preferences.getPreferencesSync(context, Options);
        expect(Options.dataGroupId).assertEqual(null);
        done();
      } catch (errInfo) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1600
     * @tc.name getPreferencesSync interface test
     * @tc.desc getPreferencesSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0200', 0, async (done: Function) => {
      const Options: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined
      };
      try {
        mPreferences = data_preferences.getPreferencesSync(context, Options);
        expect(Options.dataGroupId).assertEqual(undefined);
        done();
      } catch (errInfo) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1700
     * @tc.name getPreferencesSync interface test
     * @tc.desc getPreferencesSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0300', 0, async (done: Function) => {
      const Options: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };
      try {
        mPreferences = data_preferences.getPreferencesSync(context, Options);
        expect(Options.dataGroupId).assertEqual('123456');
        done();
      } catch (errInfo) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1800
     * @tc.name getPreferencesSync interface test
     * @tc.desc getPreferencesSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0400', 0, async (done: Function) => {
      const Options: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123123'
      };
      try {
        mPreferences = data_preferences.getPreferencesSync(context, Options);
        expect().assertFail();
        done();
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1900
     * @tc.name removePreferencesFromCacheSync interface test
     * @tc.desc removePreferencesFromCacheSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0100', 0, async (done: Function) => {
      const Options1: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };
      const Options2 = {
        name: "test_preferences_callback",
        dataGroupId: null
      };
      try {
        mPreferences = data_preferences.getPreferencesSync(context, Options1);
        expect(Options1.dataGroupId).assertEqual('123456');
        data_preferences.removePreferencesFromCacheSync(context, Options2);
        expect(Options2.dataGroupId).assertEqual(null);
        done();
      } catch (errInfo) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2000
     * @tc.name removePreferencesFromCacheSync interface test
     * @tc.desc removePreferencesFromCacheSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0200', 0, async (done: Function) => {
      const Options1: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };
      const Options2: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined
      };
      try {
        mPreferences = data_preferences.getPreferencesSync(context, Options1);
        expect(Options1.dataGroupId).assertEqual('123456');
        data_preferences.removePreferencesFromCacheSync(context, Options2);
        expect(Options2.dataGroupId).assertEqual(undefined);
        done();
      } catch (errInfo) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2100
     * @tc.name removePreferencesFromCacheSync interface test
     * @tc.desc removePreferencesFromCacheSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0300', 0, async (done: Function) => {
      const Options1: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };
      const Options2: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123123'
      };
      try {
        mPreferences = data_preferences.getPreferencesSync(context, Options1)
        data_preferences.removePreferencesFromCacheSync(context, Options2)
        expect().assertFail();
        done();
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2200
     * @tc.name removePreferencesFromCacheSync interface test
     * @tc.desc removePreferencesFromCacheSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0400', 0, async (done: Function) => {
      console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 begin.");
      const Options: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };

      mPreferences = data_preferences.getPreferencesSync(context, Options);
      await mPreferences.clearSync();
      await mPreferences.putSync(KEY_TEST_STRING_ELEMENT, 'test');
      await mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      mPreferences.flush(async (err: BusinessError) => {
        if (err) {
          console.log("flush err.");
          expect().assertFail();
          done();
        }
        console.log("flush done.");
        await data_preferences.removePreferencesFromCacheSync(context, Options);
        let value = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end." + value);
        expect('test').assertEqual(value);
        done();
        console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end.");
      });
    })
  })
}
