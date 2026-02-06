/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import rdb from 'libentry.so';

export default function relationalstoreTest() {
  describe('relationalstoreTest', () => {

    /**
     * @tc.name   testQuery001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0330
     * @tc.desc   OH_Rdb_Query Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.QueryOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testQuery002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0340
     * @tc.desc   OH_Rdb_Query Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.QueryTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testQuery003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0350
     * @tc.desc   OH_Rdb_Query Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.QueryThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testQuery004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0360
     * @tc.desc   OH_Rdb_Query Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.QueryFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecute001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0370
     * @tc.desc   OH_Rdb_Execute Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.ExecuteOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecute002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0380
     * @tc.desc   OH_Rdb_Execute Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.ExecuteTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecute003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0390
     * @tc.desc   OH_Rdb_Execute Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.ExecuteThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecute004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0400
     * @tc.desc   OH_Rdb_Execute Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.ExecuteFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecuteQuery001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0410
     * @tc.desc   OH_Rdb_ExecuteQuery Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.ExecuteQueryOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecuteQuery002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0420
     * @tc.desc   OH_Rdb_ExecuteQuery Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecuteQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.ExecuteQueryTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecuteQuery003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0430
     * @tc.desc   OH_Rdb_ExecuteQuery Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecuteQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.ExecuteQueryThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecuteQuery004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0440
     * @tc.desc   OH_Rdb_ExecuteQuery Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExecuteQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.ExecuteQueryFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testBeginTransaction001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0450
     * @tc.desc   OH_Rdb_BeginTransaction Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBeginTransaction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.BeginTransactionOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testBeginTransaction002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0460
     * @tc.desc   OH_Rdb_BeginTransaction Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeginTransaction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.BeginTransactionTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testRollBack001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0470
     * @tc.desc   OH_Rdb_RollBack Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRollBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.RollBackOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testRollBack002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0480
     * @tc.desc   OH_Rdb_RollBack Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRollBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.RollBackTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testCommit001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0490
     * @tc.desc   OH_Rdb_Commit Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.CommitOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testCommit002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0500
     * @tc.desc   OH_Rdb_Commit Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.CommitTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testBackup001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0510
     * @tc.desc   OH_Rdb_Backup Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBackup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.BackupOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testBackup002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0520
     * @tc.desc   OH_Rdb_Backup Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBackup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.BackupTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testBackup003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0530
     * @tc.desc   OH_Rdb_Backup Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBackup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.BackupThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testRestore001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0540
     * @tc.desc   OH_Rdb_Restore Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRestore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.RestoreOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testRestore002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0550
     * @tc.desc   OH_Rdb_Restore Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.RestoreTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testRestore003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0560
     * @tc.desc   OH_Rdb_Restore Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.RestoreThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testGetVersion001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0570
     * @tc.desc   OH_Rdb_GetVersion Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.GetVersionOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testGetVersion002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0580
     * @tc.desc   OH_Rdb_GetVersion Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.GetVersionTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testGetVersion003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0590
     * @tc.desc   OH_Rdb_GetVersion Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetVersion003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.GetVersionThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testSetVersion001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0600
     * @tc.desc   OH_Rdb_SetVersion Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.SetVersionOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testSetVersion002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0610
     * @tc.desc   OH_Rdb_SetVersion Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.SetVersionTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
 
     /**
      * @tc.name   testLockRow001
      * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0620
      * @tc.desc   OH_Rdb_LockRow Interface testing
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testLockRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.LockRowOne();
      console.info("testLockRow001 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(14800018);
      done();
    });

     /**
      * @tc.name   testUnLockRow001
      * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0630
      * @tc.desc   OH_Rdb_UnlockRow Interface testing
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testUnLockRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.UnLockRowOne();
      console.info("testUnLockRow001 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(14800018);
      done();
    });

     /**
      * @tc.name   testQueryLockRow001
      * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0630
      * @tc.desc   OH_Rdb_QueryLockedRow Interface testing
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testQueryLockRow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.QueryLockRowOne();
      console.info("testUnLockRow001 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

  })
}
