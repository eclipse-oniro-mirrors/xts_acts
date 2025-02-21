/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import dataPreferences from '@ohos.data.preferences';
import common from "@ohos.app.ability.common"

const TAG = "[ttt]"
let context: common.UIAbilityContext

export default function preferencesDataGroupIdPromise() {
  describe('preferencesDataGroupIdPromise', function () {
    beforeAll(async function () {
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext

    })
    console.log(TAG + "*************Unit Test Begin*************");


    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0300
     * @tc.name preferences dataGroupId null promise test
     * @tc.desc preferences getPreferences dataGroupId null promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0100', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      try{
        dataPreferences.getPreferences(context, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(JSON.stringify(data)).assertEqual('{}');
          done();
          dataPreferences.deletePreferences(context, Options).then(async (val) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect(val).assertEqual(undefined);
            done();
          }).catch((err) => {
            expect().assertFail();
            done();
          })
        }).catch((err) => {
          expect().assertFail();
          done();
        })
      }catch(errInfo){
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0600
     * @tc.name preferences dataGroupId undefined promise test
     * @tc.desc preferences getPreferences dataGroupId undefined promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0200', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined,
      };
      try{
        dataPreferences.getPreferences(context, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(JSON.stringify(data)).assertEqual('{}');
          done();
          dataPreferences.deletePreferences(context, Options).then(async (val) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect(val).assertEqual(undefined);
            done();
          }).catch((error) => {
            expect().assertFail();
            done();
          })
        }).catch((err) => {
          expect().assertFail();
          done();
        })
      }catch(errInfo){
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1000
     * @tc.name preferences dataGroupId promise test
     * @tc.desc preferences getPreferences dataGroupId promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0300', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: '112233',
      };
      try{
        dataPreferences.getPreferences(context, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.deletePreferences(context, Options).then(async (val) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `deletePreferences failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1400
     * @tc.name preferences dataGroupId null promise test
     * @tc.desc preferences getPreferences dataGroupId null promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0400', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      try{
        dataPreferences.getPreferences(context, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(JSON.stringify(data)).assertEqual('{}');
          done();
          dataPreferences.removePreferencesFromCache(context, Options).then(async (val) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect(val).assertEqual(undefined);
            done();
          }).catch((error) => {
            expect().assertFail();
            done();
          })
        }).catch((err) => {
          expect().assertFail();
          done();
        })
      }catch(errInfo){
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_0700
     * @tc.name preferences dataGroupId undefined promise test
     * @tc.desc preferences removePreferencesFromCache dataGroupId undefined promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0500', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined,
      };
      try{
        dataPreferences.getPreferences(context, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect(JSON.stringify(data)).assertEqual('{}');
          done();
          dataPreferences.removePreferencesFromCache(context, Options).then(async (val) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect(val).assertEqual(undefined);
            done();
          }).catch((error) => {
            expect().assertFail();
            done();
          })
        }).catch((err) => {
          expect().assertFail();
          done();
        })
      }catch(errInfo){
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_Preference_SDK_DataGroupIdTest_1100
     * @tc.name preferences dataGroupId promise test
     * @tc.desc preferences removePreferencesFromCache dataGroupId promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0600', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: '112233',
      };
      try{
        dataPreferences.getPreferences(context, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.removePreferencesFromCache(context, Options).then(async (val) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `removePreferencesFromCache failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    console.log(TAG + "*************Unit Test End*************");
  })
}