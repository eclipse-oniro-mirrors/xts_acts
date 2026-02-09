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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import contextConstant from '@ohos.app.ability.contextConstant';
import data_preferences from '@ohos.data.preferences';
import common from "@ohos.app.ability.common"
import { BusinessError } from '@ohos.base';

let context: common.UIAbilityContext

const NAME = 'test_preferences_store';
const TAG = "[ttt]";
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
let mPreferences: data_preferences.Preferences | null = null;
export default function preferencesDataGroupIdSync() {
  describe('preferencesDataGroupIdSync', () => {
    beforeAll(async () => {
      console.info('beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;

    })
    afterAll(async () => {
      console.info('afterAll');
      await data_preferences.deletePreferences(context, NAME);
      mPreferences = null;
    })

     class Option{
      name : string = '';
      dataGroupId: null | undefined
     }
    /**
     * @tc.name   SUB_DDM_Preferences_GetPreferencesSync_0100
     * @tc.number SUB_DDM_Preferences_GetPreferencesSync_0100
     * @tc.desc   SUB_DDM_Preferences_GetPreferencesSync_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options : Option= {
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
     * @tc.name   SUB_DDM_Preferences_GetPreferencesSync_0200
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1600
     * @tc.desc   getPreferencesSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_DDM_Preferences_GetPreferencesSync_0300
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1700
     * @tc.desc   getPreferencesSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_DDM_Preferences_GetPreferencesSync_0400
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1800
     * @tc.desc   getPreferencesSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_DDM_Preferences_removePreferencesFromCacheSync_0100
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1900
     * @tc.desc   removePreferencesFromCacheSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options1: data_preferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };
      const Options2 : Option = {
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
     * @tc.name   SUB_DDM_Preferences_removePreferencesFromCacheSync_0200
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2000
     * @tc.desc   removePreferencesFromCacheSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_DDM_Preferences_removePreferencesFromCacheSync_0300
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2100
     * @tc.desc   removePreferencesFromCacheSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   SUB_DDM_Preferences_removePreferencesFromCacheSync_0400
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2200
     * @tc.desc   removePreferencesFromCacheSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
        let value : data_preferences.ValueType = mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end." + value);
        expect('test').assertEqual(value);
        done();
        console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end.");
      });
    })

    /**
     * @tc.name   SUB_DDM_Preferences_PreferencesEl3_0100
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2300
     * @tc.desc   PreferencesSync interface PreferencesEl3 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_PreferencesEl3_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'SUB_DDM_Preferences_PreferencesEl3_0100 start.');
      const Options: data_preferences.Options = {
        name: "test_preferences_el3",
        dataGroupId: "123456",
      };
      try {
        let el3Ctx = context.createAreaModeContext(contextConstant.AreaMode.EL3);
        let pref = data_preferences.getPreferencesSync(el3Ctx, Options);
        pref.putSync("stringKey", "testValue");
        pref.putSync("intKey", 1);
        let stringVal = pref.getSync("stringKey", "defValue");
        expect("testValue").assertEqual(stringVal);
        pref.flushSync();
        data_preferences.removePreferencesFromCacheSync(el3Ctx, Options)
        pref = data_preferences.getPreferencesSync(el3Ctx, Options)
        let intVal = pref.getSync("intKey", 0);
        expect(1).assertEqual(intVal);
        pref.deleteSync("intKey");
        intVal = pref.getSync("intKey", 0);
        expect(0).assertEqual(intVal);
        pref.clearSync();
        expect(false).assertEqual(pref.hasSync("stringKey"));
        data_preferences.deletePreferences(el3Ctx, Options);
        done();
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code}, message is ${errInfo.message}`);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_DDM_Preferences_PreferencesEl4_0100
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_2400
     * @tc.desc   PreferencesSync interface PreferencesEl4 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_PreferencesEl4_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG, 'SUB_DDM_Preferences_PreferencesEl4_0100 start.');
      const Options: data_preferences.Options = {
        name: "test_preferences_el4",
        dataGroupId: "123456",
      };
      try {
        let el4Ctx = context.createAreaModeContext(contextConstant.AreaMode.EL4);
        let pref = data_preferences.getPreferencesSync(el4Ctx, Options);
        pref.putSync("stringKey", "testValue");
        pref.putSync("intKey", 1);
        let stringVal = pref.getSync("stringKey", "defValue");
        expect("testValue").assertEqual(stringVal);
        pref.flushSync();
        data_preferences.removePreferencesFromCacheSync(el4Ctx, Options)
        pref = data_preferences.getPreferencesSync(el4Ctx, Options)
        let intVal = pref.getSync("intKey", 0);
        expect(1).assertEqual(intVal);
        pref.deleteSync("intKey");
        intVal = pref.getSync("intKey", 0);
        expect(0).assertEqual(intVal);
        pref.clearSync();
        expect(false).assertEqual(pref.hasSync("stringKey"));
        data_preferences.deletePreferences(el4Ctx, Options);
        done();
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code}, message is ${errInfo.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}
