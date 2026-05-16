/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect,
    Level,
    Size,
    TestType
  } from '../../../hypium';
  import relationalStore from '@ohos.data.relationalStore';
  import common from '@ohos.app.ability.common';
  import { BusinessError } from '@ohos.base';
  import Utils from './Util.test';
  import { AppStorage } from '@ohos.arkui.stateManagement';
  import hilog from '@ohos.hilog'
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  
  
  let domain: int = 0x0000;
  let tag: string = "RdbStoreGetModifyTimeErrTest";
  const STORE_NAME = 'cloud_sync_rdb.db';
  const config: relationalStore.StoreConfig = {
    'name': STORE_NAME,
    securityLevel: relationalStore.SecurityLevel.S1,
  }
  let rdbStore: relationalStore.RdbStore | undefined;
  let context: common.UIAbilityContext | undefined;
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let syncProgressDetail: relationalStore.ProgressDetails;
  
  function Progess(ProgressDetail: relationalStore.ProgressDetails): void {
    console.log(tag + ` Progess:` + JSON.stringify(ProgressDetail));
    syncProgressDetail = ProgressDetail;
  }
  
  export default function RdbStoreGetModifyTimeErrTest() {
    describe('RdbStoreGetModifyTimeErrTest', (): void => {
      beforeAll(async (done: () => void): Promise<void> => {
        console.info(tag + 'beforeAll')
        hilog.info(domain, tag, 'beforeAll');
        hilog.info(domain, tag, 'abilityDelegator:' + JSON.stringify(abilityDelegator));
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
        await Utils.msSleep(5000)
        context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
        try {
          console.log(tag + 'create rdb store before');
          try {
            rdbStore = await relationalStore.getRdbStore(context!, config);
            console.log(tag + 'create rdb store success');
          } catch (err) {
            console.log(tag + 'create rdb store failed' + `, error code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
  
          let sql_text = 'CREATE TABLE IF NOT EXISTS cloud_text (' +
            'data TEXT, ' +
            'recycled BOOLEAN, ' +
            'recycledTime INTEGER, ' +
            'num TEXT PRIMARY KEY)';
          let sql_int = 'CREATE TABLE IF NOT EXISTS cloud_int (' +
            'data TEXT, ' +
            'recycled BOOLEAN, ' +
            'recycledTime INTEGER, ' +
            'num INTEGER PRIMARY KEY)';
          let sql_integer = 'CREATE TABLE IF NOT EXISTS cloud_integer (' +
            'data TEXT, ' +
            'recycled BOOLEAN, ' +
            'recycledTime INTEGER, ' +
            'num INTEGER PRIMARY KEY)';
          try {
            await rdbStore!.executeSql(sql_text);
            await rdbStore!.executeSql(sql_int);
            await rdbStore!.executeSql(sql_integer);
            console.log(tag + 'create table cloud_text cloud_int cloud_integer success');
          } catch (err) {
            console.log(tag + 'create table cloud_text cloud_int cloud_integer failed' +
              `, error code is ${err.code}, message is ${err.message}`)
            expect().assertFail();
          }
  
          let tableArray = ['cloud_text', 'cloud_integer'];
          const setConfig: relationalStore.DistributedConfig = {
            autoSync: false,
          }
  
          try {
            await rdbStore!.setDistributedTables(tableArray, relationalStore.DistributedType.DISTRIBUTED_CLOUD, setConfig);
            console.log(tag + 'setDistributedTables success');
          } catch (err) {
              console.log(tag + 'setDistributedTables fail' + `, error code is ${err.code}, message is ${err.message}`);
          }
  
          let vBucketArray1: relationalStore.ValuesBucket[] = [];
          for (let i = 0; i < 5; i++) {
            let valueBucket: relationalStore.ValuesBucket = {
              'data': 'cloud_sync_insert',
              'recycled': true,
              'recycledTime': 12345 as Long,
              'num': 'test_key' + i.toString(),
            }
            vBucketArray1.push(valueBucket);
          }
          await rdbStore!.batchInsert('cloud_text', vBucketArray1);
          let vBucketArray2: relationalStore.ValuesBucket[] = [];
          for (let i = 0 as long; i < 5 as long; i++) {
            let valueBucket: relationalStore.ValuesBucket = {
              'data': 'cloud_sync_insert',
              'recycled': true,
              'recycledTime': 12345 as Long,
              'num': i,
            }
            vBucketArray2.push(valueBucket);
          }
          await rdbStore!.batchInsert('cloud_integer', vBucketArray2);
          console.log(tag + 'create rdb store success');
        } catch (err) {
          console.log(tag + 'create rdb store failed' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        }
        done();
      })
  
      beforeEach(async (): Promise<void> => {
        console.info(tag + 'beforeEach');
      })
  
      afterEach(async (): Promise<void> => {
        console.info(tag + 'afterEach');
      })
  
      afterAll(async (): Promise<void> => {
        console.info(tag + 'afterAll');
        await relationalStore.deleteRdbStore(context!, config);
      })
  
      console.log(tag + '*************Unit Test Begin*************');
  
      /**
       * @tc.name   testRdbStoreGetModifyTime0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsAPITest_0100
       * @tc.desc   get modify time parameter with ""promise
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreGetModifyTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
          async (done: () => void): Promise<void> => {
          console.log(tag + '************* testRdbStoreGetModifyTime0001 start *************');
          try {
            let PRIKey: relationalStore.PRIKeyType[] = ['test_key1', 'test_key2'];
            hilog.info(domain, tag, 'RS0453 PRIKey: ' + JSON.stringify(PRIKey));
            await rdbStore!.getModifyTime('', 'num', PRIKey).then((data: relationalStore.ModifyTime) => {
              console.log(tag + ` modifyTime:` + JSON.stringify(data));
              expect().assertFail();
              done();
            }).catch((err) => {
              expect(err.code).assertEqual(14800000);
              done();
            })
          } catch (err) {
            console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
            expect(err.code).assertEqual(14800000);
            done();
          }
          console.log(tag + '************* testRdbStoreGetModifyTime0001 end *************');
      })
  
      /**
       * @tc.name   testRdbStoreGetModifyTime0002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsAPITest_0200
       * @tc.desc   get modify time parameter with ""promise
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
        it('testRdbStoreGetModifyTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
        console.log(tag + '************* testRdbStoreGetModifyTime0002 start *************');
        try {
          let PRIKey: relationalStore.PRIKeyType[] = ['test_key1', 'test_key2'];
          hilog.info(domain, tag, 'RS0453 PRIKey: ' + JSON.stringify(PRIKey));
          await rdbStore!.getModifyTime('cloud_integer', '', PRIKey).then((data: relationalStore.ModifyTime) => {
            console.log(tag + ` modifyTime:` + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((err) => {
            expect(err.code).assertEqual(14800000);
            done();
          })
        } catch (err) {
          console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual(14800000);
          done();
        }
        console.log(tag + '************* testRdbStoreGetModifyTime0002 end *************');
      })
  
      
      /**
       * @tc.name   testRdbStoreGetModifyTime0003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsAPITest_0300
       * @tc.desc   get modify time parameter with [] promise
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreGetModifyTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreGetModifyTime0003 start *************');
      try {
        await rdbStore!.getModifyTime('cloud_text', 'num', []).then((data: relationalStore.ModifyTime) => {
          console.log(tag + ` modifyTime:` + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err) => {
          expect(err.code).assertEqual(14800000);
          done();
        })
      } catch (err) {
        console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800000);
        done();
      }
      console.log(tag + '************* testRdbStoreGetModifyTime0003 end *************');
    })
  
      /**
       * @tc.name   testRdbStoreGetModifyTime0004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsAPITest_0400
       * @tc.desc   get modify time parameter with [] callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreGetModifyTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreGetModifyTime0004 start *************');
      try {
         rdbStore!.getModifyTime('cloud_text', 'num', [], (err) => {
          if(err){
            console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
            expect(err.code).assertEqual(14800000);
            done();
          }
        })
      } catch (err) {
        console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800000);
        done();
      }
      console.log(tag + '************* testRdbStoreGetModifyTime0004 end *************');
    })
  
      /**
       * @tc.name   testRdbStoreGetModifyTime0005
       * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsAPITest_0500
       * @tc.desc   get modify time parameter with "" callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreGetModifyTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreGetModifyTime0005 start *************');
      try {
        let PRIKey: relationalStore.PRIKeyType[] = ['test_key1', 'test_key2'];
         rdbStore!.getModifyTime('cloud_text', '', PRIKey, (err) => {
          if(err){
            console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
            expect(err.code).assertEqual(14800000);
            done();
          }
        })
      } catch (err) {
        console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800000);
        done();
      }
      console.log(tag + '************* testRdbStoreGetModifyTime0005 end *************');
      })
  
      /**
       * @tc.name   testRdbStoreGetModifyTime0006
       * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsAPITest_0600
       * @tc.desc   get modify time parameter with "" callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreGetModifyTime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      console.log(tag + '************* testRdbStoreGetModifyTime0006 start *************');
      try {
        let PRIKey: relationalStore.PRIKeyType[] = ['test_key1', 'test_key2'];
         rdbStore!.getModifyTime('', 'num', PRIKey, (err) => {
          if(err){
            console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
            expect(err.code).assertEqual(14800000);
            done();
          }
        })
      } catch (err) {
        console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800000);
        done();
      }
      console.log(tag + '************* testRdbStoreGetModifyTime0006 end *************');
      })
      
      /**
       * @tc.name   testRdbStoreGetModifyTime0007
       * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeJsAPITest_0700
       * @tc.desc   get modify time using string primary key type and callback method
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbStoreGetModifyTime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
          console.log(tag + '************* testRdbStoreGetModifyTime0007 start *************');
          try {
            let PRIKey: relationalStore.PRIKeyType[] = ['test_key1', 'test_key2'];
            hilog.info(domain, tag, 'RS0453 PRIKey: ' + JSON.stringify(PRIKey));
             rdbStore!.getModifyTime('cloud_text', 'num', PRIKey, (err, data) => {
              console.log(tag + ` modifyTime:` + JSON.stringify(data));
              expect(typeof(data) === "object").assertTrue()
              done();
  
            })
          } catch (err) {
            console.log(tag + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
            expect().assertFail();
            done();
          }
          console.log(tag + '************* testRdbStoreGetModifyTime0007 end *************');
      })
  
      /**
       * @tc.name   testRdbRestore0002
       * @tc.number testRdbRestore0002
       * @tc.desc   restore with "" promise
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbRestore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
          console.log(tag + "************* testRdbRestore0002 start *************");
          try {
            await rdbStore!.restore("");
            console.info("testRdbRestore0002 restore succeeded");
            expect().assertFail();
            done();
          } catch (err) {
            console.log(tag + `rdbStore.restore fail, errcode: ` + err.code);
            expect(14800010).assertEqual(err.code);
            done();
          }
          console.log(tag + "************* testRdbRestore0002 end *************");
        })
  
        
      /**
       * @tc.name   testRdbRestore0003
       * @tc.number testRdbRestore0003
       * @tc.desc   restore with "" callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testRdbRestore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(tag + "************* testRdbRestore0003 start *************");
        try {
           rdbStore!.restore("", (err: BusinessError|null) => {
            if(err){
              console.log(tag + `rdbStore.restore fail, errcode: ` + err.code);
              expect(14800010).assertEqual(err.code);
              done();
            }else{
              console.info("testRdbRestore0003 restore succeeded");
              expect().assertFail();
              done();
            }
         
           });
   
        } catch (err) {
          console.log(tag + `rdbStore.restore fail, errcode: ` + err.code);
          expect(14800010).assertEqual(err.code);
          done();
        }
        console.log(tag + "************* testRdbRestore0003 end *************");
      })
  
      console.log(tag + '*************Unit Test End*************');
    })
  }
  