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

import testndk from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

let TAG = '[testLog-ets]';
export default function preferencesNdkTest() {
  describe('preferencesNdkTest', async (done: Function) => {

    /**
     * @tc.name   OH_PreferencesOption_Create_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0100
     * @tc.desc   OH_PreferencesOption_Create_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesOption_Create_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_Create_0100();
      console.info(TAG + "OH_PreferencesOption_Create_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesOption_SetFilePath_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0200
     * @tc.desc   OH_PreferencesOption_SetFilePath_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesOption_SetFilePath_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_SetFilePath_0100();
      console.info(TAG + "OH_PreferencesOption_SetFilePath_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesOption_SetFilePath_0200
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0300
     * @tc.desc   OH_PreferencesOption_SetFilePath_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesOption_SetFilePath_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_SetFilePath_0200();
      console.info(TAG + "OH_PreferencesOption_SetFilePath_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_PreferencesOption_SetBundleName_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0400
     * @tc.desc   OH_PreferencesOption_SetBundleName_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesOption_SetBundleName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_SetBundleName_0100();
      console.info(TAG + "OH_PreferencesOption_SetBundleName_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_PreferencesOption_SetBundleName_0200
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0500
     * @tc.desc   OH_PreferencesOption_SetBundleName_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesOption_SetBundleName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_SetBundleName_0200();
      console.info(TAG + "OH_PreferencesOption_SetBundleName_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_PreferencesOption_SetDataGroupId_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0600
     * @tc.desc   OH_PreferencesOption_SetDataGroupId_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesOption_SetDataGroupId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_SetDataGroupId_0100();
      console.info(TAG + "OH_PreferencesOption_SetDataGroupId_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_PreferencesOption_SetDataGroupId_0200
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0700
     * @tc.desc   OH_PreferencesOption_SetDataGroupId_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesOption_SetDataGroupId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_SetDataGroupId_0200();
      console.info(TAG + "OH_PreferencesOption_SetDataGroupId_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_PreferencesOption_Destroy_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0800
     * @tc.desc   OH_PreferencesOption_Destroy_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesOption_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_Destroy_0100();
      console.info(TAG + "OH_PreferencesOption_Destroy_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_PreferencesOption_Destroy_0200
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_0900
     * @tc.desc   OH_PreferencesOption_Destroy_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesOption_Destroy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesOption_Destroy_0200();
      console.info(TAG + "OH_PreferencesOption_Destroy_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_Open_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1000
     * @tc.desc   OH_Preferences_Open_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_Open_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_Open_0100();
      console.info(TAG + "OH_Preferences_Open_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_Open_0200
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1100
     * @tc.desc   OH_Preferences_Open_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_Open_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_Open_0200();
      console.info(TAG + "OH_Preferences_Open_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_Close_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1200
     * @tc.desc   OH_Preferences_Close_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_Close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_Close_0100();
      console.info(TAG + "OH_Preferences_Close_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_SetInt_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1300
     * @tc.desc   OH_Preferences_SetInt_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_SetInt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_SetInt_0100();
      console.info(TAG + "OH_Preferences_SetInt_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_SetGetInt_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1400
     * @tc.desc   OH_Preferences_SetGetInt_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_SetGetInt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_SetGetInt_0100();
      console.info(TAG + "OH_Preferences_SetGetInt_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_SetGetString_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1500
     * @tc.desc   OH_Preferences_SetGetString_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_SetGetString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_SetGetString_0100();
      console.info(TAG + "OH_Preferences_SetGetString_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_SetGetBool_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1600
     * @tc.desc   OH_Preferences_SetGetBool_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_SetGetBool_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_SetGetBool_0100();
      console.info(TAG + "OH_Preferences_SetGetBool_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_SetString_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1700
     * @tc.desc   OH_Preferences_SetString_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_SetString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_SetString_0100();
      console.info(TAG + "OH_Preferences_SetString_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_SetBool_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1800
     * @tc.desc   OH_Preferences_SetBool_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_SetBool_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_SetBool_0100();
      console.info(TAG + "OH_Preferences_SetBool_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_GetInt_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_1900
     * @tc.desc   OH_Preferences_GetInt_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_GetInt_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_GetInt_0100();
      console.info(TAG + "OH_Preferences_GetInt_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_GetString_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2000
     * @tc.desc   OH_Preferences_GetString_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_GetString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_GetString_0100();
      console.info(TAG + "OH_Preferences_GetString_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_GetBool_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2100
     * @tc.desc   OH_Preferences_GetBool_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_GetBool_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_GetBool_0100();
      console.info(TAG + "OH_Preferences_GetBool_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_FreeString
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2200
     * @tc.desc   OH_Preferences_FreeString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_FreeString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_FreeString();
      console.info(TAG + "OH_Preferences_FreeString res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Preferences_RegisterDataObserver_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2300
     * @tc.desc   OH_Preferences_RegisterDataObserver_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_RegisterDataObserver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_RegisterDataObserver_0100();
      console.info(TAG + "OH_Preferences_RegisterDataObserver_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_UnregisterDataObserver_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2400
     * @tc.desc   OH_Preferences_UnregisterDataObserver_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_UnregisterDataObserver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_UnregisterDataObserver_0100();
      console.info(TAG + "OH_Preferences_UnregisterDataObserver_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesPair_0200
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2500
     * @tc.desc   OH_PreferencesPair_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesPair_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesPair_0200();
      console.info(TAG + "OH_PreferencesPair_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Preferences_ErrCode_0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2600
     * @tc.desc   OH_Preferences_ErrCode_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_ErrCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_ErrCode_0100();
      console.info(TAG + "OH_Preferences_ErrCode_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Preferences_IsStorageTypeSupported0500
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2700
     * @tc.desc   OH_Preferences_IsStorageTypeSupported0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Preferences_IsStorageTypeSupported0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Preferences_IsStorageTypeSupported0500();
      console.info(TAG + "OH_Preferences_IsStorageTypeSupported0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_PreferencesValue_GetValueType0100
     * @tc.number SUB_DistributedData_Preferences_SDK_NdkAPITest_2800
     * @tc.desc   OH_PreferencesValue_GetValueType0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PreferencesValue_GetValueType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_PreferencesValue_GetValueType0100();
      console.info(TAG + "OH_PreferencesValue_GetValueType0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

  })
}