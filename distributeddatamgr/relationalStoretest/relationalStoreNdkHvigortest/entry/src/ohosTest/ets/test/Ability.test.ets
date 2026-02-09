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
export default function rdbConfigV2NdkTest() {
  describe('rdbConfigV2NdkTest', async (done: Function) => {

    /**
     * @tc.name   OH_Rdb_CreateConfig_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0100
     * @tc.desc   OH_Rdb_CreateConfig_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_Rdb_CreateConfig_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.OH_Rdb_CreateConfig_0100();
      console.info(TAG + "OH_Rdb_CreateConfig_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_CreateConfig_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0200
     * @tc.desc   OH_Rdb_CreateConfig_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_Rdb_CreateConfig_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.OH_Rdb_CreateConfig_0200();
      console.info(TAG + "OH_Rdb_CreateConfig_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0300
     * @tc.desc   OH_Rdb_SetDbType_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_Rdb_SetDbType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_0100();
      console.info(TAG + "OH_Rdb_SetDbType_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0400
     * @tc.desc   OH_Rdb_SetDbType_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_0300();
      console.info(TAG + "OH_Rdb_SetDbType_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_GetSupportedDbType_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0500
     * @tc.desc   OH_Rdb_GetSupportedDbType_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_Rdb_GetSupportedDbType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.OH_Rdb_GetSupportedDbType_0100();
      console.info(TAG + "OH_Rdb_GetSupportedDbType_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_SQLITE_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0600
     * @tc.desc   OH_Rdb_SetDbType_SQLITE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_SQLITE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_0100();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_SQLITE_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0700
     * @tc.desc   OH_Rdb_SetDbType_SQLITE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_SQLITE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_0200();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_SQLITE_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0800
     * @tc.desc   OH_Rdb_SetDbType_SQLITE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_SQLITE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_0300();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_SQLITE_Id_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_0900
     * @tc.desc   OH_Rdb_SetDbType_SQLITE_Id_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_SQLITE_Id_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_Id_0100();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_Id_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_SQLITE_Id_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1000
     * @tc.desc   OH_Rdb_SetDbType_SQLITE_Id_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_SQLITE_Id_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_SQLITE_Id_0200();
      console.info(TAG + "OH_Rdb_SetDbType_SQLITE_Id_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1100
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0100();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1200
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0200();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1300
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0300();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1400
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0400();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1500
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0500();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0600
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1600
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0600();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0700
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1700
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0700();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0800
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1800
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0800();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_0900
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_1900
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_0900();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDatabaseDir_Param_1000
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2000
     * @tc.desc   OH_Rdb_SetDatabaseDir_Param_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDatabaseDir_Param_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDatabaseDir_Param_1000();
      console.info(TAG + "OH_Rdb_SetDatabaseDir_Param_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2100
     * @tc.desc   OH_Rdb_SetStoreName_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0100();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2200
     * @tc.desc   OH_Rdb_SetStoreName_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0200();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2300
     * @tc.desc   OH_Rdb_SetStoreName_Param_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0300();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2400
     * @tc.desc   OH_Rdb_SetStoreName_Param_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0400();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2500
     * @tc.desc   OH_Rdb_SetStoreName_Param_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0500();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0600
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2600
     * @tc.desc   OH_Rdb_SetStoreName_Param_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0600();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0700
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2700
     * @tc.desc   OH_Rdb_SetStoreName_Param_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0700();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0800
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2800
     * @tc.desc   OH_Rdb_SetStoreName_Param_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0800();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_0900
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_2900
     * @tc.desc   OH_Rdb_SetStoreName_Param_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_0900();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetStoreName_Param_1000
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3000
     * @tc.desc   OH_Rdb_SetStoreName_Param_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetStoreName_Param_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetStoreName_Param_1000();
      console.info(TAG + "OH_Rdb_SetStoreName_Param_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3100
     * @tc.desc   OH_Rdb_SetBundleName_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0100();
      console.info(TAG + "OH_Rdb_SetBundleName_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3200
     * @tc.desc   OH_Rdb_SetBundleName_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0200();
      console.info(TAG + "OH_Rdb_SetBundleName_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3300
     * @tc.desc   OH_Rdb_SetBundleName_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0300();
      console.info(TAG + "OH_Rdb_SetBundleName_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3400
     * @tc.desc   OH_Rdb_SetBundleName_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0400();
      console.info(TAG + "OH_Rdb_SetBundleName_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3500
     * @tc.desc   OH_Rdb_SetBundleName_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0500();
      console.info(TAG + "OH_Rdb_SetBundleName_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0600
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3600
     * @tc.desc   OH_Rdb_SetBundleName_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0600();
      console.info(TAG + "OH_Rdb_SetBundleName_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0700
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3700
     * @tc.desc   OH_Rdb_SetBundleName_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0700();
      console.info(TAG + "OH_Rdb_SetBundleName_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0800
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3800
     * @tc.desc   OH_Rdb_SetBundleName_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0800();
      console.info(TAG + "OH_Rdb_SetBundleName_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_0900
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_3900
     * @tc.desc   OH_Rdb_SetBundleName_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_0900();
      console.info(TAG + "OH_Rdb_SetBundleName_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetBundleName_1000
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4000
     * @tc.desc   OH_Rdb_SetBundleName_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetBundleName_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetBundleName_1000();
      console.info(TAG + "OH_Rdb_SetBundleName_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_SetModuleName_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4100
     * @tc.desc   OH_Rdb_SetModuleName_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0100();
      console.info(TAG + "OH_Rdb_SetModuleName_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4200
     * @tc.desc   OH_Rdb_SetModuleName_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0200();
      console.info(TAG + "OH_Rdb_SetModuleName_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4300
     * @tc.desc   OH_Rdb_SetModuleName_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0300();
      console.info(TAG + "OH_Rdb_SetModuleName_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4400
     * @tc.desc   OH_Rdb_SetModuleName_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0400();
      console.info(TAG + "OH_Rdb_SetModuleName_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4500
     * @tc.desc   OH_Rdb_SetModuleName_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0500();
      console.info(TAG + "OH_Rdb_SetModuleName_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0600
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4600
     * @tc.desc   OH_Rdb_SetModuleName_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0600();
      console.info(TAG + "OH_Rdb_SetModuleName_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0700
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4700
     * @tc.desc   OH_Rdb_SetModuleName_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0700();
      console.info(TAG + "OH_Rdb_SetModuleName_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0800
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4800
     * @tc.desc   OH_Rdb_SetModuleName_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0800();
      console.info(TAG + "OH_Rdb_SetModuleName_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_0900
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_4900
     * @tc.desc   OH_Rdb_SetModuleName_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_0900();
      console.info(TAG + "OH_Rdb_SetModuleName_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetModuleName_1000
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5000
     * @tc.desc   OH_Rdb_SetModuleName_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetModuleName_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetModuleName_1000();
      console.info(TAG + "OH_Rdb_SetModuleName_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });



    /**
     * @tc.name   OH_Rdb_SetEncrypted_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5100
     * @tc.desc   OH_Rdb_SetEncrypted_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetEncrypted_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetEncrypted_0100();
      console.info(TAG + "OH_Rdb_SetEncrypted_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetEncrypted_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5200
     * @tc.desc   OH_Rdb_SetEncrypted_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetEncrypted_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetEncrypted_0200();
      console.info(TAG + "OH_Rdb_SetEncrypted_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetEncrypted_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5300
     * @tc.desc   OH_Rdb_SetEncrypted_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetEncrypted_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetEncrypted_0300();
      console.info(TAG + "OH_Rdb_SetEncrypted_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetSecurityLevel_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5400
     * @tc.desc   OH_Rdb_SetSecurityLevel_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetSecurityLevel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetSecurityLevel_0100();
      console.info(TAG + "OH_Rdb_SetSecurityLevel_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetSecurityLevel_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5500
     * @tc.desc   OH_Rdb_SetSecurityLevel_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetSecurityLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetSecurityLevel_0200();
      console.info(TAG + "OH_Rdb_SetSecurityLevel_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetSecurityLevel_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5600
     * @tc.desc   OH_Rdb_SetSecurityLevel_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetSecurityLevel_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetSecurityLevel_0300();
      console.info(TAG + "OH_Rdb_SetSecurityLevel_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5700
     * @tc.desc   OH_Rdb_SetArea_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_0100();
      console.info(TAG + "OH_Rdb_SetArea_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5800
     * @tc.desc   OH_Rdb_SetArea_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_0200();
      console.info(TAG + "OH_Rdb_SetArea_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_5900
     * @tc.desc   OH_Rdb_SetArea_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_0300();
      console.info(TAG + "OH_Rdb_SetArea_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6000
     * @tc.desc   OH_Rdb_SetArea_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_0400();
      console.info(TAG + "OH_Rdb_SetArea_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6100
     * @tc.desc   OH_Rdb_SetArea_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_0500();
      console.info(TAG + "OH_Rdb_SetArea_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6200
     * @tc.desc   OH_Rdb_SetArea_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_Param_0100();
      console.info(TAG + "OH_Rdb_SetArea_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6300
     * @tc.desc   OH_Rdb_SetArea_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_Param_0200();
      console.info(TAG + "OH_Rdb_SetArea_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetArea_Param_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6400
     * @tc.desc   OH_Rdb_SetArea_Param_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetArea_Param_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetArea_Param_0300();
      console.info(TAG + "OH_Rdb_SetArea_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6500
     * @tc.desc   OH_Rdb_SetDbType_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_Param_0100();
      console.info(TAG + "OH_Rdb_SetDbType_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6600
     * @tc.desc   OH_Rdb_SetDbType_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_Param_0200();
      console.info(TAG + "OH_Rdb_SetDbType_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_SetDbType_Param_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6700
     * @tc.desc   OH_Rdb_SetDbType_Param_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetDbType_Param_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetDbType_Param_0300();
      console.info(TAG + "OH_Rdb_SetDbType_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_GetSupportedDbType_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6800
     * @tc.desc   OH_Rdb_GetSupportedDbType_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_GetSupportedDbType_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_GetSupportedDbType_Param_0100();
      console.info(TAG + "OH_Rdb_GetSupportedDbType_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_DestroyConfig_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_6900
     * @tc.desc   OH_Rdb_DestroyConfig_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_DestroyConfig_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_DestroyConfig_Param_0100();
      console.info(TAG + "OH_Rdb_DestroyConfig_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_CreateOrOpen_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7000
     * @tc.desc   OH_Rdb_CreateOrOpen_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_CreateOrOpen_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_CreateOrOpen_Param_0100();
      console.info(TAG + "OH_Rdb_CreateOrOpen_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_DeleteStoreV2_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7100
     * @tc.desc   OH_Rdb_DeleteStoreV2_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_DeleteStoreV2_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_DeleteStoreV2_Param_0100();
      console.info(TAG + "OH_Rdb_DeleteStoreV2_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_ExecuteByTrxId_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7200
     * @tc.desc   OH_Rdb_ExecuteByTrxId_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_ExecuteByTrxId_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_ExecuteByTrxId_Param_0100();
      console.info(TAG + "OH_Rdb_ExecuteByTrxId_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_ExecuteByTrxId_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7300
     * @tc.desc   OH_Rdb_ExecuteByTrxId_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_ExecuteByTrxId_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_ExecuteByTrxId_Param_0200();
      console.info(TAG + "OH_Rdb_ExecuteByTrxId_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_ExecuteByTrxId_Param_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7400
     * @tc.desc   OH_Rdb_ExecuteByTrxId_Param_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_ExecuteByTrxId_Param_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_ExecuteByTrxId_Param_0300();
      console.info(TAG + "OH_Rdb_ExecuteByTrxId_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_BeginTransWithTrxId_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7500
     * @tc.desc   OH_Rdb_BeginTransWithTrxId_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_BeginTransWithTrxId_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_BeginTransWithTrxId_Param_0100();
      console.info(TAG + "OH_Rdb_BeginTransWithTrxId_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_BeginTransWithTrxId_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7600
     * @tc.desc   OH_Rdb_BeginTransWithTrxId_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_BeginTransWithTrxId_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_BeginTransWithTrxId_Param_0200();
      console.info(TAG + "OH_Rdb_BeginTransWithTrxId_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_CommitByTrxId_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7700
     * @tc.desc   OH_Rdb_CommitByTrxId_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_CommitByTrxId_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_CommitByTrxId_Param_0100();
      console.info(TAG + "OH_Rdb_CommitByTrxId_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_CommitByTrxId_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7800
     * @tc.desc   OH_Rdb_CommitByTrxId_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_CommitByTrxId_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_CommitByTrxId_Param_0200();
      console.info(TAG + "OH_Rdb_CommitByTrxId_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_RollBackByTrxId_Param_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_7900
     * @tc.desc   OH_Rdb_RollBackByTrxId_Param_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RollBackByTrxId_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RollBackByTrxId_Param_0100();
      console.info(TAG + "OH_Rdb_RollBackByTrxId_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_RollBackByTrxId_Param_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_8000
     * @tc.desc   OH_Rdb_RollBackByTrxId_Param_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_RollBackByTrxId_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_RollBackByTrxId_Param_0200();
      console.info(TAG + "OH_Rdb_RollBackByTrxId_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_DBType_Enum_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ConfigV2_8100
     * @tc.desc   OH_Rdb_DBType_Enum_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_DBType_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_DBType_Enum_0100();
      console.info(TAG + "OH_Rdb_DBType_Enum_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

  })
}