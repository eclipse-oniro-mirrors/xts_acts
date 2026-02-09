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
import Utils from './Util.test';
import hilog from '@ohos.hilog';
let BUNDLE_NAME = 'com.example.kvstoreetstest.static';
let kvManager: distributedData.KVManager|null = null;
let kvStore : distributedData.SingleKVStore|null = null;
//let delresult = null;
let delresult: Array<[string, int]> = {};
let STORE_ID = 'kvstoreBackupCallback';
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const domain = 0xFF00;
const tag = "TestTag";
const TAG = "[ttt]"

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

function publicPut(kvStore: distributedData.SingleKVStore|null,key: string,value: string){
  //console.log(`Test put ${JSON.stringify(key,value)}`)
  console.log(`Test put key: ${key}, value: ${value}`)
  //return new Promise((resolve, reject) => {
  return new Promise<void>((resolve, reject) => {
    kvStore!.put(key,value, (err, data) => {
      console.log(TAG + "Test put task =" + JSON.stringify(data));
      if (err != undefined) {
        console.log(TAG + "Test put err information: " + err );
        reject(err);
      }else{
        resolve(data);
      }
    })
  })
}

function publicGet(kvStore: distributedData.SingleKVStore|null,key: string){
  console.log(`Test get ${JSON.stringify(key)}`)
  //return new Promise((resolve, reject) => {
  return new Promise<string | boolean | Long | double | Uint8Array>((resolve, reject) => {
    kvStore!.get(key, (err, data) =>{
      console.log(TAG + "Test get task =" + JSON.stringify(data));
      if (err != undefined) {
        console.log(TAG + "Test get err information: " + err );
        reject(err);
      }else{
        resolve(data as string | boolean | Long | double | Uint8Array);
      }
    })
  })
}

function publicBackup(kvStore: distributedData.SingleKVStore|null,file: string){
  console.log(`Test backup ${JSON.stringify(file)}`)
  //return new Promise((resolve, reject) => {
  return new Promise<void>((resolve, reject) => {
    kvStore!.backup(file, (err, data) =>{
      console.log(TAG + "Test backup task");
      if (err != undefined) {
        console.log(TAG + "Test backup err information: " + err );
        reject(err);
      }else{
        resolve(data);
      }
    })
  })
}

function publicDeleteBackup(kvStore: distributedData.SingleKVStore|null,files: Array<string>){
  console.log(`Test deleteBackup ${JSON.stringify(files)}`)

  return new Promise<Array<[string, int]>>((resolve, reject) => {
    try{
      kvStore!.deleteBackup(files, (err: BusinessError<void>|null, data : Array<[string, int]>|undefined) =>{
        console.log(TAG + "Test deleteBackup BackUpInfo =");
        if (err != undefined) {
          console.log(TAG + "Test deleteBackup err information: " + err );
          reject(err);
        }else{
          //let devices =new Array();
          if (data !== undefined) {
            let devices: Array<[string, int]> = data;
            devices = data;
            delresult = devices;
            console.log(TAG + "Test deleteBackup pass ");
            resolve(data);
          } else {
            console.log(TAG + "Test deleteBackup: data is undefined");
            reject(new Error("Data is undefined"));
          }
        }
      })
    } catch (e: Error) {
      console.log(TAG + "111Test deleteBackup err information: " + e );
      reject(e);
    }
  })
}

function publicRestoreSp(kvStore: distributedData.SingleKVStore|null,file: string){
  console.log(`Test restoresp ${JSON.stringify(file)}`)

  return new Promise<void>((resolve, reject) => {
    kvStore!.restore(file, (err, data) =>{
      console.log(TAG + "Test restoresp task =" + JSON.stringify(data));
      if (err != undefined) {
        console.log(TAG + "Test restoresp err information: " + err );
        reject(err);
      }else{
        console.log(TAG + "Test restoresp backupinfo information: " + JSON.stringify(data) );
        resolve(data);
      }
    })
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

let file = '';
let files: Array<string> =new Array<string>(file);
export default function kvStoreBackupCallbackJsunittest() {
  describe('kvStoreBackupCallbackJsunittest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        await abilityDelegator.startAbility({
          bundleName: 'com.example.kvstoreetstest.static',
          abilityName: 'EntryAbility'
        });
        await Utils.msSleep(8000)

        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end databaseDir:' + context.databaseDir);
      } catch (e) {
        hilog.error(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        expect().assertFail();
        done();
      }
      const config: distributedData.KVManagerConfig = {
        bundleName: BUNDLE_NAME,
        context: context
      };
      kvManager = distributedData.createKVManager(config);
      console.info(TAG+ 'beforeAll end');
      done();
    });

    beforeEach(async (done: () => void): Promise<void> => {
      try{
        await kvManager!.getKVStore<distributedData.SingleKVStore>(STORE_ID, optionLock).then((store: distributedData.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'beforeEach getKVStore success');
          done();
        }).catch ((err: Error) => {
          console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      }catch (err: Error) {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    afterEach(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterEach');
      try { //tmp
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

            await (kvManager!.closeKVStore(BUNDLE_NAME, STORE_ID) as Promise<void>).then(async () => {
              console.info(TAG + 'afterEach closeKVStore success');
              files = [];
              done();
            }).catch((err: Error) => {
              console.error(TAG + 'afterEach closeKVStore err ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.warn(TAG + 'afterEach closeKVStore warning: ' +
              `code: ${err.code}, message: ${err.message}`);
            done();
        })
      } catch (closeErr: Error) {
        // 如果关闭失败，可能是已经关闭了，记录日志但不失败
        console.warn(TAG + 'afterEach closeKVStore warning: ' +
          `code: ${closeErr.code}, message: ${closeErr.message}`);
        done();
      }
    });

    afterAll(async (done: () => void): Promise<void> => {
      console.info('afterAll: Test suite-level cleanup condition, ' +
        'which is executed after the test suite is executed');

      kvManager = null;
      kvStore = null;
      console.info(TAG + "Test kvstore = " + kvStore);
      done();//tmp
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0200
     * @tc.desc   Test Js Api SingleKvStore.restore() manal testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200 before getname");
        file  = '123';
        files[0] = file;
        // files.push(file);
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200 before restore");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200 going restore ");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200 delResult = " + delResult);
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200 delResult[1] = " + delResult[1]);
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALRESTORE_CALLBACK_0200 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0300
     * @tc.desc   Test Js Api SingleKvStore.backup() db testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 before getname");
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 before files1:"+ files);
        file = 'true';

        files.push(file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 before files2:"+ files);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 before backup");
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 delResult = " + delResult);
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 delResult[1] = " + delResult[1]);
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_BUCKUP_CALLBACK_0100  fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0400
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try{
        console.log(TAG + "KvStoreBackupestManalBackupCallbackTest001t before getname");
        file = 'legal';

        files.push(file)
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100 before backup");
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100 delResult = " + delResult);
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100 delResult[1] = " + delResult[1]);
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0100 export fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0500
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200 before getname");
        file  = '1';

        files.push(file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200 before backup");
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200 delResult = " + delResult);
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200 delResult[1] = " + delResult[1]);
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0200  fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0600
     * @tc.desc   Test Js Api SingleKvStore.backup() manal testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300 before getname");
        file  = '1.0';

        files.push(file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300 before backup");
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300 going backup");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300 delResult = " + delResult);
          console.info(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300 delResult[1] = " + delResult[1]);
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0300 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0700
     * @tc.desc   Test Js Api SingleKvStore.backup() testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0400 before getname");
        file  = '';
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0400 before backup");
        await publicBackup(kvStore,file).then((data) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0400 going backup");
          expect().assertFail();
          done();
        }).catch((err: Error) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0400 ManualbackupCallback002 fail1 " + err);
          expect(true).assertEqual(err.code == 401);
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0400 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0800
     * @tc.desc   Test Js Api SingleKvStore.backup() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 before getname");
        let file  = '1';
        let file1 = '2';
        let file2 = '3';
        let file3 = '4';
        let file4 = '5';
        files.push(file);
        files.push(file1);
        files.push(file2);
        files.push(file3);
        files.push(file4);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 before backup");
        await publicBackup(kvStore,file);
        await sleep(500);
        await publicBackup(kvStore,file1);
        await sleep(500);
        await publicBackup(kvStore,file2);
        await sleep(500);
        await publicBackup(kvStore,file3);
        await sleep(500);

        try {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 before try publicBackup");
          await publicBackup(kvStore,file4);
          await sleep(500);
        } catch(e: Error) {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 publicBackup(kvStore,file4) " + e);
        }

        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 before publicDeleteBackup");
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

          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 publicDeleteBackup" + JSON.stringify(data));
          files = [];
          console.log(TAG + "Test clear files");
          expect(data != null).assertTrue();
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_0900
     * @tc.desc   Test Js Api SingleKvStore.backup() testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 before getname");
        files = [];
        let file  = '1';
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
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 before backup");
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
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 publicBackup(kvStore,file4) " + e);
        }

        try {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 before Sixth backup");
          await publicBackup(kvStore,file5).then((data) => {
            console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 going backup" + JSON.stringify(data));
            expect(true).assertEqual(data == "code数字");
            done();
          }).catch((err: Error) => {
            console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 ManualbackupCallback002 fail err" + JSON.stringify(err));
            console.log(JSON.stringify(err));
            // expect(true).assertEqual(JSON.stringify(err) == "{\"code\":\"\"}");
            expect(true).assertEqual(err.code == -1);
            console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 Sixth backup err");
          })
        } catch(e) {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0500 publicBackup(kvStore,file5) " + e);
        }


        await sleep(500);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 before publicDeleteBackup");
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {
          expect("1").assertEqual(delresult[0][0])
          expect(0).assertEqual(delresult[0][1]);
          expect("5").assertEqual(delresult[4][0])
          expect(27459591).assertEqual(delresult[4][1]);
          expect("6").assertEqual(delresult[5][0])
          expect(27459591).assertEqual(delresult[5][1]);

          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 publicDeleteBackup" + JSON.stringify(data));
          files = [];
          console.log(TAG + "Test clear files");
          expect(data.length != 0).assertTrue();
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_MANALBACKUP_CALLBACK_0600 fail 2 " + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1000
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100 before getname");
        file  = 'legal';

        files.push(file);
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          console.info("SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100 delResult = " + delResult);
          console.info("SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100 delResult[1] = " + delResult[1]);
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0100 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1100
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0200 before getname");
        file  = 'true';

        files.push(file);
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0200 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0200 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0200 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0200 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1200
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0300 before getname");
        file  = '1';

        files.push(file);
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0300 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0300 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0300 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0300 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1300
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0400 before getname");
        file  = '1.0';

        files.push(file);
        await publicBackup(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0400 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file);
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0400 going restoresp");
        await sleep(500);
        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];
          expect(0).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0400 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0400 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1400
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500 before getname");
        file  = '';
        try {
          await publicBackup(kvStore,file);
        } catch(e) {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500 publicBackup " + e);
        }
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500 before restoresp");
        await sleep(500);
        await publicRestoreSp(kvStore,file).then((data: string | undefined) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500 going restoresp = " + JSON.stringify(data));
          expect(true).assertEqual(false);
          done();
        }).catch((err: Error) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500 fail 1" + err);
          expect(true).assertEqual(err.code == 401);
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0500 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1500
     * @tc.desc   Test Js Api SingleKvStore.restore() SpecifiedVerision testcase 006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600 before getname");
        file  = 'legal';
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600 before restoresp");
        await publicRestoreSp(kvStore,file).then((data: string | undefined) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600 going restoresp = " + JSON.stringify(data));
          expect(true).assertEqual(false);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600  restoresp ok");
          done();
        }).catch((err: Error) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600 fail 1" + err.code);
          expect(true).assertEqual(err.code == 401);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600 get expect 401");
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_RESTORETOSPECIFIEDVERSION_CALLBACK_0600 fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_DELETEBUCKUP_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1600
     * @tc.desc   Test Js Api SingleKvStore.deleteBackup() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_DELETEBUCKUP_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_DELETEBUCKUP_CALLBACK_0100 before deleteBackup");
        file  = '123';

        files.push(file);

        await publicDeleteBackup(kvStore,files).then((data: Array<[string, int]>) => {

          let delResult = delresult[0];

          expect(27459591).assertEqual(delResult[1]);
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_DELETEBUCKUP_CALLBACK_0100 publicDeleteBackup" + JSON.stringify(data));
          done();
        })
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_DELETEBUCKUP_CALLBACK_0100 going deleteBackup");
      } catch (err) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_DELETEBUCKUP_CALLBACK_0100 fail 2" + err);
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1700
     * @tc.desc   Test Js Api SingleKvStore.put() db testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0100 before putdata");
        await publicPut(kvStore,"key","value").then((data: undefined)=>{
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0100 going putdata data= " + JSON.stringify(data));
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0100 going putdata");
          expect(data == undefined).assertTrue();
          done();
        }).catch((err: Error)=>{
          console.log(TAG + "UB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0100 fail 1 " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0100 Backupinfo fail" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1800
     * @tc.desc   Test Js Api SingleKvStore.put() db testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0200 before putdata");
        await publicPut(kvStore,"key","value");
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0200 going putdata");
        await publicGet(kvStore,"key").then((data: string | boolean | Long | double | Uint8Array) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0200 going getdata" + JSON.stringify(data));
          expect(true).assertEqual(data == "value");
          done();
        }).catch((err: Error) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0200 Get fail 1 " + JSON.stringify(err));
          expect(err).assertFail();
          done();
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0200 Get fail 2" + e);
        expect(e).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVStoreBackupCallbackEtsApiTest_1900
     * @tc.desc   Test Js Api SingleKvStore.put() db testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0300 before putdata");
        await publicPut(kvStore,"putcallback003","value1");
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0300 going putdata");
        await publicGet(kvStore,"putcallback").then((data: string | boolean | Long | double | Uint8Array) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0300 going getdata" + JSON.stringify(data));
          expect(true).assertEqual(false);
        }).catch((err: Error) => {
          console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0300 Get fail 1 " + JSON.stringify(err));
          expect(err.code).assertEqual(15100004);
        })
      } catch (e: Error) {
        console.log(TAG + "SUB_DDM_DKV_KVBACKUP_PUT_CALLBACK_0300 Get fail 2" + e);
        expect(e).assertFail();
      }finally{
        done();
      }
    })
  })
}