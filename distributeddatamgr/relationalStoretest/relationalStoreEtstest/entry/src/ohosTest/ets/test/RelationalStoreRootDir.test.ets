/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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
import data_relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "[RELATIONAL_STORE_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";


let context: common.UIAbilityContext;


const valueBucket1 : data_relationalStore.ValuesBucket =  {
  "name": "lisi",
  "age": 15,
  "salary": 153.3,
  "blobType": new Uint8Array([1, 2, 3])
}
const valueBucket2 : data_relationalStore.ValuesBucket =  {
  "name": "zhangsan",
  "age": 16,
  "salary": 153.3,
  "blobType": new Uint8Array([1, 2, 3])
}
const valueBucket3 : data_relationalStore.ValuesBucket =  {
  "name": "wangwu",
  "age": 17,
  "salary": 153.3,
  "blobType": new Uint8Array([1, 2, 3])
}
let valueBuckets = new Array(valueBucket1, valueBucket2, valueBucket3);

export default function rdbrootDirTest() {
  describe('rdbrootDirTest', () => {
    beforeAll(async () => {
      console.log(TAG + "*************Unit Test Start*************");
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    });

    beforeEach(async ()  => {
      console.info(TAG + 'beforeEach');
    });

    afterEach(async ()  => {
      console.info(TAG + 'afterEach');
    });

    afterAll(async () => {
      console.info(TAG + 'afterAll');
      console.log(TAG + "*************Unit Test End*************");
    });
    /**
     * @tc.name invalid rootDir path promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0100
     * @tc.desc invalid rootDir path promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest0100 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        customDir: "rdb",
        rootDir: "invalidPath"
      }
      try {
        await data_relationalStore.getRdbStore(context,STORE_CONFIG1);
        expect().assertFail();
        done()
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest0100 end *************");
    })

    /**
     * @tc.name invalid rootDir path callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0200
     * @tc.desc invalid rootDir path callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)  => {
      console.log(TAG + "************* rdbrootDirTest0200 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        customDir: "rdb",
        rootDir: "invalidPath"
      }
      try {
        data_relationalStore.getRdbStore(context,STORE_CONFIG1 , async(err, rdbStore) => {
          expect().assertFail();
          done()
        })
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        done();
      };
      console.log(TAG + "************* rdbrootDirTest0200 end *************");
    })

    /**
     * @tc.name db not exist promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0300
     * @tc.desc db not exist promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest0300 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest1.db",
        securityLevel: data_relationalStore.SecurityLevel.S3,
        rootDir: "/data/storage/el2/database",
        customDir: "relationalstore/rdb"
      }
      try {
        await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        expect().assertFail();
        done()
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest0300 end *************");
    })

    /**
     * @tc.name db not exist callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0400
     * @tc.desc db not exist callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest0400 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest1.db",
        securityLevel: data_relationalStore.SecurityLevel.S3,
        rootDir: "/data/storage/el2/database",
        customDir: "relationalstore/rdb"
      }
      try {
        data_relationalStore.getRdbStore(context,STORE_CONFIG1 , async(err, rdbStore) => {
          expect().assertFail();
          done();
        })
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest0400 end *************");
    })

    /**
     * @tc.name query promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0500
     * @tc.desc query promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest0500 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG)
        rdbStore.executeSync(CREATE_TABLE_TEST);
        rdbStore.batchInsertSync('test', valueBuckets);
        console.log(TAG+"context.databaseDir=" + context.databaseDir)
        rdbStore.close();
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          rootDir: "/data/storage/el2/database",
          customDir: "relationalstore/rdb"
        }
        let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        let predicates = new data_relationalStore.RdbPredicates('test');
        let resultSet = rdbStore1.querySync(predicates);
        expect(resultSet.rowCount).assertEqual(3);
        console.log(TAG+"resultSet.rowCount=" + resultSet.rowCount)
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* rdbrootDirTest0500 end *************");
    })

    /**
     * @tc.name query callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0600
     * @tc.desc query callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest0600 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG)
      rdbStore.executeSync(CREATE_TABLE_TEST);
      rdbStore.batchInsertSync('test', valueBuckets);
      rdbStore.close();

      const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        rootDir: "/data/storage/el2/database",
        customDir: "relationalstore/rdb"
      }
      data_relationalStore.getRdbStore(context, STORE_CONFIG1, async(err, rdbStore1) => {
        if (err) {
          console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
          expect().assertFail();
          done()
        } else {
          const predicates = new data_relationalStore.RdbPredicates('test');
          const resultSet = rdbStore1.querySync(predicates);
          expect(resultSet.rowCount).assertEqual(3);
          console.log(TAG + "resultSet.rowCount=" + resultSet.rowCount)
          await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
          console.log(TAG + "delete rdbstore success");
          done();
        }
      })
      console.log(TAG + "************* rdbrootDirTest0600 end *************");
    })

    /**
     * @tc.name not write promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0700
     * @tc.desc not write promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest0700 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      try {
        rdbStore = await data_relationalStore.getRdbStore(context,STORE_CONFIG)
        rdbStore.executeSync(CREATE_TABLE_TEST);
        rdbStore.close();
        let rdbStore1: data_relationalStore.RdbStore | undefined = undefined;
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S3,
          rootDir: "/data/storage/el2/database",
          customDir: "relationalstore/rdb"
        }
        rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        rdbStore1.insertSync('test', valueBucket1)
        expect().assertFail();
        done();
      }catch(err){
        console.log(TAG+"catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done();
      }
      console.log(TAG + "************* rdbrootDirTest0700 end *************");
    })

    /**
     * @tc.name not write callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0800
     * @tc.desc not write callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest0800 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG)
      rdbStore.executeSync(CREATE_TABLE_TEST);
      rdbStore.close();
      const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S3,
        rootDir: "/data/storage/el2/database",
        customDir: "relationalstore/rdb"
      }
      data_relationalStore.getRdbStore(context, STORE_CONFIG1, async (err, rdbStore1) => {
        try {
          rdbStore1.insertSync('test', valueBucket1);
          expect().assertFail();
          done()
        } catch (err) {
          console.log(TAG+"catch err: failed, err: code=" + err.code + " message=" + err.message)
          expect(err.code).assertEqual(801);
          await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
          console.log(TAG + "delete rdbstore success");
          done();
        }
        console.log(TAG + "************* rdbrootDirTest0800 end *************");
      })
    })

    /**
     * @tc.name deleteRdb success promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_0900
     * @tc.desc deleteRdb success promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG + "************* rdbrootDirTest0900 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      try {
        let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
        rdbStore = await data_relationalStore.getRdbStore(context,STORE_CONFIG)
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          rootDir: "/data/storage/el2/database",
          customDir: "relationalstore/rdb"
        }
        await data_relationalStore.deleteRdbStore(context,STORE_CONFIG1)
        rdbStore = undefined
        console.log(TAG + "delete rdbstore success"+rdbStore);
        expect(rdbStore).assertEqual(undefined)
        done();
      }catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* rdbrootDirTest0900 end *************");

    })

    /**
     * @tc.name deleteRdb success callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1000
     * @tc.desc deleteRdb success callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG + "************* rdbrootDirTest1000 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      rdbStore = await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S3,
        rootDir: "/data/storage/el2/database",
        customDir: "relationalstore/rdb"
      }
      data_relationalStore.deleteRdbStore(context, STORE_CONFIG1, async(err) => {
        if (err) {
          console.log(TAG+ "catch err: failed, err: code=" + err.code + " message=" + err.message)
          expect().assertFail();
          done()
        } else {
          rdbStore = undefined
          console.log(TAG + "delete rdbstore success"+rdbStore);
          expect(rdbStore).assertEqual(undefined)
          done()
        }
      })
      console.log(TAG + "************* rdbrootDirTest1000 end *************");
    })

    /**
     * @tc.name invalid rootDir deleteRdb promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1100
     * @tc.desc invalid rootDir deleteRdb promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)  => {
      console.log(TAG + "************* rdbrootDirTest1100 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        rootDir: "invalidPath",
        customDir: "rdb"
      }
      try {
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1)
        expect().assertFail();
        done()
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        done()
      }
      console.log(TAG + "************* rdbrootDirTest1100 end *************");
    })

    /**
     * @tc.name invalid rootDir deleteRdb callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1200
     * @tc.desc invalid rootDir deleteRdb callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>{
      console.log(TAG + "************* rdbrootDirTest1200 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        rootDir: "invalidPath",
        customDir: "rdb"
      }
      try {
        data_relationalStore.deleteRdbStore(context, STORE_CONFIG1, async(err) => {
          expect().assertFail();
          done();
        })
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1200 end *************");
    })

    /**
     * @tc.name db not exist deleteRdbStore promise test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1300
     * @tc.desc db not exist deleteRdbStore promise test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest1300 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
        name: "rootDirTest1.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        rootDir: "/data/storage/el2/database/rdb",
      }
      try {
        await data_relationalStore.deleteRdbStore(context,STORE_CONFIG1)
        expect().assertFail();
        done();
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1300 end *************");
    })

    /**
     * @tc.name db not exist deleteRdbStore callback test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1400
     * @tc.desc db not exist deleteRdbStore callback test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) =>  {
      console.log(TAG + "************* rdbrootDirTest1400 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
        name: "rootDirTest1.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        rootDir: "/data/storage/el2/database/rdb",
      }
      try {
        data_relationalStore.deleteRdbStore(context, STORE_CONFIG1, async(err) => {
          expect().assertFail();
          done()
        })
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1400 end *************");
    })
    /**
     * @tc.name encrpy database invalid rootDir path test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1500
     * @tc.desc encrpy database invalid rootDir path test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest1500 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        encrypt: true,
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        encrypt: true,
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        customDir: "rdb",
        rootDir: "invalidPath"
      }
      try {
        await data_relationalStore.getRdbStore(context,STORE_CONFIG1);
        expect().assertFail();
        done()
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1500 end *************");
    })


    /**
     * @tc.name encrpy database db not exist test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1600
     * @tc.desc encrpy database db not exist test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest1600 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        encrypt: true,
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        encrypt: true,
        name: "rootDirTest1.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        rootDir: "/data/storage/el2/database",
        customDir: "relationalstore/rdb"
      }
      try {
        await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        expect().assertFail();
        done()
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1600 end *************");
    })

    /**
     * @tc.name encrpy database rootDir query test success
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1700
     * @tc.desc encrpy database rootDir query test success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest1700 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        encrypt: true,
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG)
        rdbStore.executeSync(CREATE_TABLE_TEST);
        rdbStore.batchInsertSync('test', valueBuckets);
        console.log(TAG+"context.databaseDir=" + context.databaseDir)
        rdbStore.close();
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          encrypt: true,
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          rootDir: "/data/storage/el2/database",
          customDir: "relationalstore/rdb"
        }
        let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        let predicates = new data_relationalStore.RdbPredicates('test');
        let resultSet = rdbStore1.querySync(predicates);
        expect(resultSet.rowCount).assertEqual(3);
        console.log(TAG+"resultSet.rowCount=" + resultSet.rowCount)
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1700 end *************");
    })

    /**
     * @tc.name encrpy database rootDir not write test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1800
     * @tc.desc encrpy database rootDir not write test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest1800 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        encrypt: true,
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      try {
        rdbStore = await data_relationalStore.getRdbStore(context,STORE_CONFIG)
        rdbStore.executeSync(CREATE_TABLE_TEST);
        rdbStore.close();
        let rdbStore1: data_relationalStore.RdbStore | undefined = undefined;
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          encrypt: true,
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          rootDir: "/data/storage/el2/database",
          customDir: "relationalstore/rdb"
        }
        rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        rdbStore1.insertSync('test', valueBucket1)
        expect().assertFail();
        done();
      }catch(err){
        console.log(TAG+"catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1800 end *************");
    })

    /**
     * @tc.name rootDir is "/data/storage/el2/database/" customDir is "rdb/tester/test" query test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_1900
     * @tc.desc rootDir is "/data/storage/el2/database/" customDir is "rdb/tester/test" query test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest1900 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        customDir: "tester/test"
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG)
        rdbStore.executeSync(CREATE_TABLE_TEST);
        rdbStore.batchInsertSync('test', valueBuckets);
        console.log(TAG+"context.databaseDir=" + context.databaseDir)
        rdbStore.close();
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          rootDir: "/data/storage/el2/database/relationalstore/rdb/",
          customDir: "tester/test"
        }
        let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        let predicates = new data_relationalStore.RdbPredicates('test');
        let resultSet = rdbStore1.querySync(predicates);
        expect(resultSet.rowCount).assertEqual(3);
        console.log(TAG+"resultSet.rowCount=" + resultSet.rowCount)
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* rdbrootDirTest1900 end *************");
    })
    /**
     * @tc.name rootDir is "//data/storage/el2/database" query test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_2000
     * @tc.desc rootDir is "//data/storage/el2/database" query test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest2000 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG)
        rdbStore.executeSync(CREATE_TABLE_TEST);
        rdbStore.batchInsertSync('test', valueBuckets);
        console.log(TAG+"context.databaseDir=" + context.databaseDir)
        rdbStore.close();
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          rootDir: "//data/storage/el2/database",
          customDir: "relationalstore/rdb"
        }
        let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        let predicates = new data_relationalStore.RdbPredicates('test');
        let resultSet = rdbStore1.querySync(predicates);
        expect(resultSet.rowCount).assertEqual(3);
        console.log(TAG+"resultSet.rowCount=" + resultSet.rowCount)
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* rdbrootDirTest2000 end *************");
    })
    /**
     * @tc.name invalid rootDir path "data/storage/el2/database"
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_2100
     * @tc.desc invalid rootDir path "data/storage/el2/database"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbrootDirTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest2100 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context,STORE_CONFIG)
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        customDir: "relationalstore/rdb",
        rootDir: "data/storage/el2/database"
      }
      try {
        await data_relationalStore.getRdbStore(context,STORE_CONFIG1);
        expect().assertFail();
        done()
      } catch (err) {
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG +"delete rdbstore success");
        expect(err.code).assertEqual("14800010");
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        done();
      }
      console.log(TAG + "************* rdbrootDirTest2100 end *************");
    })

    /**
     * @tc.name rootDir is undefined query test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_2200
     * @tc.desc rootDir is undefined query test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* rdbrootDirTest2200 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG)
        rdbStore.executeSync(CREATE_TABLE_TEST);
        rdbStore.batchInsertSync('test', valueBuckets);
        console.log(TAG+"context.databaseDir=" + context.databaseDir)
        rdbStore.close();
        const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
          name: "rootDirTest.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          rootDir: undefined
        }
        let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        let predicates = new data_relationalStore.RdbPredicates('test');
        let resultSet = rdbStore1.querySync(predicates);
        expect(resultSet.rowCount).assertEqual(3);
        console.log(TAG+"resultSet.rowCount=" + resultSet.rowCount)
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done()
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* rdbrootDirTest2200 end *************");
    })
    /**
     * @tc.name rootDir is undefined customDir is "data/storage/el2/database/rdb/" test
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rootDirJsAPITest_2300
     * @tc.desc rootDir is undefined customDir is "data/storage/el2/database/rdb/" test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbrootDirTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      console.log(TAG + "************* rdbrootDirTest2300 start *************");
      const STORE_CONFIG  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      await data_relationalStore.getRdbStore(context, STORE_CONFIG)
      console.log(TAG + "get rdbstore success");
      const STORE_CONFIG1 : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        rootDir: undefined,
        customDir: "data/storage/el2/database/relationalstore/rdb/"
      }
      try{
        let rdbStore1:data_relationalStore.RdbStore | undefined = undefined;
        rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1)
        console.log(TAG + "rdbStore1=" + rdbStore1)
        expect(rdbStore1 != undefined).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "rootDirTest.db");
        console.log(TAG + "delete rdbstore success");
        done()
      }catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* rdbrootDirTest2300 end *************");
    })
  })
}