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

import testndk from 'librdbvalue.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

let TAG = '[testLog-ets]';
let re: number;
export default function rdbValueNdkTest() {
  describe('rdbValueNdkTest', async (done: Function) => {
    beforeAll(() => {})
    beforeEach(() => {
      try {
        console.info(TAG + 'testTag RdbstoreSetUpTestCase begin');
        re = testndk.RdbstoreSetUpTestCase();
        console.info(TAG + 'testTag RdbstoreSetUpTestCase success ' );
        expect(re == 0).assertTrue();
      }catch (err) {
        console.info(TAG + 'testTag RdbstoreSetUpTestCase fail. err: ' + err.code + err.message);
        expect().assertFail();
      }
    })
    afterEach(() => {
      try {
        console.info( TAG +'testTag RdbstoreTearDownTestCase begin');
        re = testndk.RdbstoreTearDownTestCase();
        console.info(TAG + 'testTag RdbstoreTearDownTestCase success ');
        expect(re == 0).assertTrue();
      }catch (err) {
        console.info(TAG + 'testTag RdbstoreTearDownTestCase fail. err: ' + err.code + err.message);
        expect().assertFail();
      }
    })
    afterAll(() => {})

    /**
     * @tc.name   OH_Rdb_BatchInsert_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_BatchInsert_0100
     * @tc.desc   OH_Rdb_BatchInsert_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_BatchInsert_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_BatchInsert_0100();
      console.info(TAG + "OH_Rdb_BatchInsert_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Value_PutNull_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ValuePut_0100
     * @tc.desc   OH_Value_PutNull_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Value_PutNull_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Value_PutNull_0100();
      console.info(TAG + "OH_Value_PutNull_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Value_Put_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ValuePut_0200
     * @tc.desc   OH_Value_Put_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Value_Put_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Value_Put_0100();
      console.info(TAG + "OH_Value_Put_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Values_Put_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ValuePut_0300
     * @tc.desc   OH_Values_Put_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Values_Put_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Values_Put_0100();
      console.info(TAG + "OH_Values_Put_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Value_PutFloatVector_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ValuePut_0400
     * @tc.desc   OH_Value_PutFloatVector_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Value_PutFloatVector_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Value_PutFloatVector_0100();
      console.info(TAG + "OH_Value_PutFloatVector_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Values_PutFloatVector_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ValuePut_0500
     * @tc.desc   OH_Values_PutFloatVector_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Values_PutFloatVector_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Values_PutFloatVector_0100();
      console.info(TAG + "OH_Values_PutFloatVector_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

  })
}