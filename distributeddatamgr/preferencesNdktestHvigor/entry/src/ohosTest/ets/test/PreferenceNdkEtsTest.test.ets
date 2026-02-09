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

import { hilog } from '@kit.PerformanceAnalysisKit';
import PreferenceNdk from 'libcapability.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

const TAG = ["PREFERENCE_TEST"]

export default function preferencesNdkEtsTest() {
  describe('preferencesNdkEtsTest', () => {
    beforeAll(async () => {
      console.info( TAG + 'beforeAll' );
      await PreferenceNdk.SetUp();
    })
    beforeEach(async () => {
      console.info( TAG + 'beforeEach' );
      await PreferenceNdk.SetUpTestCase();
    })
    afterEach(() => {
      console.info( TAG + 'afterEach' );
    })
    afterAll(() => {
      console.info( TAG + 'afterAll' );
    })

    /**
     * @tc.name     OH_Preferences_Delete_Value0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0100
     * @tc.desc     OH_Preferences_DeletePreferences with null and invalid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_Delete_Value0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_Delete_Value0100();
      console.info(TAG + "OH_Preferences_Delete_Value0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_Delete_Value0200
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0200
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_Delete_Value0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_Delete_Value0200();
      console.info(TAG + "OH_Preferences_Delete_Value0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_SetValue_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0300
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_SetValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_SetValue_0100();
      console.info(TAG + "OH_Preferences_SetValue_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_SetValue_Int_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0400
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_SetValue_Int_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_SetValue_Int_0100();
      console.info(TAG + "OH_Preferences_SetValue_Int_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_SetValue_String_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0500
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_SetValue_String_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_SetValue_String_0100();
      console.info(TAG + "OH_Preferences_SetValue_String_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_SetValue_Bool_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0600
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_SetValue_Bool_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_SetValue_Bool_0100();
      console.info(TAG + "OH_Preferences_SetValue_Bool_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_GetValue_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0700
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_GetValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_GetValue_0100();
      console.info(TAG + "OH_Preferences_GetValue_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_GetAllValue_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0800
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_GetAllValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_GetAllValue_0100();
      console.info(TAG + "OH_Preferences_GetAllValue_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_GetAllValue_0200
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_0900
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_GetAllValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_GetAllValue_0200();
      console.info(TAG + "OH_Preferences_GetAllValue_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_GetAllValue_0300
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1000
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_GetAllValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_GetAllValue_0300();
      console.info(TAG + "OH_Preferences_GetAllValue_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_HasKeyValue_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1100
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_HasKeyValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_HasKeyValue_0100();
      console.info(TAG + "OH_Preferences_HasKeyValue_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_HasKeyValue_0200
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1200
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_HasKeyValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_HasKeyValue_0200();
      console.info(TAG + "OH_Preferences_HasKeyValue_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_FlushValue_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1300
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_FlushValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_FlushValue_0100();
      console.info(TAG + "OH_Preferences_FlushValue_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_FlushValue_0200
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1400
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_FlushValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_FlushValue_0200();
      console.info(TAG + "OH_Preferences_FlushValue_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_ClearCache_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1500
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_ClearCache_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_ClearCache_0100();
      console.info(TAG + "OH_Preferences_ClearCache_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_ClearCache_0200
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1600
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_ClearCache_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_ClearCache_0200();
      console.info(TAG + "OH_Preferences_ClearCache_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_MultiProcessObserver_0100
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1700
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_MultiProcessObserver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_MultiProcessObserver_0100();
      console.info(TAG + "OH_Preferences_MultiProcessObserver_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_MultiProcessObserver_0200
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1800
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_MultiProcessObserver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_MultiProcessObserver_0200();
      console.info(TAG + "OH_Preferences_MultiProcessObserver_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name     OH_Preferences_MultiProcessObserver_0300
     * @tc.number   SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_1900
     * @tc.desc     OH_Preferences_DeletePreferences with valid parameters
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('OH_Preferences_MultiProcessObserver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_Preferences_MultiProcessObserver_0300();
      console.info(TAG + "OH_Preferences_MultiProcessObserver_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_PreferencesValue_Create_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2000
     * @tc.desc   OH_PreferencesValue_Create_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_Create_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_Create_Value_0100();
      console.info(TAG + "OH_PreferencesValue_Create_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetBasic_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2100
     * @tc.desc   OH_PreferencesValue_SetGetBasic_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetBasic_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetBasic_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetBasic_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetOperations_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2200
     * @tc.desc   OH_PreferencesValue_SetGetOperations_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetOperations_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetOperations_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetOperations_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetInt64_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2300
     * @tc.desc   OH_PreferencesValue_SetGetInt64_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetInt64_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetInt64_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetInt64_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetDouble_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2400
     * @tc.desc   OH_PreferencesValue_SetGetDouble_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetDouble_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetDouble_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetDouble_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetIntArray_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2500
     * @tc.desc   OH_PreferencesValue_SetGetIntArray_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetIntArray_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetIntArray_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetIntArray_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_PreferencesValue_SetGetBoolArray_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2600
     * @tc.desc   OH_PreferencesValue_SetGetBoolArray_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetBoolArray_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetBoolArray_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetBoolArray_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetStringArray_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2700
     * @tc.desc   OH_PreferencesValue_SetGetStringArray_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetStringArray_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetStringArray_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetStringArray_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetInt64Array_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2800
     * @tc.desc   OH_PreferencesValue_SetGetInt64Array_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetInt64Array_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetInt64Array_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetInt64Array_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetDoubleArray_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_2900
     * @tc.desc   OH_PreferencesValue_SetGetDoubleArray_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetDoubleArray_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetDoubleArray_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetDoubleArray_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_SetGetBlob_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3000
     * @tc.desc   OH_PreferencesValue_SetGetBlob_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_SetGetBlob_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_SetGetBlob_Value_0100();
      console.info(TAG + "OH_PreferencesValue_SetGetBlob_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_EdgeCases_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3100
     * @tc.desc   OH_PreferencesValue_EdgeCases_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_EdgeCases_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_EdgeCases_Value_0100();
      console.info(TAG + "OH_PreferencesValue_EdgeCases_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0100
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3200
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0100();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0200
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3300
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0200();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0300
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3400
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0300();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0400
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3500
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0400();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0500
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3600
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0500();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0600
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3700
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0600();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0700
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3800
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0700();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_PreferencesValue_GetValueType_Value_0800
     * @tc.number SUB_DistributedData_OH_Preferences_SDK_Ndk_APITest_3900
     * @tc.desc   OH_PreferencesValue_GetValueType_Value_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PreferencesValue_GetValueType_Value_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = PreferenceNdk.OH_PreferencesValue_GetValueType_Value_0800();
      console.info(TAG + "OH_PreferencesValue_GetValueType_Value_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    
  })
}