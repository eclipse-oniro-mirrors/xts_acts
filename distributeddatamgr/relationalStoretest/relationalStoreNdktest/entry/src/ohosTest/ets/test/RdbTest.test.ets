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
    it('testCreateValueObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.CreateValueObject();
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
    it('testCreateValuesBucket001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.CreateValuesBucket();
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
    it('testCreatePredicates001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.CreatePredicatesOne();
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
    it('testCreatePredicates002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.CreatePredicatesTwo();
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
    it('testCreatePredicates003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.CreatePredicatesThree();
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
    it('testGetOrOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.GetOrOpenOne();
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
    it('testGetOrOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.GetOrOpenTwo();
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
    it('testGetOrOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.GetOrOpenThree();
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
    it('testGetOrOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.GetOrOpenFour();
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
    it('testCloseStore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.CloseStoreOne();
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
    it('testCloseStore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.CloseStoreTwo();
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
    it('testCloseStore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.CloseStoreThree();
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
    it('testDeleteStore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.DeleteStoreOne();
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
    it('testDeleteStore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.DeleteStoreTwo();
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
    it('testDeleteStore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.DeleteStoreThree();
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
    it('testInsert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data = rdb.InsertOne();
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
    it('testInsert002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.InsertTwo();
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
    it('testInsert003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.InsertThree();
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
    it('testInsert004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.InsertFour();
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
    it('testInsert005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.InsertFive();
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
    it('testUpdate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data = rdb.UpdateOne();
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
    it('testUpdate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.UpdateTwo();
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
    it('testUpdate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.UpdateThree();
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
    it('testUpdate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.UpdateFour();
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
    it('testUpdate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.UpdateFive();
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
    it('testUpdate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.UpdateSix();
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
    it('testUpdate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.UpdateSeven();
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
    it('testDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data = rdb.DeleteOne();
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
    it('testDelete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.DeleteTwo();
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
    it('testDelete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.DeleteThree();
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
    it('testDelete004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.DeleteFour();
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
    it('testDelete005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = rdb.DeleteFive();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done();
    });

  })
}
