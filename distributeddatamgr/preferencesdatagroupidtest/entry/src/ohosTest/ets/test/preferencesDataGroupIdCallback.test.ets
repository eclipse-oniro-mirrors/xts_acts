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
import dataPreferences from '@ohos.data.preferences';
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';
const TAG = "[ttt]"
let context: common.UIAbilityContext


export default function preferencesDataGroupIdCallback() {
  describe('preferencesDataGroupIdCallback', () => {
    beforeAll(async () => {
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext

    })
    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0100
     * @tc.name preferencesgetPreferences dataGroupId null callback test
     * @tc.desc preferences getPreferences dataGroupId null callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
     class Option{
      name : string = '';
      dataGroupId: null | undefined
     }
    it('SUB_DDM_Preferences_DataGroupId_Callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const Options : Option= {
        name: "test_preferences_callback",
        dataGroupId: null
      };
      try {
        dataPreferences.getPreferences(context, Options, async (pre) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(pre).assertEqual(undefined);
          done();
          dataPreferences.deletePreferences(context, Options, (pre) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect(pre).assertEqual(undefined);
            done();
          })
        })
      } catch (err) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0400
     * @tc.name preferences dataGroupId undefined callback test
     * @tc.desc preferences getPreferences dataGroupId undefined callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Callback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined
      };
      try {
        dataPreferences.getPreferences(context, Options, async (pre) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(pre).assertEqual(undefined);
          done();
          dataPreferences.deletePreferences(context, Options, (pre) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect(pre).assertEqual(undefined);
            done();
          })
        })
      } catch (err) {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0800
     * @tc.name preferences dataGroupId callback test
     * @tc.desc preferences getPreferences dataGroupId callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Callback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '112233'
      };
      try {
        dataPreferences.getPreferences(context, Options, async (err) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.deletePreferences(context, Options, (error) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect().assertFail();
            done();
          })
        })
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1200
     * @tc.name preferences dataGroupId callback test
     * @tc.desc preferences deletePreferences dataGroupId callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Callback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done: Function) => {
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };
      try {
        dataPreferences.getPreferences(context, Options, async (err) => {
          if (err) {
            console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          }
          console.info(TAG, `getPreferences successfully.`);
          dataPreferences.deletePreferences(context, Options, (err:BusinessError) => {
            if (err) {
              console.error(TAG, `deletePreferences failed, code is ${err.code},message is ${err.message}`);
            }
            console.info(TAG, `deletePreferences successfully.`);
            expect(err === undefined).assertTrue();
            done();
          })
        })
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0200
     * @tc.name preferences dataGroupId null callback test
     * @tc.desc preferences getPreferences dataGroupId null callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Callback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options : Option= {
        name: "test_preferences_callback",
        dataGroupId: null
      };
      try {
        dataPreferences.getPreferences(context, Options, async (pre) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(pre).assertEqual(undefined);
          done();
          dataPreferences.removePreferencesFromCache(context, Options, (pre) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect(pre).assertEqual(undefined);
            done();
          })
        })
      } catch (err) {
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0500
     * @tc.name preferences dataGroupId undefined callback test
     * @tc.desc preferences removePreferencesFromCache dataGroupId undefined callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Callback_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined
      };
      try {
        dataPreferences.getPreferences(context, Options, async (pre) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(pre).assertEqual(undefined);
          done();
          dataPreferences.removePreferencesFromCache(context, Options, (pre) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect(pre).assertEqual(undefined);
            done();
          })
        })
      } catch (err) {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0900
     * @tc.name preferences dataGroupId callback test
     * @tc.desc preferences removePreferencesFromCache dataGroupId callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Callback_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '112233',
      };
      try {
        dataPreferences.getPreferences(context, Options, async (err) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.removePreferencesFromCache(context, Options, (error) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect().assertFail();
            done();
          })
        })
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1300
     * @tc.name preferences dataGroupId callback test
     * @tc.desc preferences removePreferencesFromCache dataGroupId callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Callback_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: '123456'
      };
      try {
        dataPreferences.getPreferences(context, Options, async(err) => {
          if (err) {
            console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          }
          console.info(TAG, `getPreferences successfully.`);
          dataPreferences.removePreferencesFromCache(context, Options, (error) => {
            if (error) {
              console.error(TAG, `removePreferencesFromCache failed, code is ${error.code},message is ${error.message}`);
            }
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect(error === undefined).assertTrue();
            done();
          })
        })
      } catch (errInfo) {
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo !== null).assertFail();
        done();
      }
    })

    console.log(TAG + "*************Unit Test End*************");
  })
}