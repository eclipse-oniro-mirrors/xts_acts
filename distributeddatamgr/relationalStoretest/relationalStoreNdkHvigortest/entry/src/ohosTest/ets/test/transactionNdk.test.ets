
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import testrdb from 'libtransaction.so';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import deviceInfo from '@ohos.deviceInfo';

let TAG = '[transaction_test]';

let deviceList = [
  '2in1'
];

export default function transactionNdktest() {
  let isValidDeviceType = false;
  describe('transactionNdktest', () => {

    beforeAll(() => {
      console.info(TAG + "beforeAll");
      let res = testrdb.RdbstoreSetUpTestCase();
      let deviceTypeInfo = deviceInfo.deviceType;
      let result = deviceList.find((value, index, obj) => {
        return value === deviceTypeInfo;
      });
      isValidDeviceType = result !== undefined;
    })
    beforeEach(() => {
      console.info(TAG + "beforeEach");
    })
    afterEach(() => {
      console.info(TAG + "afterEach");
    })
    afterAll(() => {
      console.info(TAG + "afterAll");
      let res = testrdb.RdbstoreTearDownTestCase();
    })

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_Rdb_Transaction0100
     * @tc.name OH_Rdb_Transaction0100
     * @tc.desc OH_Rdb_Transaction0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_Transaction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Rdb_Transaction0100();
      console.info(TAG + "OH_Rdb_Transaction0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_Rdb_CreateTransaction0100
     * @tc.name OH_Rdb_CreateTransaction0100
     * @tc.desc OH_Rdb_CreateTransaction0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_CreateTransaction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Rdb_CreateTransaction0100();
      console.info(TAG + "OH_Rdb_CreateTransaction0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_RdbTrans_Rollback0100
     * @tc.name OH_RdbTrans_Rollback0100
     * @tc.desc OH_RdbTrans_Rollback0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_RdbTrans_Rollback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_RdbTrans_Rollback0100();
      console.info(TAG + "OH_RdbTrans_Rollback0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_RdbTrans_Query0100
     * @tc.name OH_RdbTrans_Query0100
     * @tc.desc OH_RdbTrans_Query0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_RdbTrans_Query0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_RdbTrans_Query0100();
      console.info(TAG + "OH_RdbTrans_Query0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_VBuckets_Create0100
     * @tc.name OH_VBuckets_Create0100
     * @tc.desc OH_VBuckets_Create0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_VBuckets_Create0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_VBuckets_Create0100();
      console.info(TAG + "OH_VBuckets_Create0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_VBuckets_Destroy0100
     * @tc.name OH_VBuckets_Destroy0100
     * @tc.desc OH_VBuckets_Destroy0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_VBuckets_Destroy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_VBuckets_Destroy0100();
      console.info(TAG + "OH_VBuckets_Destroy0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_RdbTrans_Update0100
     * @tc.name OH_RdbTrans_Update0100
     * @tc.desc OH_RdbTrans_Update0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_RdbTrans_Update0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_RdbTrans_Update0100();
      console.info(TAG + "OH_RdbTrans_Update0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_RdbTrans_Delete0100
     * @tc.name OH_RdbTrans_Delete0100
     * @tc.desc OH_RdbTrans_Delete0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_RdbTrans_Delete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_RdbTrans_Delete0100();
      console.info(TAG + "OH_RdbTrans_Delete0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_RdbTrans_QuerySql0100
     * @tc.name OH_RdbTrans_QuerySql0100
     * @tc.desc OH_RdbTrans_QuerySql0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_RdbTrans_QuerySql0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_RdbTrans_QuerySql0100();
      console.info(TAG + "OH_RdbTrans_QuerySql0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_VBucket_PutFloatVector0100
     * @tc.name OH_VBucket_PutFloatVector0100
     * @tc.desc OH_VBucket_PutFloatVector0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_VBucket_PutFloatVector0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_VBucket_PutFloatVector0100();
      console.info(TAG + "OH_VBucket_PutFloatVector0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_OH_VBucket_PutUnlimitedInt0100
     * @tc.name OH_VBucket_PutUnlimitedInt0100
     * @tc.desc OH_VBucket_PutUnlimitedInt0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_VBucket_PutUnlimitedInt0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_VBucket_PutUnlimitedInt0100();
      console.info(TAG + "OH_VBucket_PutUnlimitedInt0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_SetTokenizer_0100
     * @tc.name OH_Rdb_SetTokenizer0100
     * @tc.desc OH_Rdb_SetTokenizer0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetTokenizer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Rdb_SetTokenizer0100();
      console.info(TAG + "OH_Rdb_SetTokenizer0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_IsTokenizerSupported0100
     * @tc.name OH_Rdb_IsTokenizerSupported0100
     * @tc.desc OH_Rdb_IsTokenizerSupported0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_IsTokenizerSupported0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Rdb_IsTokenizerSupported0100();
      console.info(TAG + "OH_Rdb_IsTokenizerSupported0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_RdbTrans_Commit0100
     * @tc.name OH_RdbTrans_Commit0100
     * @tc.desc OH_RdbTrans_Commit0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_RdbTrans_Commit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_RdbTrans_Commit0100();
      console.info(TAG + "OH_RdbTrans_Commit0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    
    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_RdbTrans_InsertWithConflictResolution0100
     * @tc.name OH_RdbTrans_InsertWithConflictResolution0100
     * @tc.desc OH_RdbTrans_InsertWithConflictResolution0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_RdbTrans_InsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_RdbTrans_InsertWithConflictResolution0100();
      console.info(TAG + "OH_RdbTrans_InsertWithConflictResolution0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_SetCustomDir0100
     * @tc.name OH_Rdb_SetCustomDir0100
     * @tc.desc OH_Rdb_SetCustomDir0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetCustomDir0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Rdb_SetCustomDir0100();
      console.info(TAG + "OH_Rdb_SetCustomDir0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_SetReadOnly0100
     * @tc.name OH_Rdb_SetReadOnly0100
     * @tc.desc OH_Rdb_SetReadOnly0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetReadOnly0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Rdb_SetReadOnly0100();
      console.info(TAG + "OH_Rdb_SetReadOnly0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_SetPlugins0100
     * @tc.name OH_Rdb_SetPlugins0100
     * @tc.desc OH_Rdb_SetPlugins0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetPlugins0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testrdb.OH_Rdb_SetPlugins0100();
      console.info(TAG + "OH_Rdb_SetPlugins0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_SetSemanticIndex_Param_0100
     * @tc.name OH_Rdb_SetSemanticIndex_Param_0100
     * @tc.desc OH_Rdb_SetSemanticIndex_Param_0100
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetSemanticIndex_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (!isValidDeviceType) {
        done();
      }
      let res = testrdb.OH_Rdb_SetSemanticIndex_Param_0100();
      console.info(TAG + "OH_Rdb_SetSemanticIndex_Param_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_SetSemanticIndex_Param_0200
     * @tc.name OH_Rdb_SetSemanticIndex_Param_0200
     * @tc.desc OH_Rdb_SetSemanticIndex_Param_0200
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetSemanticIndex_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (!isValidDeviceType) {
        done();
      }
      let res = testrdb.OH_Rdb_SetSemanticIndex_Param_0200();
      console.info(TAG + "OH_Rdb_SetSemanticIndex_Param_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_OH_Rdb_SetSemanticIndex_Param_0300
     * @tc.name OH_Rdb_SetSemanticIndex_Param_0300
     * @tc.desc OH_Rdb_SetSemanticIndex_Param_0300
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Rdb_SetSemanticIndex_Param_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (!isValidDeviceType) {
        done();
      }
      let res = testrdb.OH_Rdb_SetSemanticIndex_Param_0300();
      console.info(TAG + "OH_Rdb_SetSemanticIndex_Param_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

  })
}