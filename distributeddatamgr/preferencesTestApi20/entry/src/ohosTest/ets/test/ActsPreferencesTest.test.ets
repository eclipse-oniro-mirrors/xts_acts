/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import preferences from 'libpreferencestest.so'

export default function ActsPreferencesTest() {
  describe('ActsPreferencesTest', () => {
    /**
     * @tc.name   SUB_OH_Preferences_IsStorageTypeSupported_0100
     * @tc.number SUB_OH_Preferences_IsStorageTypeSupported_0100
     * @tc.desc   Test the scenario that the parameter of the OH_Preferences_IsStorageTypeSupported interface is illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_Preferences_IsStorageTypeSupported_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Preferences_IsStorageTypeSupported_0100 start====");
          let result: number = preferences.OHPreferencesIsStorageTypeSupportedError();
          console.info("====>SUB_OH_Preferences_IsStorageTypeSupported_0100 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Preferences_IsStorageTypeSupported_0100 catch err: " + err);
          expect(err).assertEqual(-1);
          done();
        }
      })

    /**
     * @tc.name   SUB_PREFERENCES_STORAGE_XML_0200
     * @tc.number SUB_PREFERENCES_STORAGE_XML_0200
     * @tc.desc   Scenario for testing enumeration value PREFERENCES_STORAGE_XML
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_PREFERENCES_STORAGE_XML_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_PREFERENCES_STORAGE_XML_0200 start====");
          let result: number = preferences.PreferencesStorageXml();
          expect(result).assertEqual(0);
          console.info("====>SUB_PREFERENCES_STORAGE_XML_0200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_PREFERENCES_STORAGE_XML_0200 catch err: " + err);
          expect(err).assertEqual(-1);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_PreferencesOption_SetStorageType_0300
     * @tc.number SUB_OH_PreferencesOption_SetStorageType_0300
     * @tc.desc   Test the scenario that the parameter of the OH_PreferencesOption_SetStorageType interface is illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_PreferencesOption_SetStorageType_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_PreferencesOption_SetStorageType_0300 start====");
          let result: number = preferences.PreferencesStorageError();
          console.info("====>SUB_OH_PreferencesOption_SetStorageType_0300 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_PreferencesOption_SetStorageType_0300 catch err: " + err);
          expect(err).assertEqual(-1);
          done();
        }
      })
  })
}
