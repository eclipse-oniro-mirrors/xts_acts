/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import dataPreferences from '@ohos.data.preferences';
import lang from '@arkts.lang';
import collections from '@arkts.collections';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const options:dataPreferences.Options= {name:'test_preferences'}
const KEY_STRING = 'key_test_string';

let mPreferences:dataPreferences.Preferences;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = ['testlog']

export default function preferencesErrcodeTest() {
  describe('preferencesErrcodeTest', () => {
    beforeAll(async () => {
      console.info('beforeAll');

    });
    afterAll(async () => {
      console.info('afterAll');
    });
    beforeEach(async () => {
      console.info('beforeEach');
      mPreferences = await dataPreferences.getPreferences(context, options);
      await mPreferences.clear();
    });
    afterEach(async () => {
      console.info('afterEach');
      await dataPreferences.removePreferencesFromCache(context, options)
      await dataPreferences.deletePreferences(context, options);
    });


    /**
     * @tc.name   testPreferenceClearErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsErrApiCallbackTest_0100
     * @tc.desc   mPreference.clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferenceClearErrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.log("testPreferenceClearErrTest0100 begin.");
      try {
        mPreferences.clear((err) => {
          if (err) {
            console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(401).assertEqual(err.code);
            expect(false).assertTrue();
            done();
          }
          done();
          console.log("testPreferenceClearErrTest0100 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });
    /**
     * @tc.name   testPreferenceOnErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsErrApiCallbackTest_0200
     * @tc.desc   mPreference.On() interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferenceOnErrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   testPreferenceOffErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceEtsErrApiCallbackTest_0300
     * @tc.desc   mPreference.Off() interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferenceOffErrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await mPreferences.clear();
      let observer = (key: lang.ISendable) => {
        console.info('testPreferenceOffErrTest0100 keyValue' +
        mPreferences.getSync(KEY_STRING, "aaa"));
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING, "aaa"));
        try {
          mPreferences.off('dataChange', null);
          expect().assertFail();
          done();
        } catch (err) {
          console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
          expect('401').assertEqual(err.code);
          done();
        }
      };
      try {
        await mPreferences.on('dataChange', null, observer);
        await mPreferences.put(KEY_STRING, "abcd");
        await mPreferences.flush();
        expect().assertFail();
        done();
      } catch (err) {
        console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect('401').assertEqual(err.code);
        done();
      }
    });
  })
}
