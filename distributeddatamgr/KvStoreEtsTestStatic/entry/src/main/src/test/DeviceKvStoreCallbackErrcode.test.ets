/*
* Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '../../../hypium/index';
import factory from '@ohos.data.distributedKVStore';
import common from "@ohos.app.ability.common";
import fs from "@ohos.file.fs";


import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
const domain = 0xFF00;
const tag = "TestTag";

const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
const VALUE_TEST_STRING_ELEMENT = 'value-string-002';

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'dstoreId';
let kvManager: factory.KVManager|null = null;
let kvStore : factory.DeviceKVStore|null = null;
let localDeviceId = '';
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS: string[] =  [];  /* add you test device-ids here */
let syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);

let keyPrefix = null;
let context: common.UIAbilityContext | null = null
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const dbName = "gen_natural_store.db";

let dbPath = '';
let dbPathWal = '';
let dbPathShm = '';

function initDbPaths() {
  if (!context) {
    throw new Error('context is not initialized');
  }
  const dbDir = context!.databaseDir + "/kvdb/d9a2756029fbcf2ce92cb649edeb3ad75be45ac1905b681a7127400be783ddd9/single_ver/main/";
  dbPath = dbDir + dbName;
  dbPathWal = dbPath + "-wal";
  dbPathShm = dbPath + "-shm";
}

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

//const TAG = "[DeviceKv_Ets_TEST >>>>>> ]"
const TAG = "[DeviceKv_Ets_TEST >>>>>> ]"


async function CreateCorruptDb() {

  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(TAG + 'CreateCorruptDb begin ... ');
    console.info(TAG + 'fileExist=' + fileExist);
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4);
    fs.truncateSync(dbPathShm, 4);
    let file = fs.openSync(dbPath, fs.OpenMode.READ_WRITE);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd);
    fs.closeSync(file);
    console.info(TAG + "CreateCorruptDb succeed");
  }catch (err) {
    console.error(TAG + "CreateCorruptDb failed, errCode:" + err.code + "errMessage" + err.message);
    expect().assertFail();
  }
  console.info(TAG + "quit creat corrupt store");
};

let entries: factory.Entry [] = [];
let resultSet: factory.KVStoreResultSet;

export default function deviceKvStoreCallbackErrcodeTest(){
  describe('deviceKvStoreCallbackErrcodeTest', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,

      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        // await abilityDelegator.startAbility({
        //   bundleName: 'com.example.kvstoreetstest.static',
        //   abilityName: 'EntryAbility'
        // });
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
      }

      console.info(TAG + 'beforeAll context.databaseDir=' + context!.databaseDir);
      initDbPaths();
      for (let i = 0; i < 10; i++) {
        let key = 'batch_test_string_key';
        let entry : factory.Entry = {
          key : key + i,
          value : {
            type : factory.ValueType.STRING,
            value : 'batch_test_string_value'
          }
        }
        entries.push(entry);
      }

      const config : factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context as common.UIAbilityContext
      };
      console.info(TAG + 'beforeAll config:' + JSON.stringify(config));
      kvManager = factory.createKVManager(config);
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeAll getKVStore for getDeviceId success');
      }).catch((err: Error) => {
        console.error(TAG + 'beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      let getDeviceId = new Promise<string>((resolve, reject) => {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
          console.info(TAG + 'beforeAll on data change: ' + JSON.stringify(data));
          resolve(data!.deviceId);
        });
        kvStore!.put("getDeviceId", "byPut").then((data) => {
          console.info(TAG + 'beforeAll put success');
          expect(data == undefined).assertTrue();
        });
        setTimeout(() => {
          reject(new Error('not resolved in 2 second, reject it.'));
        }, 2000);
      });
      await getDeviceId.then((deviceId: string) => {
        console.info(TAG + 'beforeAll getDeviceId ' + JSON.stringify(deviceId));
        localDeviceId = deviceId;
      }).catch((error: Error) => {
        console.error(TAG + 'beforeAll can NOT getDeviceId, fail: ' +
          `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('beforeAll closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('beforeAll deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err) => {
          console.info('beforeAll deleteKVStore err ' + err);
          done();
        });
      }).catch((err) => {
        console.info('beforeAll closeKVStore err ' + err);
        done();
      });

    });
    afterAll(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterAll');
      done();
    });


    beforeEach(async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore for DeviceId success');
      }).catch((err: Error) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

      await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
        expect(data == undefined).assertTrue();
        console.info(TAG + 'beforeEach put success');
      }).catch((err: Error) => {
        console.error(TAG + 'beforeEach put err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

      console.info(TAG + 'beforeEach entries: ' + JSON.stringify(entries!));
      kvStore!.putBatch(entries, () => {
        console.info(TAG + 'beforeEach putBatch success');
        done();
      });

    });
    afterEach(async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'afterEach');
      try {
        kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, (err, data)  => {
          console.info('afterEach closeKVStore success: function err is: '+err);
          kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, (err, data) => {
            console.info('afterEach deleteKVStore success: function err is: '+err);
            kvStore = null;
            done();
          });
        });

      } catch (e) {
        console.error('afterEach closeKVStore err ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }

    });

    /**
     * @tc.name   SUB_DDM_DKV_Get_Did_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_Get_Did_ErrCode_0001
     * @tc.desc   get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | long | double | Uint8Array>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0001');
      try {
        kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT, (err) => {
          if (err == undefined) {
            console.info(TAG + ' get success');
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
          }
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_Did_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_Get_Did_ErrCode_0200
     * @tc.desc   get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | long | double | Uint8Array>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0200');
      try {
        //数据库损坏
        await CreateCorruptDb();
        kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT, (err) => {
          if (err == undefined) {
            console.info(TAG + ' get success');
            expect(null).assertFail();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100003).assertEqual(err.code);
            done();
          }
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_Did_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_Get_Did_ErrCode_0300
     * @tc.desc   SUB_DDM_DKV_Get_Did_ErrCode_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0300');
      try {
        kvStore!.get(localDeviceId, 'keyno', (err) => {
          if (err == undefined) {
            console.info(TAG + ' get success');
            expect(null).assertFail();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100004).assertEqual(err.code);
          }
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_Did_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_Get_Did_ErrCode_0400
     * @tc.desc   SUB_DDM_DKV_Get_Did_ErrCode_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0400');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT, (err) => {
          if (err == undefined) {
            console.info(TAG + ' get success');
            expect(null).assertFail();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
          }
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GET_ErrCode_0200
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | long | double | Uint8Array>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_Get_ErrCode_0200');
      try {
        //数据库损坏
        await CreateCorruptDb();
        kvStore!.get(KEY_TEST_STRING_ELEMENT, (err) => {
          if (err == undefined) {
            console.info(TAG + ' SUB_DDM_DKV_Get_ErrCode_0200 get success');
            expect(null).assertFail();
          } else {
            console.error(TAG + ' SUB_DDM_DKV_Get_ErrCode_0200 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100003).assertEqual(err.code);
          }
          done();
        });
      } catch (e) {
        console.error(TAG + ' SUB_DDM_DKV_Get_ErrCode_0200 catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GET_ErrCode_0300
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | long | double | Uint8Array>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_Get_ErrCode_0300');
      try {
        kvStore!.get('keyno', (err) => {
          if (err == undefined) {
            console.info(TAG + ' SUB_DDM_DKV_Get_ErrCode_0300 get success');
            expect(null).assertFail();
          } else {
            console.error(TAG + ' SUB_DDM_DKV_Get_ErrCode_0300 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100004).assertEqual(err.code);
          }
          done();
        });
      } catch (e) {
        console.error(TAG + ' SUB_DDM_DKV_Get_ErrCode_0300 catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GET_ErrCode_0400
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | long | double | Uint8Array>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_Get_ErrCode_0400');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        kvStore!.get(KEY_TEST_STRING_ELEMENT, (err) => {
          if (err == undefined) {
            console.info(TAG + ' SUB_DDM_DKV_Get_ErrCode_0400 get success');
            expect(null).assertFail();
          } else {
            console.error(TAG + ' SUB_DDM_DKV_Get_ErrCode_0400 get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
          }
          done();
        });
      } catch (e) {
        console.error(TAG + ' SUB_DDM_DKV_Get_ErrCode_0400 catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Did_Key_ErrCode_0001
     * @tc.desc   Test Js Api DeviceKvStore.getEntries(Deviceid) ErrCode 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0001 000 ');
      try {
        //await kvStore.getEntries(localDeviceId, 'batch_test_string_key', (err, entrys) => {
        kvStore!.getEntries(localDeviceId, 'batch_test_string_key', (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            console.info(TAG + ' entrys.length: ' + entrys!.length);
            console.info(TAG + ' entrys[0]: ' + JSON.stringify(entrys![0]));
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value == 'batch_test_string_value').assertTrue();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Did_Key_ErrCode_0200
     * @tc.desc   Test Js Api DeviceKvStore.getEntries(Deviceid) ErrCode 15100003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0200 ');
      try {
        await CreateCorruptDb();
        kvStore!.getEntries(localDeviceId, 'batch_test_string_key', (err) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(null).assertFail();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100003).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Did_Key_ErrCode_0300
     * @tc.desc   Test Js Api DeviceKvStore.getEntries(Deviceid) ErrCode 15100005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0300 ');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        kvStore!.getEntries(localDeviceId, 'batch_test_string_key', (err) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(null).assertFail();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Key_ErrCode_0200
     * @tc.desc   Test Js Api DeviceKvStore.getEntries() ErrCode 15100003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Key_ErrCode_0200 ');
      try {
        await CreateCorruptDb();
        kvStore!.getEntries('batch_test_string_key', (err) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(null).assertFail();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100003).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Key_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Key_ErrCode_0300
     * @tc.desc   Test Js Api DeviceKvStore.getEntries() ErrCode 15100005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Key_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Key_ErrCode_0300 ');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        kvStore!.getEntries('batch_test_string_key', (err) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(null).assertFail();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Did_Query_ErrCode_0001
     * @tc.desc   getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001 000 ');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        // await kvStore!.getEntries(localDeviceId, query, (err, entrys: factory.Entry[]) => {
        kvStore!.getEntries(localDeviceId, query, (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            console.info(TAG + ' entrys.length: ' + entrys!.length);
            console.info(TAG + ' entrys[0]: ' + JSON.stringify(entrys![0]));
            expect(entrys!.length == 10).assertTrue();
            expect(entrys![0].value.value == 'batch_test_string_value').assertTrue();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Did_Query_ErrCode_0200
     * @tc.desc   getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0200');
      try {
        await CreateCorruptDb();
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        // await kvStore.getEntries(localDeviceId, query, (err, entrys: factory.Entry[]) => {
        kvStore!.getEntries(localDeviceId, query, (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(null).assertFail();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100003).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Did_Query_ErrCode_0300
     * @tc.desc   getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0300');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        // await kvStore.getEntries(localDeviceId, query, (err, entrys: factory.Entry[]) => {
        kvStore!.getEntries(localDeviceId, query, (err: BusinessError | null, entrys: factory.Entry[] | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(entrys!.length == 10).assertTrue();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Query_ErrCode_0200
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Query_ErrCode_0200');
      try {
        await CreateCorruptDb();
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        kvStore!.getEntries(query, (err, entrys) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(null).assertFail();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100003).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Query_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetEntries_Query_ErrCode_0300
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Query_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Query_ErrCode_0300');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        kvStore!.getEntries(query, (err, entrys) => {
          if (err == undefined) {
            console.info(TAG + ' getEntries success');
            expect(entrys!.length == 10).assertTrue();
            done();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Did_Key_ErrCode_0001
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0001');
      try {
        // await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async (err, result) => {
        kvStore!.getResultSet(localDeviceId, 'batch_test_string_key', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getResultSet success');
            resultSet = result!;
            expect(resultSet.getCount() == 10).assertTrue();
            kvStore!.closeResultSet(resultSet, (err) => {
              console.info(TAG + ' closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Did_Key_ErrCode_0200
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0200');
      try {
        let resultSets: factory.KVStoreResultSet[] = [];
        for (let i=0; i<9; i++) {
          // await kvStore.getResultSet(localDeviceId, 'key_test_string_2', async (err, result) => {
          kvStore!.getResultSet(localDeviceId, 'key_test_string_2', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            if (err == undefined) {
              console.info(TAG + ' getResultSet success, i=' + i);
              resultSets.push(result!);
            } else {
              console.error(TAG + ' get fail' + `,  i is ${i}, error code is ${err.code}, message is ${err.message}`);
              expect(15100001).assertEqual(err.code);
              await sleep(1000);
              for (let j=0; j<9; j++) {
                try{
                  kvStore!.closeResultSet(resultSets[j], (err) => {
                    if (err == undefined) {
                      console.info(TAG + ' closeResultSet success, j=' + j);
                    } else {
                      console.error(TAG + ' closeResultSet fail' + `,  j is ${j}, error code is ${err.code}, message is ${err.message}`);
                    }
                  })
                }catch(er){
                  console.error(TAG + 'catch  closeResultSet fail' + `,  j is ${j}, error code is ${er.code}, message is ${er.message}`);
                }
              }
              await sleep(2000);
              done();
            }
          });
        }

      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Did_Key_ErrCode_0400
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0400');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        // await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async (err, result) => {
        kvStore!.getResultSet(localDeviceId, 'batch_test_string_key', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getResultSet success');
            resultSet = result!;
            expect(null).assertFail();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Key_ErrCode_0200
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Key_ErrCode_0200');
      try {
        let resultSets: factory.KVStoreResultSet[] = [];
        for (let i=0; i<9; i++) {
          // await kvStore.getResultSet('key_test_string_2', async (err, result) => {
          kvStore!.getResultSet('key_test_string_2', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            if (err == undefined) {
              console.info(TAG + ' getResultSet success, i=' + i);
              resultSets.push(result!);
            } else {
              console.error(TAG + ' get fail' + `,  i is ${i}, error code is ${err.code}, message is ${err.message}`);
              expect(15100001).assertEqual(err.code);
              await sleep(1000);
              for (let j=0; j<9; j++) {
                try{
                  kvStore!.closeResultSet(resultSets[j], (err) => {
                    if (err == undefined) {
                      console.info(TAG + ' closeResultSet success, j=' + j);
                    } else {
                      console.error(TAG + ' closeResultSet fail' + `,  j is ${j}, error code is ${err.code}, message is ${err.message}`);
                    }
                  })
                }catch(er){
                  console.error(TAG + 'catch  closeResultSet fail' + `,  j is ${j}, error code is ${er.code}, message is ${er.message}`);
                }

              }
              await sleep(2000);
              done();
            }
          });
        }

      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Key_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Key_ErrCode_0400
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Key_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Key_ErrCode_0400');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        // await kvStore.getResultSet('batch_test_string_key', async (err, result) => {
        kvStore!.getResultSet('batch_test_string_key', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getResultSet success');
            resultSet = result!;
            expect(null).assertFail();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Did_Query_ErrCode_0001
     * @tc.desc   getResultSet(deviceId: string, query: Query, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0001');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        // await kvStore.getResultSet(localDeviceId, query, async (err, result) => {
        kvStore!.getResultSet(localDeviceId, query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getResultSet success');
            resultSet = result!;
            expect(resultSet.getCount() == 10).assertTrue();
            kvStore!.closeResultSet(resultSet, (err) => {
              console.info(TAG + ' closeResultSet success');
              expect(err == undefined).assertTrue();
              done();
            })
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Did_Query_ErrCode_0200
     * @tc.desc   getResultSet(deviceId: string, query: Query, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0200');
      try {
        let resultSets: factory.KVStoreResultSet[] = [];
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        for (let i=0; i<9; i++) {
          // await kvStore.getResultSet(localDeviceId, query, async (err, result) => {
          kvStore!.getResultSet(localDeviceId, query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            if (err == undefined) {
              console.info(TAG + ' getResultSet success, i=' + i);
              resultSets.push(result!);
            } else {
              console.error(TAG + ' get fail' + `,  i is ${i}, error code is ${err.code}, message is ${err.message}`);
              expect(15100001).assertEqual(err.code);
              await sleep(1000);
              for (let j=0; j<9; j++) {
                try{
                  kvStore!.closeResultSet(resultSets[j], (err) => {
                    if (err == undefined) {
                      console.info(TAG + ' closeResultSet success, j=' + j);
                    } else {
                      console.error(TAG + ' closeResultSet fail' + `,  j is ${j}, error code is ${err.code}, message is ${err.message}`);
                    }
                  })
                }catch(er){
                  console.error(TAG + 'catch  closeResultSet fail' + `,  j is ${j}, error code is ${er.code}, message is ${er.message}`);
                }

              }
              await sleep(2000);
              done();
            }
          });
        }

      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Did_Query_ErrCode_0400
     * @tc.desc   getResultSet(deviceId: string, query: Query, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0400');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        // await kvStore.getResultSet(localDeviceId, query, async (err, result) => {
        kvStore!.getResultSet(localDeviceId, query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getResultSet success');
            resultSet = result!;
            expect(null).assertFail();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Query_ErrCode_0200
     * @tc.desc   getResultSet(query: Query, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Query_ErrCode_0200');
      try {
        let resultSets: factory.KVStoreResultSet[] = [];
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        for (let i=0; i<9; i++) {
          // await kvStore.getResultSet(query, async (err, result) => {
          kvStore!.getResultSet(query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            if (err == undefined) {
              console.info(TAG + ' getResultSet success, i=' + i);
              resultSets.push(result!);
            } else {
              console.error(TAG + ' get fail' + `,  i is ${i}, error code is ${err.code}, message is ${err.message}`);
              expect(15100001).assertEqual(err.code);
              await sleep(1000);
              for (let j=0; j<9; j++) {
                try{
                  kvStore!.closeResultSet(resultSets[j], (err) => {
                    if (err == undefined) {
                      console.info(TAG + ' closeResultSet success, j=' + j);
                    } else {
                      console.error(TAG + ' closeResultSet fail' + `,  j is ${j}, error code is ${err.code}, message is ${err.message}`);
                    }
                  })
                }catch(er){
                  console.error(TAG + 'catch  closeResultSet fail' + `,  j is ${j}, error code is ${er.code}, message is ${er.message}`);
                }

              }
              await sleep(2000);
              done();
            }
          });
        }

      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Query_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSet_Query_ErrCode_0400
     * @tc.desc   getResultSet(query: Query, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Query_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Query_ErrCode_0400');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        // await kvStore.getResultSet(query, async (err, result) => {
        kvStore!.getResultSet(query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          if (err == undefined) {
            console.info(TAG + ' getResultSet success');
            //resultSet = result;//tmp
            expect(null).assertFail();
          } else {
            console.error(TAG + ' get fail' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100005).assertEqual(err.code);
            done();
          }

        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_getResultSize_Did_Query_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_getResultSize_Did_Query_ErrCode_0300
     * @tc.desc   getResultSize(deviceId: string, query: Query, callback: AsyncCallback<int>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_getResultSize_Did_Query_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_getResultSize_Did_Query_ErrCode_0300');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let  query: factory.Query | null = new factory.Query();
        kvStore?.getResultSize(localDeviceId, query, (err: BusinessError<void>|null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getResultSize.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getResultSize`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_getResultSize_Did_Query_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_getResultSize_Did_Query_ErrCode_0400
     * @tc.desc   getResultSize(deviceId: string, query: Query, callback: AsyncCallback<int>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_getResultSize_Did_Query_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_getResultSize_Did_Query_ErrCode_0400');
      try {
        let  query: factory.Query | null = new factory.Query();
        query.prefixKey("keyno");
        kvStore!.getResultSize(localDeviceId, query, (err: BusinessError<void>|null) => {
          console.error(TAG + `Failed to get.code is ${err!.code},message is ${err!.message}`);
          expect(err!.code).assertEqual(15100004);
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_getResultSize_Query_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_getResultSize_Query_ErrCode_0300
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<int>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_getResultSize_Query_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      console.info(TAG + 'SUB_DDM_DKV_getResultSize_Query_ErrCode_0300');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'SUB_DDM_DKV_getResultSize_Query_ErrCode_0300 Succeeded in closeKVStore');
        let query: factory.Query | null = new factory.Query();
        kvStore?.getResultSize(query, (err: BusinessError<void>|null) => {
          if (err != undefined) {
            console.error(TAG + `SUB_DDM_DKV_getResultSize_Query_ErrCode_0300 Failed to getResultSize.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `SUB_DDM_DKV_getResultSize_Query_ErrCode_0300 Succeeded in getResultSize`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_getResultSize_Query_ErrCode_0300 Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    })
  })
}