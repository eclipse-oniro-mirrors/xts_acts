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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let context:common.UIAbilityContext | undefined;
let domain: int = 0x0000;
let tag: string = 'testTag';
let store: data_relationalStore.RdbStore | undefined = undefined;

let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(3);
const valueBucket0 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :data_relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2 :data_relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}

const valueBucket4 :data_relationalStore.ValuesBucket = {
  "data1": "333",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

const valueBucket3 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 100 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
let dbPath ="";
let dbPathWal ="";
let dbPathShm ="";
let dbName = "MyStore.db";


const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 text, " + "data3 text," + "data4 blob)";

export default function RelationalStoreEnumTest(){
  describe('RelationalStoreEnumTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
    });
    /**
     * @tc.name       RelationalStoreEnumerateTest001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest001, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest002 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest002 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest003 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: false,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest003 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest004 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: false,
        dataGroupId: "",
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest004, code is ${err.code},message is ${err.message}`);
        expect(err != null ).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest004 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest005 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        customDir: "relationalstore/rdb",
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest005, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest005 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest006
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest006 start *************');

      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: false,
        allowRebuild: false,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest006, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest006 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest007
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest007 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        autoCleanDirtyData: false,
        allowRebuild: false,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest007, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest007 end *************');
    })
    /**
     * @tc.name       RelationalStoreEnumerateTest008
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest008 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        isReadOnly: false,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest008, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest008 end *************');
    })
    /**
     * @tc.name       RelationalStoreEnumerateTest009
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest009 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 asset, "  + "data2 assets )";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        const asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status: data_relationalStore.AssetStatus.ASSET_NORMAL,
        }
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": asset,
          "data2": assets
        };
        let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
        console.error(`Get RdbStore failed, num` + num);
        expect(num == 1).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        hilog.error(domain, tag, 'getrdb llll error' + err.stack);
        console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest009 end *************');
    })
    /**
     * @tc.name       RelationalStoreEnumerateTest010
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest010 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_NORMAL
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        await (store as data_relationalStore.RdbStore).close();
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest010, num` + num);
          expect(num == 1).assertFail();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest010, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800014);
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest010 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0011
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0011 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S3,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0011 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0012
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0012 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0012 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0013
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0013 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        pluginLibs: []
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0013 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0014
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0014 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        vector: false
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0014 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0015
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0015 start *************');
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey:  new Uint8Array([1, 2, 3]),
        iterationCount: 10000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
        cryptoPageSize: 1024
      }
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        encrypt: true,
        cryptoParam: cryptoParam
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0015 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0016
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0016 start *************');
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey:  new Uint8Array([1, 2, 3]),
        iterationCount: 20000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
        cryptoPageSize: 1024
      }
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        encrypt: true,
        cryptoParam: cryptoParam
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0016 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0017
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0017 start *************');
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey:  new Uint8Array([1, 2, 3]),
        iterationCount: 20000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 1024
      }
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        encrypt: true,
        cryptoParam: cryptoParam
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0017 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0018
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0018 start *************');
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey:  new Uint8Array([1, 2, 3]),
        iterationCount: 20000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 1024
      }
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        encrypt: true,
        cryptoParam: cryptoParam
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0018 end *************');
    })
    /**
     * @tc.name       RelationalStoreEnumerateTest0019
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_1900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0019 start *************');
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey:  new Uint8Array([1, 2, 3]),
        iterationCount: 20000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 1024
      }
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        encrypt: true,
        cryptoParam: cryptoParam
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0019 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0020
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0020 start *************');
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey:  new Uint8Array([1, 2, 3]),
        iterationCount: 20000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 1024
      }
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S4,
        encrypt: true,
        cryptoParam: cryptoParam
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest002, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0015 end *************');
    })


    /**
     * @tc.name       RelationalStoreEnumerateTest0021
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0021 start *************');
      let STORE_CONFIG1: data_relationalStore.StoreConfig = {
        name: "MyStore3.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        allowRebuild: false,
      };
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore1.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        allowRebuild: true,

      };
      let dbName = "MyStore3.db";
      dbPath = context!.databaseDir + "/rdb/" + dbName;
      dbPathWal = context!.databaseDir + "/rdb/" + dbName + "-wal";
      dbPathShm = context!.databaseDir + "/rdb/" + dbName + "-shm";
      store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
      try {
        let fileExist = fs.accessSync(dbPath);
        console.info(tag + "fileExist:"+fileExist)
        expect(fileExist).assertTrue();
        fs.truncateSync(dbPathWal, 4)
        fs.truncateSync(dbPathShm, 4)
        let file = fs.openSync(dbPath, fs.OpenMode.READ_ONLY | fs.OpenMode.SYNC | fs.OpenMode.TRUNC );
        fs.truncateSync(file.fd, 4);
        fs.fsyncSync(file.fd)
        fs.closeSync(file)
      } catch (err) {
        err = err as BusinessError;
        console.info(tag, `RelationalStoreEnumerateTest0021 err.code ${err.code}, err.message ${err.message}`)
      }
      await (store as data_relationalStore.RdbStore).close();
      store = undefined;
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        console.log(`RelationalStoreEnumerateTest0021, (store as data_relationalStore.RdbStore).rebuilt` + (store as data_relationalStore.RdbStore).rebuilt);
        expect((store as data_relationalStore.RdbStore).rebuilt == data_relationalStore.RebuildType.NONE).assertEqual(true);
        expect( data_relationalStore.RebuildType.REPAIRED == 2).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest0021, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG1);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0021 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0022
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0022 start *************');
      let STORE_CONFIG1: data_relationalStore.StoreConfig = {
        name: "MyStore2.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        allowRebuild: false,
      };
      let dbName = "MyStore2.db";
      dbPath = context!.databaseDir + "/rdb/" + dbName;
      dbPathWal = context!.databaseDir + "/rdb/" + dbName + "-wal";
      dbPathShm = context!.databaseDir + "/rdb/" + dbName + "-shm";
      store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
      try {
        let fileExist = fs.accessSync(dbPath);
        console.info(tag + "fileExist:"+fileExist)
        expect(fileExist).assertTrue();
        fs.truncateSync(dbPathWal, 4)
        fs.truncateSync(dbPathShm, 4)
        let file = fs.openSync(dbPath, fs.OpenMode.READ_WRITE);
        fs.truncateSync(file.fd, 4);
        fs.fsyncSync(file.fd)
        fs.closeSync(file)
      } catch (err) {
        err = err as BusinessError;
        console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
      }
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        console.log(`RelationalStoreEnumerateTest0022, (store as data_relationalStore.RdbStore).rebuilt` + (store as data_relationalStore.RdbStore).rebuilt);
        console.log(`RelationalStoreEnumerateTest0022, data_relationalStore.RebuildType.NONE` + data_relationalStore.RebuildType.NONE);
        console.log(`RelationalStoreEnumerateTest0022, data_relationalStore.RebuildType.REBUILT` + data_relationalStore.RebuildType.REBUILT);
        console.log(`RelationalStoreEnumerateTest0022, data_relationalStore.RebuildType.REPAIRED` + data_relationalStore.RebuildType.REPAIRED);
        expect((store as data_relationalStore.RdbStore).rebuilt == data_relationalStore.RebuildType.NONE).assertEqual(true);
        expect(data_relationalStore.RebuildType.REBUILT == 1).assertEqual(true);
        expect(data_relationalStore.RebuildType.REPAIRED == 2).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest0022, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG1);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0022 end *************');
    })
    /**
     * @tc.name       RelationalStoreEnumerateTest0023
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0023 start *************');
      let STORE_CONFIG1: data_relationalStore.StoreConfig = {
        name: "MyStore1.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        allowRebuild: false,
      };
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore1.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        allowRebuild: true,
      };
      let dbName = "MyStore1.db";
      dbPath = context!.databaseDir + "/rdb/" + dbName;
      dbPathWal = context!.databaseDir + "/rdb/" + dbName + "-wal";
      dbPathShm = context!.databaseDir + "/rdb/" + dbName + "-shm";
      store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
      try {
        let fileExist = fs.accessSync(dbPath);
        console.info(tag + "fileExist:"+fileExist)
        expect(fileExist).assertTrue();
        fs.truncateSync(dbPathWal, 4)
        fs.truncateSync(dbPathShm, 4)
        let file = fs.openSync(dbPath, fs.OpenMode.READ_WRITE);
        fs.truncateSync(file.fd, 4);
        fs.fsyncSync(file.fd)
        fs.closeSync(file)
      } catch (err) {
        err = err as BusinessError;
        console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
      }
      await (store as data_relationalStore.RdbStore).close();
      store = undefined;
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        console.error(`RelationalStoreEnumerateTest0023, (store as data_relationalStore.RdbStore).rebuilt` + (store as data_relationalStore.RdbStore).rebuilt);
        expect((store as data_relationalStore.RdbStore).rebuilt == data_relationalStore.RebuildType.NONE).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest0023, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context!,STORE_CONFIG1);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0023 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0024
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2400
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0024 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      let options:data_relationalStore.TransactionOptions = {
        transactionType:data_relationalStore.TransactionType.IMMEDIATE
      }
      let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
        "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

      let DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
      let rdbStore: data_relationalStore.RdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt 111111111111111111`);
      let rdbTrans = await rdbStore.createTransaction(options);
      console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt 2222222222222`);
      try{
        let resultSet: data_relationalStore.ResultSet = await rdbTrans.querySql("select * from test");
        console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt 333333333333333333333`);
        console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt resultSet.rowCount` + resultSet.rowCount);
        expect(resultSet.rowCount == 1 ).assertTrue();
        console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt 444444444444444444444`);
        rdbTrans.commit();
        console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt 5555555555555555555555`);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0024 err *************' + err.code+err.message);
        expect(err != null ).assertFail();
        console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt 77777777777777777`);
        done();
      }
      console.error(`RelationalStoreEnumerateTest0024, (store as data_relationalStore.RdbStore).rebuilt 88888888888888888888888`);
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0024 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest0025
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2500
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0025 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      let options:data_relationalStore.TransactionOptions = {
        transactionType:data_relationalStore.TransactionType.DEFERRED
      }
      let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
        "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

      let DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
      let rdbStore: data_relationalStore.RdbStore  = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let rdbTrans = await rdbStore.createTransaction(options);
      try{
        rdbTrans.querySql("select * from test where data1 = ?",['hello']).then((resultSet:data_relationalStore.ResultSet)=>{
          expect(resultSet.rowCount == 1 ).assertTrue();
          rdbTrans.commit();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0025 end *************' + err);
          expect(err != null ).assertFail();
          rdbTrans.rollback();
          done();
        })
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0025 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0025 end *************');
    })


    /**
     * @tc.name       RelationalStoreEnumerateTest026
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2600
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest026 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_NORMAL
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest026, num` + num);
          expect(num == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest026, code is ${err.code},message is ${err.message}`);
          expect(err != null ).assertFail();
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(` RelationalStoreEnumerateTest026 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationaRelationalStoreEnumerateTest026lStoreEnumerateTest010 end *************');
    })
    /**
     * @tc.name       RelationalStoreEnumerateTest027
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2700
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest027 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_INSERT
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest027, num` + num);
          expect(num == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest027, code is ${err.code},message is ${err.message}`);
          expect(err != null ).assertFail();
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(` RelationalStoreEnumerateTest027 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest027 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest028
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2800
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest028 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_UPDATE
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest028, num` + num);
          expect(num == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest028, code is ${err.code},message is ${err.message}`);
          expect(err != null ).assertFail();
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest028 Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest028 end *************');
    })
    /**
     * @tc.name       RelationalStoreEnumerateTest029
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_2900
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest029 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_DELETE
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest029, num` + num);
          expect(num == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest029, code is ${err.code},message is ${err.message}`);
          expect(err != null ).assertFail();
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest029 failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest029 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest030
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_3000
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest030 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_ABNORMAL
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest030, num` + num);
          expect(num == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest030, code is ${err.code},message is ${err.message}`);
          expect(err != null ).assertFail();
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest030 failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest030 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest031
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_3100
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest031 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_DOWNLOADING
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest031, num` + num);
          expect(num == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest031, code is ${err.code},message is ${err.message}`);
          expect(err != null ).assertFail();
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest031 failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest031 end *************');
    })

    /**
     * @tc.name       RelationalStoreEnumerateTest032
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_3200
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest032 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        vector:false
      };
      try{
        store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "data1 text," + "data2 INTEGER, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
          "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
        let  DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
        await (store as data_relationalStore.RdbStore).execute(DROP_TABLE_TEST);
        await Utils.msSleep(2000)
        await (store as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST);
        let asset:data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status:data_relationalStore.AssetStatus.ASSET_DOWNLOADING
        };
        const assets = [asset];
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": "hello world",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        try{
          let num = await (store as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.error(`RelationalStoreEnumerateTest032, num` + num);
          expect(num == 1).assertTrue();
          done();
        }catch(err) {
          err = err as BusinessError;
          console.error(`RelationalStoreEnumerateTest032, code is ${err.code},message is ${err.message}`);
          expect(err != null ).assertFail();
          done();
        }
      } catch(err) {
        err = err as BusinessError;
        console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest032 end *************');
    })


    /**
     * @tc.name       RelationalStoreEnumerateTest0033
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_3300
     * @tc.desc       getColumnIndex normal test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationalStoreEnumerateTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0033 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      let options:data_relationalStore.TransactionOptions = {
        transactionType:data_relationalStore.TransactionType.EXCLUSIVE
      }
      let CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
        "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

      let DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
      let rdbStore: data_relationalStore.RdbStore  = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let rdbTrans = await rdbStore.createTransaction(options);
      try{
        rdbTrans.querySql("select * from test where data1 = ?",['hello']).then((resultSet:data_relationalStore.ResultSet)=>{
          expect(resultSet.rowCount == 1 ).assertTrue();
          rdbTrans.commit();
          done();
        }).catch((err) => {
          hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0033 end *************' + err);
          expect(err != null ).assertFail();
          rdbTrans.rollback();
          done();
        })
      }catch(err){
        hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0033 end *************' + err);
        expect(err != null ).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationalStoreEnumerateTest0033 end *************');
    })


  })
}