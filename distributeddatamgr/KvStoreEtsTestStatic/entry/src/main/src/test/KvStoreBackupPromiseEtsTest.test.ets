/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import distributedData from '@ohos.data.distributedKVStore';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
const domain = 0xFF00;
const tag = "TestTag";
let BUNDLE_NAME = 'com.example.kvstoreetstest.static';
let kvManager: distributedData.KVManager|null = null;
let kvStore : distributedData.SingleKVStore|null = null;
let delresult: Array<[string, int]> = {};
let STORE_ID = 'kvstoreBackupPromise';
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let mKVMgrConfig: distributedData.KVManagerConfig

function publicGetKvStore(optionsp: distributedData.Options) {
  console.log(tag + `Test getKvStore `)
  //context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;

  hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
  await Utils.msSleep(2000)
  abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
  // await abilityDelegator.startAbility({
  //   bundleName: 'com.example.kvstoreetstest.static',
  //   abilityName: 'EntryAbility'
  // });
  await Utils.msSleep(8000)
  context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
  hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
  let mKVMgrConfig: distributedData.KVManagerConfig = {
    bundleName: BUNDLE_NAME,
    context: context!
  };


  //return new Promise((resolve, reject) => {
  return new Promise<distributedData.SingleKVStore>((resolve, reject) => {
    kvManager = distributedData.createKVManager(mKVMgrConfig);
    if (!kvManager) {
      reject(new Error("Failed to create KVManager"));
      return;
    } //tmp
    kvManager!.getKVStore<distributedData.SingleKVStore>(STORE_ID, optionsp,
      (err: BusinessError<void> | null, data: distributedData.SingleKVStore | undefined) => {
        console.info('Test getKVStore begin')
        if (err) {
          console.info('Test getKVStore err = ' + err);
          reject(err);
        }
        console.info('Test getKVStore data = ' + data);
        //kvStore = data;
        if (data) {
          kvStore = data;
        } else {
          reject(new Error("Failed to get KVStore: data is undefined"));
          return;
        }
        resolve(data);
      });
  })

}

function publicCloseKvStore() {
  console.log(tag + `Test closeKvStore `)
  //return new Promise((resolve, reject) => {
  return new Promise<void>((resolve, reject) => {
    kvManager!.closeKVStore(BUNDLE_NAME, STORE_ID, (err, data) => {
      console.info('Test closeKvStore begin')
      if (err) {
        console.info('Test closeKvStore err = ' + err);
        reject(err);
      }
      console.info('Test closeKvStore data = ' + data);
      kvManager!.deleteKVStore(BUNDLE_NAME, STORE_ID, (err, data) => {
        console.info('Test deleteKVStore begin')
        if (err) {
          console.info('Test deleteKVStore err = ' + err);
          reject(err);
        }
        kvStore = null;
        console.info('Test deleteKVStore data = ' + data);
        resolve(data);
      });
    });
  })
}

function publicPut(kvStore: distributedData.SingleKVStore|null,key: string,value: string){
  //console.log(tag + `Test put ${JSON.stringify(key,value)}`)
  console.log(tag + `Test put key: ${key}, value: ${value}`)
  //return new Promise((resolve, reject) => {
  return new Promise<void>((resolve, reject) => {
    kvStore!.put(key,value, (err, data) => {
      console.log(tag + "Test put task =" + JSON.stringify(data));
      if (err != undefined) {
        console.log(tag + "Test put err information: " + err );
        reject(err);
      }else{
        resolve(data);
      }
    })
  })
}

function publicGet(kvStore: distributedData.SingleKVStore|null,key: string){
  console.log(tag + `Test get ${JSON.stringify(key)}`)
  return new Promise<string | boolean | long | double | Uint8Array>((resolve, reject) => {
    kvStore!.get(key, (err, data) => {
      console.log(tag + "Test get task =" + JSON.stringify(data));
      if (err != undefined) {
        console.log(tag + "Test get err information: " + err );
        reject(err);
      }else{
        resolve(data as string | boolean | long | double | Uint8Array);
      }
    })
  })
}

function publicBackup(kvStore: distributedData.SingleKVStore|null,file: string){
  console.log(tag + `Test backup `+ file)
  return new Promise<void>((resolve, reject) => {
    kvStore!.backup(file).then((data) => {
      console.log(tag + "Test backup task =");
      resolve(data);
    }).catch((err: Error) => {
      console.log(tag + "Test backup err information: " + err.code);
      reject(err);
    })
  })
}

// function publicDeleteBackup(kvStore,files){
function publicDeleteBackup(kvStore: distributedData.SingleKVStore|null,files: Array<string>){
  console.log(tag + `Test deleteBackup ${JSON.stringify(files)}`)
  return new Promise<Array<[string, int]>>((resolve, reject) => {
    try{
      //kvStore.deleteBackup(files).then((data) => {
      kvStore!.deleteBackup(files).then((data : Array<[string, int]>) => {
        console.log(tag + "Test deleteBackup BackUpInfo =" + data);
        //let devices =new Array();
        let devices: Array<[string, int]> = data;

        devices = data;
        delresult = devices;
        console.log(tag + "Test deleteBackup pass ");
        resolve(data);
      }).catch ((err: Error) => {
        console.log(tag + "Test deleteBackup err information: " + err );
        reject(err)
      })
    } catch (e: Error) {
      console.log(tag + "111Test deleteBackup err information: " + e );
      reject(e);
    }
  })
}//tmp

function publicRestoreSp(kvStore: distributedData.SingleKVStore|null,file: string){
  console.log(tag + `Test restoresp ${JSON.stringify(file)}`)
  return new Promise<void>((resolve, reject) => {
    kvStore!.restore(file).then((data) => {
      //console.log(tag + "Test restoresp backupinfo information: " + JSON.stringify(data));
      console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0100 Manualrestore fail 2");
      resolve(data);
    }).catch((err: Error) => {
      console.log(tag + "Test restoresp err information: " + err );
      reject(err);
    })
  })
}

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

const optionLock: distributedData.Options = {
  createIfMissing: true,
  encrypt: true,
  backup: true,
  autoSync: false,
  kvStoreType: distributedData.KVStoreType.SINGLE_VERSION,
  securityLevel: distributedData.SecurityLevel.S1,
}


let file: string= '';
let files: string[] = [];
export default function kvStoreBackupPromiseJsunittest(){
  describe('kvStoreBackupPromiseJsunittest', () => {
    beforeAll( async () => {
      console.info('Test beforeAll: Prerequisites at the test suite level, ' +
        'which are executed before the test suite is executed.');
      await publicGetKvStore(optionLock);
      console.info("Test kvstore = " + kvStore)

    })

    beforeEach(() => {
      console.info('beforeEach: Prerequisites at the test case level,' +
        ' which are executed before each test case is executed.');
    })

    afterEach( (done: () => void) => {
      console.info('afterEach: Test case-level clearance conditions, ' +
        'which are executed after each test case is executed.');
      (async () => {
        try {
          if (kvStore) {
            console.error("KvStoreBackupPromiseEtsTest afterEach start publicDeleteBackup");
            await publicDeleteBackup(kvStore!, files);
            console.error("KvStoreBackupPromiseEtsTest afterEach publicDeleteBackup");
            done();
          } else {
            console.error("kvStore is null!");
            expect(false).assertTrue();
            done();
          }
        } catch(e) {
          console.log(tag + "Test deleteBackup err information: " + e);
          done();
        };
      })();
    })
    afterAll( async () => {
      console.info('afterAll: Test suite-level cleanup condition, ' +
        'which is executed after the test suite is executed');
      await publicCloseKvStore();
      kvManager = null;
      console.info("Test kvstore = " + kvStore)
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0100
     * @tc.desc   Test Js Api SingleKvStore.restore() manal testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0200 before getname");
        files = [];
        file = '123';
        files.push(file);
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0200 before restore1");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0200 going restore2 ");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0200 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_PROMISE_0200 Manualrestore fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0300
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0100 before getname");
        files = [];
        file = 'legal';
        files.push(file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0100 before backup");
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0100 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0100 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0100 export fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0400
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0200 before getname");
        files = [];
        file = 'true';
        files.push(file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0200 before backup");
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0200 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0200 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0200 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0500
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0300 before getname");
        files = [];
        file = '1';
        files.push(file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0300 before backup");
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0300 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0300 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0300 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0600
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0400 before getname");
        files = [];
        file = '1.0';
        files.push(file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0400 before backup");
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0400 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0400 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0400 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0700
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0500 before getname");
        file = '';
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0500 before backup");
        await publicBackup(kvStore,file).then((data) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0500 going backup");
          expect(true).assertEqual(data == "code数字");
          done();
        }).catch((err: Error) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0500 fail1 " + err);
          console.log(tag + JSON.stringify(err));
          expect(true).assertEqual(err.code == 401)
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0500 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0800
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600 before getname");
        files = [];
        file = '1';
        let file1 = '2';
        let file2 = '3';
        let file3 = '4';
        let file4 = '5';
        files.push(file);
        files.push(file1);
        files.push(file2);
        files.push(file3);
        files.push(file4);

        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600 before backup");
        await publicBackup(kvStore,file);
        await sleep(500);
        await publicBackup(kvStore,file1);
        await sleep(500);
        await publicBackup(kvStore,file2);
        await sleep(500);
        await publicBackup(kvStore,file3);
        await sleep(500);
        try {
          await publicBackup(kvStore,file4);
          await sleep(500);
        } catch(e) {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600 publicBackup(kvStore,file4) " + e);
        }

        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600 before publicDeleteBackup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          expect("1").assertEqual(delresult[0][0])
          expect(0).assertEqual(delresult[0][1]);

          expect("2").assertEqual(delresult[1][0])
          expect(0).assertEqual(delresult[1][1])

          expect("3").assertEqual(delresult[2][0])
          expect(0).assertEqual(delresult[2][1])

          expect("4").assertEqual(delresult[3][0])
          expect(0).assertEqual(delresult[3][1])

          expect("5").assertEqual(delresult[4][0])
          expect(27459591).assertEqual(delresult[4][1])

          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0600 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_0900
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 before getname");
        files = [];
        file = '1';
        let file1 = '2';
        let file2 = '3';
        let file3 = '4';
        let file4 = '5';
        let file5 = '6';
        files.push(file);
        files.push(file1);
        files.push(file2);
        files.push(file3);
        files.push(file4);
        files.push(file5);

        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 files[]: " + JSON.stringify(files));
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 before backup");
        await publicBackup(kvStore,file);
        await sleep(500);
        await publicBackup(kvStore,file1);
        await sleep(500);
        await publicBackup(kvStore,file2);
        await sleep(500);
        await publicBackup(kvStore,file3);
        await sleep(500);
        try {
          await publicBackup(kvStore,file4);
          await sleep(500);
        } catch(e) {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 publicBackup(kvStore,file4) " + e);
        }
        try {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 before Sixth backup");
          await publicBackup(kvStore,file5).then((data) => {
            console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 going backup");
            expect(true).assertEqual(data == "code数字");
            done();
          }).catch((err: Error) => {
            console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700  fail5 " + err);
            console.log(tag + "err is " + JSON.stringify(err) + "code is " + err.code);
            // expect(true).assertEqual(JSON.stringify(err) == "{\"code\":\"\"}");
            expect(true).assertEqual(err.code == -1);
            console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 Sixth backup err");
          })
          await sleep(500);
        } catch(e) {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 publicBackup(kvStore,file5) " + e);
        }


        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 before publicDeleteBackup");
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          expect("1").assertEqual(delresult[0][0])
          console.log(tag + delresult[0][0]);
          console.log(tag + delresult[0][1]);
          expect(0).assertEqual(delresult[0][1]);
          expect("6").assertEqual(delresult[5][0])
          expect(27459591).assertEqual(delresult[5][1]);

          console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_PROMISE_0700 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1000
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100 before getname");
        files = [];
        file = 'legal';
        files.push(file);
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100 publicDeleteBackup");
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0100 Manualrestoresp fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1100
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200 before getname");
        files = [];
        file = 'true';
        files.push(file);
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200 publicDeleteBackup");
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0200 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1200
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0300 before getname");
        files = [];
        file = '1';
        files.push(file);
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0300 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0300 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0300 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0300 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1300
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0400 before getname");
        files = [];
        file = '1.0';
        files.push(file);
        await publicBackup(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0400 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0400 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0400 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0400 Manualrestoresp fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1400
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500 before getname");
        file = '';
        try {
          await publicBackup(kvStore,file);
          await sleep(500);
        } catch(e) {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500 publicBackup(kvStore,file4) " + e);
        }

        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file).then((data: string | undefined) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500 going restoresp = " + JSON.stringify(data));
          expect(true).assertEqual(false);
          done();
        }).catch((err: Error) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500 Manualrestoresp fail 1" + err);
          expect(true).assertEqual(err.code == 401);
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0500 Manualrestoresp fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1500
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0600 before getname");
        file = 'legal';
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0600 before restoresp");
        await publicRestoreSp(kvStore,file).then((data: string | undefined) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0600 going restoresp = " + JSON.stringify(data));
          expect(true).assertEqual(false);
          done();
        }).catch((err: Error) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0600 Manualrestoresp fail 1" + err);
          expect(true).assertEqual(err.code == 401);
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_RESTORESPECIFIEDVERSION_PROMISE_0600 Manualrestoresp fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_DELETEBACKUP_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1600
     * @tc.desc   Test Js Api SingleKvStore.deleteBackup() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_DELETEBACKUP_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_DELETEBACKUP_PROMISE_0100 before deleteBackup");
        files = [];
        file = '123';
        files.push(file);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          let delResult = delresult[0];
          expect(27459591).assertEqual(delResult[1]);
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_DELETEBACKUP_PROMISE_0100 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_DELETEBACKUP_PROMISE_0100 going deleteBackup");
      } catch (err) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_DELETEBACKUP_PROMISE_0100 deleteBackup fail 2" + err);
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1700
     * @tc.desc   Test Js Api SingleKvStore.put() db testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0100 before putdata");
        await publicPut(kvStore,"key1","value1");
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0100 going putdata");
        done();
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0100 Backupinfo fail" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1800
     * @tc.desc   Test Js Api SingleKvStore.put() db testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0200 before putdata");
        await publicPut(kvStore,"PutPromise0002","value");
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0200 going putdata");
        await publicGet(kvStore,"PutPromise0002").then((data: string | boolean | long | double | Uint8Array) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0200 going getdata" + JSON.stringify(data));
          expect(true).assertEqual(data == "value");
          done();
        }).catch((err: Error) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0200 Get fail 1 " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0200 Get fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupPromiseEtsApiTest_1900
     * @tc.desc   Test Js Api SingleKvStore.put() db testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0300 before putdata");
        await publicPut(kvStore,"PutPromise0004","value1");
        console.log(tag + "KvStoreBackupestDbBuckupPutPromiseTest004t going putdata");
        await publicGet(kvStore,"PutPromise").then((data: string | boolean | long | double | Uint8Array) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0300 going getdata" + JSON.stringify(data));
          expect(true).assertEqual(JSON.stringify(data) == '{}');
          done();
        }).catch((err: Error) => {
          console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0300 Get fail 1 " + JSON.stringify(err));
          console.log(tag + JSON.stringify(err));
          expect(15100004).assertEqual(err.code);
          done();
        })
      } catch (e: Error) {
        console.log(tag + "SUB_DDM_DKV_KVBACKUP_PUT_PROMISE_0300 Get fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })
  })
}