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

import { describe, expect, it } from '@ohos/hypium';
import rdb from 'librdb.so';

export default function rdbTest() {
  describe('RdbTest', () => {

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0010
     * @tc.name       : testCreateValueObject001
     * @tc.desc       : OH_Rdb_CreateValueObject Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCreateValueObject001', 0, async (done: Function) => {
      let data = rdb.createValueObject();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0020
     * @tc.name       : testCreateValuesBucket001
     * @tc.desc       : OH_Rdb_CreateValuesBucket Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCreateValuesBucket001', 0, async (done: Function) => {
      let data = rdb.createValuesBucket();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0030
     * @tc.name       : testCreatePredicates001
     * @tc.desc       : OH_Rdb_CreatePredicates Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCreatePredicates001', 0, async (done: Function) => {
      let data = rdb.createPredicatesOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0040
     * @tc.name       : testCreatePredicates002
     * @tc.desc       : OH_Rdb_CreatePredicates Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCreatePredicates002', 0, async (done: Function) => {
      let data = rdb.createPredicatesTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0050
     * @tc.name       : testCreatePredicates003
     * @tc.desc       : OH_Rdb_CreatePredicates Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCreatePredicates003', 0, async (done: Function) => {
      let data = rdb.createPredicatesThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0060
     * @tc.name       : testGetOrOpen001
     * @tc.desc       : OH_Rdb_GetOrOpen Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetOrOpen001', 0, async (done: Function) => {
      let data = rdb.getOrOpenOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0070
     * @tc.name       : testGetOrOpen002
     * @tc.desc       : OH_Rdb_GetOrOpen Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetOrOpen002', 0, async (done: Function) => {
      let data = rdb.getOrOpenTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0080
     * @tc.name       : testGetOrOpen003
     * @tc.desc       : OH_Rdb_GetOrOpen Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetOrOpen003', 0, async (done: Function) => {
      let data = rdb.getOrOpenThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0090
     * @tc.name       : testGetOrOpen004
     * @tc.desc       : OH_Rdb_GetOrOpen Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetOrOpen004', 0, async (done: Function) => {
      let data = rdb.getOrOpenFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0100
     * @tc.name       : testCloseStore001
     * @tc.desc       : OH_Rdb_CloseStore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCloseStore001', 0, async (done: Function) => {
      let data = rdb.closeStoreOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0110
     * @tc.name       : testCloseStore002
     * @tc.desc       : OH_Rdb_CloseStore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCloseStore002', 0, async (done: Function) => {
      let data = rdb.closeStoreTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0120
     * @tc.name       : testCloseStore003
     * @tc.desc       : OH_Rdb_CloseStore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCloseStore003', 0, async (done: Function) => {
      let data = rdb.closeStoreThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0130
     * @tc.name       : testDeleteStore001
     * @tc.desc       : OH_Rdb_DeleteStore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDeleteStore001', 0, async (done: Function) => {
      let data = rdb.deleteStoreOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0140
     * @tc.name       : testDeleteStore002
     * @tc.desc       : OH_Rdb_DeleteStore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeleteStore002', 0, async (done: Function) => {
      let data = rdb.deleteStoreTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0150
     * @tc.name       : testDeleteStore003
     * @tc.desc       : OH_Rdb_DeleteStore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeleteStore003', 0, async (done: Function) => {
      let data = rdb.deleteStoreThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0160
     * @tc.name       : testInsert001
     * @tc.desc       : OH_Rdb_Insert Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testInsert001', 0, async (done: Function) => {
      let data = rdb.insertOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0170
     * @tc.name       : testInsert002
     * @tc.desc       : OH_Rdb_Insert Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testInsert002', 0, async (done: Function) => {
      let data = rdb.insertTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0180
     * @tc.name       : testInsert003
     * @tc.desc       : OH_Rdb_Insert Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testInsert003', 0, async (done: Function) => {
      let data = rdb.insertThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0190
     * @tc.name       : testInsert004
     * @tc.desc       : OH_Rdb_Insert Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testInsert004', 0, async (done: Function) => {
      let data = rdb.insertFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0200
     * @tc.name       : testInsert005
     * @tc.desc       : OH_Rdb_Insert Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testInsert005', 0, async (done: Function) => {
      let data = rdb.insertFive();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0210
     * @tc.name       : testUpdate001
     * @tc.desc       : OH_Rdb_Update Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUpdate001', 0, async (done: Function) => {
      let data = rdb.updateOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0220
     * @tc.name       : testUpdate002
     * @tc.desc       : OH_Rdb_Update Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUpdate002', 0, async (done: Function) => {
      let data = rdb.updateTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0230
     * @tc.name       : testUpdate003
     * @tc.desc       : OH_Rdb_Update Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUpdate003', 0, async (done: Function) => {
      let data = rdb.updateThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0240
     * @tc.name       : testUpdate004
     * @tc.desc       : OH_Rdb_Update Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUpdate004', 0, async (done: Function) => {
      let data = rdb.updateFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0250
     * @tc.name       : testUpdate005
     * @tc.desc       : OH_Rdb_Update Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUpdate005', 0, async (done: Function) => {
      let data = rdb.updateFive();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0260
     * @tc.name       : testUpdate006
     * @tc.desc       : OH_Rdb_Update Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUpdate006', 0, async (done: Function) => {
      let data = rdb.updateSix();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0270
     * @tc.name       : testUpdate007
     * @tc.desc       : OH_Rdb_Update Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUpdate007', 0, async (done: Function) => {
      let data = rdb.updateSeven();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0280
     * @tc.name       : testDelete001
     * @tc.desc       : OH_Rdb_Delete Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDelete001', 0, async (done: Function) => {
      let data = rdb.deleteOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0290
     * @tc.name       : testDelete002
     * @tc.desc       : OH_Rdb_Delete Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDelete002', 0, async (done: Function) => {
      let data = rdb.deleteTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0300
     * @tc.name       : testDelete003
     * @tc.desc       : OH_Rdb_Delete Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDelete003', 0, async (done: Function) => {
      let data = rdb.deleteThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0310
     * @tc.name       : testDelete004
     * @tc.desc       : OH_Rdb_Delete Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDelete004', 0, async (done: Function) => {
      let data = rdb.deleteFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0320
     * @tc.name       : testDelete005
     * @tc.desc       : OH_Rdb_Delete Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDelete005', 0, async (done: Function) => {
      let data = rdb.deleteFive();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0330
     * @tc.name       : testQuery001
     * @tc.desc       : OH_Rdb_Query Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testQuery001', 0, async (done: Function) => {
      let data = rdb.queryOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0340
     * @tc.name       : testQuery002
     * @tc.desc       : OH_Rdb_Query Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testQuery002', 0, async (done: Function) => {
      let data = rdb.queryTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0350
     * @tc.name       : testQuery003
     * @tc.desc       : OH_Rdb_Query Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testQuery003', 0, async (done: Function) => {
      let data = rdb.queryThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0360
     * @tc.name       : testQuery004
     * @tc.desc       : OH_Rdb_Query Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testQuery004', 0, async (done: Function) => {
      let data = rdb.queryFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0370
     * @tc.name       : testExecute001
     * @tc.desc       : OH_Rdb_Execute Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testExecute001', 0, async (done: Function) => {
      let data = rdb.executeOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0380
     * @tc.name       : testExecute002
     * @tc.desc       : OH_Rdb_Execute Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testExecute002', 0, async (done: Function) => {
      let data = rdb.executeTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0390
     * @tc.name       : testExecute003
     * @tc.desc       : OH_Rdb_Execute Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testExecute003', 0, async (done: Function) => {
      let data = rdb.executeThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0400
     * @tc.name       : testExecute004
     * @tc.desc       : OH_Rdb_Execute Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testExecute004', 0, async (done: Function) => {
      let data = rdb.executeFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0410
     * @tc.name       : testExecuteQuery001
     * @tc.desc       : OH_Rdb_ExecuteQuery Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testExecuteQuery001', 0, async (done: Function) => {
      let data = rdb.executeQueryOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0420
     * @tc.name       : testExecuteQuery002
     * @tc.desc       : OH_Rdb_ExecuteQuery Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testExecuteQuery002', 0, async (done: Function) => {
      let data = rdb.executeQueryTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0430
     * @tc.name       : testExecuteQuery003
     * @tc.desc       : OH_Rdb_ExecuteQuery Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testExecuteQuery003', 0, async (done: Function) => {
      let data = rdb.executeQueryThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0440
     * @tc.name       : testExecuteQuery004
     * @tc.desc       : OH_Rdb_ExecuteQuery Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testExecuteQuery004', 0, async (done: Function) => {
      let data = rdb.executeQueryFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0450
     * @tc.name       : testBeginTransaction001
     * @tc.desc       : OH_Rdb_BeginTransaction Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBeginTransaction001', 0, async (done: Function) => {
      let data = rdb.beginTransactionOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0460
     * @tc.name       : testBeginTransaction002
     * @tc.desc       : OH_Rdb_BeginTransaction Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBeginTransaction002', 0, async (done: Function) => {
      let data = rdb.beginTransactionTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0470
     * @tc.name       : testRollBack001
     * @tc.desc       : OH_Rdb_RollBack Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRollBack001', 0, async (done: Function) => {
      let data = rdb.rollBackOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0480
     * @tc.name       : testRollBack002
     * @tc.desc       : OH_Rdb_RollBack Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testRollBack002', 0, async (done: Function) => {
      let data = rdb.rollBackTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0490
     * @tc.name       : testCommit001
     * @tc.desc       : OH_Rdb_Commit Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommit001', 0, async (done: Function) => {
      let data = rdb.commitOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0500
     * @tc.name       : testCommit002
     * @tc.desc       : OH_Rdb_Commit Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommit002', 0, async (done: Function) => {
      let data = rdb.commitTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0510
     * @tc.name       : testBackup001
     * @tc.desc       : OH_Rdb_Backup Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBackup001', 0, async (done: Function) => {
      let data = rdb.backupOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0520
     * @tc.name       : testBackup002
     * @tc.desc       : OH_Rdb_Backup Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBackup002', 0, async (done: Function) => {
      let data = rdb.backupTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0530
     * @tc.name       : testBackup003
     * @tc.desc       : OH_Rdb_Backup Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testBackup003', 0, async (done: Function) => {
      let data = rdb.backupThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0540
     * @tc.name       : testRestore001
     * @tc.desc       : OH_Rdb_Restore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRestore001', 0, async (done: Function) => {
      let data = rdb.restoreOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0550
     * @tc.name       : testRestore002
     * @tc.desc       : OH_Rdb_Restore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testRestore002', 0, async (done: Function) => {
      let data = rdb.restoreTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0560
     * @tc.name       : testRestore003
     * @tc.desc       : OH_Rdb_Restore Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testRestore003', 0, async (done: Function) => {
      let data = rdb.restoreThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0570
     * @tc.name       : testGetVersion001
     * @tc.desc       : OH_Rdb_GetVersion Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetVersion001', 0, async (done: Function) => {
      let data = rdb.getVersionOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0580
     * @tc.name       : testGetVersion002
     * @tc.desc       : OH_Rdb_GetVersion Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetVersion002', 0, async (done: Function) => {
      let data = rdb.getVersionTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0590
     * @tc.name       : testGetVersion003
     * @tc.desc       : OH_Rdb_GetVersion Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetVersion003', 0, async (done: Function) => {
      let data = rdb.getVersionThree();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0600
     * @tc.name       : testSetVersion001
     * @tc.desc       : OH_Rdb_SetVersion Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetVersion001', 0, async (done: Function) => {
      let data = rdb.setVersionOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0610
     * @tc.name       : testSetVersion002
     * @tc.desc       : OH_Rdb_SetVersion Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSetVersion002', 0, async (done: Function) => {
      let data = rdb.setVersionTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });
 
    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0620
     * @tc.name       : testLockRow001
     * @tc.desc       : OH_Rdb_LockRow Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testLockRow001', 0, async (done: Function) => {
      let data = rdb.lockRowOne();
      console.info("testLockRow001 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(14800018);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0630
     * @tc.name       : testUnLockRow001
     * @tc.desc       : OH_Rdb_UnlockRow Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testUnLockRow001', 0, async (done: Function) => {
      let data = rdb.unLockRowOne();
      console.info("testUnLockRow001 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(14800018);
      done();
    });

    /**
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_NdkApiTest_0630
     * @tc.name       : testQueryLockRow001
     * @tc.desc       : OH_Rdb_QueryLockedRow Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testQueryLockRow001', 0, async (done: Function) => {
      let data = rdb.queryLockRowOne();
      console.info("testUnLockRow001 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

  })
}
