/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import data_rdb from '@ohos.data.rdb';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';
import { ValuesBucket } from '@ohos.data.ValuesBucket';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "NAME TEXT NOT NULL, " + "AGE INTEGER," + "SALARY  REAL" + ")";
const TAG = "[rdb_Ets_TEST >>>>>> ]"
let rdbStore:data_rdb.RdbStore;
let rdbName = "RdbTest.db";
let tableName = "employee";
let value1 = "Lisi";
let value2 = 18;
let value3 = 100.5;
let value4 = "Lisi1";
let value5 = 28;
let value6 = 200.5;

const valueBucket: ValuesBucket = {
  "NAME": value1,
  "AGE": value2,
  "SALARY": value3
};
const valueBucket1: ValuesBucket = {
  "NAME": value4,
  "AGE": value5,
  "SALARY": value6
};
let valueBuckets = new Array(valueBucket, valueBucket1);

export default function DataRdbStoreCoverageAdd(){
  describe('DataRdbStoreCoverageAdd', () => {

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_callback_0100
     * @tc.name getRdbStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('getRdbStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_callback_001 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(null, STORE_CONFIG, 1, (err: BusinessError, rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_callback_0200
     * @tc.name getRdbStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('getRdbStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_callback_002 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(undefined, STORE_CONFIG, 1, (err: BusinessError, rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_callback_0300
     * @tc.name getRdbStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('getRdbStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_callback_003 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, null, 1, (err: BusinessError, rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_callback_0400
     * @tc.name getRdbStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('getRdbStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_callback_004 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, undefined, 1, (err: BusinessError, rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_callback_0500
     * @tc.name getRdbStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is null
     */
    it('getRdbStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_callback_005 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, STORE_CONFIG, null, (err: BusinessError, rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_callback_0600
     * @tc.name getRdbStore_callback_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is undefined
     */
    it('getRdbStore_callback_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_callback_006 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, STORE_CONFIG, undefined, (err: BusinessError, rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_callback_0700
     * @tc.name getRdbStore_callback_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('getRdbStore_callback_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_callback_007 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, STORE_CONFIG, 1, (err: BusinessError, Store: data_rdb.RdbStore) => {
          if (err) {
            console.info(TAG +"Get RdbStore failed, err: " + err)
            expect(null).assertFail();
            done();
          }
          rdbStore = Store;
          console.log(TAG + "Get RdbStore successfully."+rdbStore)
          expect(rdbStore!==undefined).assertTrue();
          data_rdb.deleteRdbStore(context, rdbName, (err) => {
            console.log(TAG + "deleteRdbStore successfully.");
            done();
          })
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_promise_0100
     * @tc.name getRdbStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('getRdbStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_promise_001 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(null, STORE_CONFIG, 1).then(async (rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(TAG + "Get RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_promise_0200
     * @tc.name getRdbStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('getRdbStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_promise_002 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(undefined, STORE_CONFIG, 1).then(async (rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(TAG + "Get RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_promise_0300
     * @tc.name getRdbStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('getRdbStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_promise_003 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, null, 1).then(async (rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(TAG + "Get RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_promise_0400
     * @tc.name getRdbStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('getRdbStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_promise_004 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, undefined, 1).then(async (rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(TAG + "Get RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_promise_0500
     * @tc.name getRdbStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is null
     */
    it('getRdbStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_promise_005 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, STORE_CONFIG, null).then(async (rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(TAG + "Get RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_promise_0600
     * @tc.name getRdbStore_promise_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is undefined
     */
    it('getRdbStore_promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_promise_006 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, STORE_CONFIG, undefined).then(async (rdbStore: data_rdb.RdbStore) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(TAG + "Get RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_getRdbStore_promise_0700
     * @tc.name getRdbStore_promise_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('getRdbStore_promise_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- getRdbStore_promise_007 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        data_rdb.getRdbStore(context, STORE_CONFIG, 1).then(async (Store: data_rdb.RdbStore) => {
          rdbStore = Store;
          console.log(TAG + "Get RdbStore successfully."+rdbStore)
          expect(rdbStore!==undefined).assertTrue();
          await data_rdb.deleteRdbStore(context,rdbName);
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        }).catch((err: BusinessError) => {
          console.log(TAG + "Get RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_callback_0100
     * @tc.name deleteRdbStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('deleteRdbStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_callback_001 begin---------  ');
      try {
        data_rdb.deleteRdbStore(null, rdbName, (err) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_callback_0200
     * @tc.name deleteRdbStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('deleteRdbStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_callback_002 begin---------  ');
      try {
        data_rdb.deleteRdbStore(undefined, rdbName, (err) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_callback_0300
     * @tc.name deleteRdbStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('deleteRdbStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_callback_003 begin---------  ');
      try {
        data_rdb.deleteRdbStore(context, "", (err) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_callback_0400
     * @tc.name deleteRdbStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('deleteRdbStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_callback_004 begin---------  ');
      try {
        data_rdb.deleteRdbStore(context, null, (err) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_callback_0500
     * @tc.name deleteRdbStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('deleteRdbStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_callback_005 begin---------  ');
      try {
        data_rdb.deleteRdbStore(context, undefined, (err) => {
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_promise_0100
     * @tc.name deleteRdbStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('deleteRdbStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_promise_001 begin---------  ');
      try {
        data_rdb.deleteRdbStore(null, rdbName).then(()=>{
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG +"Delete RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_promise_0200
     * @tc.name deleteRdbStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('deleteRdbStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_promise_002 begin---------  ');
      try {
        data_rdb.deleteRdbStore(undefined, rdbName).then(()=>{
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG +"Delete RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_promise_0300
     * @tc.name deleteRdbStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('deleteRdbStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_promise_003 begin---------  ');
      try {
        data_rdb.deleteRdbStore(context, "").then(()=>{
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG +"Delete RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_promise_0400
     * @tc.name deleteRdbStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('deleteRdbStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_promise_004 begin---------  ');
      try {
        data_rdb.deleteRdbStore(context, null).then(()=>{
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG +"Delete RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_deleteRdbStore_promise_0500
     * @tc.name deleteRdbStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('deleteRdbStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- deleteRdbStore_promise_005 begin---------  ');
      try {
        data_rdb.deleteRdbStore(context, undefined).then(()=>{
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG +"Delete RdbStore failed, err: " + err)
          expect(null).assertFail();
          done();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_callback_0100
     * @tc.name RdbStore_insert_callback_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('RdbStore_insert_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_callback_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert("", valueBucket, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_callback_0200
     * @tc.name RdbStore_insert_callback_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_insert_callback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_callback_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(null, valueBucket, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_callback_0300
     * @tc.name RdbStore_insert_callback_0300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_insert_callback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_callback_0300 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(undefined, valueBucket, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_callback_0400
     * @tc.name RdbStore_insert_callback_0400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('RdbStore_insert_callback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_callback_0400 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(tableName, null, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_callback_0500
     * @tc.name RdbStore_insert_callback_0500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('RdbStore_insert_callback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_callback_0500 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(tableName, undefined, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_promise_0100
     * @tc.name RdbStore_insert_promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('RdbStore_insert_promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_promise_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert("", valueBucket).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_promise_0200
     * @tc.name RdbStore_insert_promise_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_insert_promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_promise_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(null, valueBucket).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_promise_0300
     * @tc.name RdbStore_insert_promise_0300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_insert_promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_promise_0300 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(undefined, valueBucket).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_promise_0400
     * @tc.name RdbStore_insert_promise_0400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('RdbStore_insert_promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_promise_0400 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(tableName, null).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_insert_promise_0500
     * @tc.name RdbStore_insert_promise_0500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('RdbStore_insert_promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_insert_promise_0500 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.insert(tableName, undefined).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_batchInsert_promise_0100
     * @tc.name RdbStore_batchInsert_promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('RdbStore_batchInsert_promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_batchInsert_promise_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.batchInsert("", valueBuckets).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_batchInsert_promise_0200
     * @tc.name RdbStore_batchInsert_promise_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_batchInsert_promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_batchInsert_promise_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.batchInsert(null, valueBuckets).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_batchInsert_promise_0300
     * @tc.name RdbStore_batchInsert_promise_0300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_batchInsert_promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_batchInsert_promise_0300 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.batchInsert(undefined, valueBuckets).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_batchInsert_promise_0400
     * @tc.name RdbStore_batchInsert_promise_0400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('RdbStore_batchInsert_promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_batchInsert_promise_0400 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.batchInsert(tableName, null).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_batchInsert_promise_0500
     * @tc.name RdbStore_batchInsert_promise_0500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('RdbStore_batchInsert_promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_batchInsert_promise_0500 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.batchInsert(tableName, undefined).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_batchInsert_promise_0600
     * @tc.name RdbStore_batchInsert_promise_0600
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is []
     */
    it('RdbStore_batchInsert_promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_batchInsert_promise_0600 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        rdbStore.batchInsert(tableName, []).then((rowId: number) => {
          console.log(TAG + "batchInsert is successful, number = " + rowId);
          expect(rowId!==-1).assertTrue();
        }).catch((err: BusinessError) => {
          console.log("batchInsert is failed, status = " + err);
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_callback_0100
     * @tc.name RdbStore_update_callback_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_update_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_callback_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(null, predicates, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_callback_0200
     * @tc.name RdbStore_update_callback_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_update_callback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_callback_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(undefined, predicates, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_callback_0300
     * @tc.name RdbStore_update_callback_0300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('RdbStore_update_callback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_callback_0300 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(valueBucket, null, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_callback_0400
     * @tc.name RdbStore_update_callback_0400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('RdbStore_update_callback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_callback_0400 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(valueBucket, undefined, (err: BusinessError, rowId: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_promise_0100
     * @tc.name RdbStore_update_promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_update_promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_promise_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(null, predicates).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_promise_0200
     * @tc.name RdbStore_update_promise_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_update_promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_promise_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(undefined, predicates).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_promise_0300
     * @tc.name RdbStore_update_promise_0300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('RdbStore_update_promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_promise_0300 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(valueBucket, null).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_promise_0400
     * @tc.name RdbStore_update_promise_0400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('RdbStore_update_promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_promise_0400 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.update(valueBucket, undefined).then((rowId: number) => {
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_update_promise_0500
     * @tc.name RdbStore_update_promise_0500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('RdbStore_update_promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_update_promise_0500 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let num = await rdbStore.insert(tableName, valueBucket);
        console.log(TAG + "insert successfully."+num);
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.update(valueBucket1, predicates).then((rowId: number) => {
          console.log(TAG +"Updated row count: " + rowId)
          expect(rowId).assertEqual(1);
        }).catch((err: BusinessError) => {
          console.info(TAG +"Updated failed, err: " + err)
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_delete_callback_0100
     * @tc.name RdbStore_delete_callback_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_delete_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_delete_callback_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.delete(null, (err: BusinessError, rows: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_delete_callback_0200
     * @tc.name RdbStore_delete_callback_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_delete_callback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_delete_callback_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.delete(undefined, (err: BusinessError, rows: number) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_delete_promise_0100
     * @tc.name RdbStore_delete_promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_delete_promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_delete_promise_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.delete(null).then((rows: number) => {
          console.log(TAG +"Delete rows: " + rows);
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.info(TAG +"Delete failed, err: " + err);
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_delete_promise_0200
     * @tc.name RdbStore_delete_promise_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_delete_promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_delete_promise_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisa");
        rdbStore.delete(undefined).then((rows: number) => {
          console.log(TAG +"Delete rows: " + rows);
          expect(null).assertFail();
        }).catch((err: BusinessError) => {
          console.info(TAG +"Delete failed, err: " + err);
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_query_callback_0100
     * @tc.name RdbStore_query_callback_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('RdbStore_query_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_query_callback_0100 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let num = await rdbStore.insert(tableName, valueBucket);
        console.log(TAG + "insert successfully."+num);
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.query(predicates, ["ID", "NAME", "AGE", "SALARY"], (err: BusinessError, resultSet: data_rdb.ResultSet) => {
          if (err) {
            console.info(TAG +"Query failed, err: " + err)
            expect(null).assertFail();
          }
          console.log(TAG +"ResultSet column names: " + resultSet.columnNames)
          console.log(TAG +"ResultSet column count: " + resultSet.columnCount)
          expect(resultSet.columnCount).assertEqual(4);
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_query_callback_0200
     * @tc.name RdbStore_query_callback_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('RdbStore_query_callback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_query_callback_0200 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let num = await rdbStore.insert(tableName, valueBucket);
        console.log(TAG + "insert successfully."+num);
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.query(null, ["ID", "NAME", "AGE", "SALARY"], (err: BusinessError, resultSet: data_rdb.ResultSet) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_query_callback_0300
     * @tc.name RdbStore_query_callback_0300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('RdbStore_query_callback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_query_callback_0300 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let num = await rdbStore.insert(tableName, valueBucket);
        console.log(TAG + "insert successfully."+num);
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.query(undefined, ["ID", "NAME", "AGE", "SALARY"], (err: BusinessError, resultSet: data_rdb.ResultSet) => {
          expect(null).assertFail();
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect("401").assertEqual(error.code);
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_query_callback_0400
     * @tc.name RdbStore_query_callback_0400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('RdbStore_query_callback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_query_callback_0400 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let num = await rdbStore.insert(tableName, valueBucket);
        console.log(TAG + "insert successfully."+num);
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.query(predicates, null, (err: BusinessError, resultSet: data_rdb.ResultSet) => {
          console.log(TAG + "ResultSet column names: " + resultSet.columnCount)
          expect(resultSet.columnCount).assertEqual(4);
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_query_callback_0500
     * @tc.name RdbStore_query_callback_0500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('RdbStore_query_callback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_query_callback_0500 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let num = await rdbStore.insert(tableName, valueBucket);
        console.log(TAG + "insert successfully."+num);
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.query(predicates, undefined, (err: BusinessError, resultSet: data_rdb.ResultSet) => {
          console.log(TAG + "ResultSet column names: " + resultSet.columnCount)
          expect(resultSet.columnCount).assertEqual(4);
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    /**
     * @tc.number SUB_DistributedData_RdbStore_SDK_CoverageAdd_RdbStore_query_callback_0600
     * @tc.name RdbStore_query_callback_0600
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is []
     */
    it('RdbStore_query_callback_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- RdbStore_query_callback_0600 begin---------  ');
      try {
        const STORE_CONFIG: data_rdb.StoreConfig = { name: rdbName};
        let rdbStore = await data_rdb.getRdbStore(context,STORE_CONFIG,1);
        console.log(TAG + "Get RdbStore successfully.")
        await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE);
        console.log(TAG + "CREATE_TABLE_EMPLOYEE successfully.");
        let num = await rdbStore.insert(tableName, valueBucket);
        console.log(TAG + "insert successfully."+num);
        let predicates = new data_rdb.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Lisi");
        rdbStore.query(predicates, [], (err: BusinessError, resultSet: data_rdb.ResultSet) => {
          console.log(TAG + "ResultSet column names: " + resultSet.columnCount)
          expect(resultSet.columnCount).assertEqual(4);
        })
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
      }finally {
        data_rdb.deleteRdbStore(context, rdbName, (err) => {
          console.log(TAG + "deleteRdbStore successfully.");
          done();
        })
      }
    })

    console.info(TAG + '-------------------describe DataRdbStoreCoverageAdd  end-------------------');
  })
}