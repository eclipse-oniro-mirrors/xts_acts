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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import fs from "@ohos.file.fs";


import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
const domain = 0xFF00;

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
let context: common.UIAbilityContext|null = null;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const dbName = "gen_natural_store.db";

let dbPath = '';
let dbPathWal = '';
let dbPathShm = '';

function initDbPaths() {
  if (!context) {
    throw new Error('context is not initialized');
  }
  // 创建数据库损坏
  dbPath = context?.databaseDir+"/kvdb/d9a2756029fbcf2ce92cb649edeb3ad75be45ac1905b681a7127400be783ddd9/single_ver/main/" + dbName;
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

const TAG = "[DeviceKv_Promise_Ets_TEST >>>>>> ]"

let entries: factory.Entry [] = [];
let resultSet: factory.KVStoreResultSet | null = null;
let keyPrefix = null;



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


export default function deviceKvStorePromiseErrcodeTest(){
  describe('deviceKvStorePromiseErrcodeTest', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done: () => void) => {
      try {
        hilog.info(domain, TAG, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        // await abilityDelegator.startAbility({
        //   bundleName: 'com.example.kvstoreetstest.static',
        //   abilityName: 'EntryAbility'
        // });
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context?.databaseDir);
      } catch (e) {
        hilog.info(domain, TAG, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, TAG, '%{public}s', '================ beforeAll context end==========');
        done();
      }

      console.info(TAG + 'beforeAll context.databaseDir=' + context?.databaseDir);
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
        done();
      });
      let getDeviceId = new Promise<string>((resolve, reject) => {
        //kvStore.on('dataChange', 0, (data: string) => {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
          console.info(TAG + 'beforeAll on data change: ' + JSON.stringify(data));
          resolve(data.deviceId);
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
        done();
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

    afterAll(async (done: () => void) => {
      console.info(TAG + 'afterAll');
      done();
    });

    beforeEach(async (done: () => void) => {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));

      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore for getDeviceId success');
        await kvStore!.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
          expect(data == undefined).assertTrue();
          console.info(TAG + 'beforeEach put success');
        }).catch((err: Error) => {
          console.error(TAG + 'beforeEach put err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
        await kvStore!.putBatch(entries).then(() => {
          console.info(TAG + 'beforeEach putBatch success');
          done();
        }).catch((err: Error) => {
          console.error(TAG + 'beforeEach putBatch err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      }).catch((err: Error) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });
      console.info(TAG + 'beforeEach entries: ' + JSON.stringify(entries));
    });
    afterEach(async (done: () => void) => {
      console.info(TAG + 'afterEach');
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err: Error) => {
          console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      }).catch((err: Error) => {
        console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });
    });

    /**
     * @tc.name   SUB_DDM_DKV_Get_Did_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GET_Did_ErrCode_0001
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0001');
      try {
        await kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then(() => {
          console.info(TAG + ' get success');
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GET_Did_ErrCode_0200
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0200');
      try {
        //数据库损坏
        await CreateCorruptDb();
        await kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then(() => {
          console.info(TAG + ' get success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100003).assertEqual(err.code);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GET_Did_ErrCode_0300
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0300');
      try {
        await kvStore!.get(localDeviceId, 'keyno').then(() => {
          console.info(TAG + ' get success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100004).assertEqual(err.code);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GET_Did_ErrCode_0400
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_Did_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_Get_Did_ErrCode_0400');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then(() => {
          console.info(TAG + ' get success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GET_ErrCode_0200
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_Get_ErrCode_0200');
      try {
        //数据库损坏
        await kvStore!.get(KEY_TEST_STRING_ELEMENT).then(() => {
          console.info(TAG + ' get success');
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GET_ErrCode_0300
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_Get_ErrCode_0300');
      try {
        await kvStore!.get('keyno').then(() => {
          console.info(TAG + ' get success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100004).assertEqual(err.code);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_Get_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GET_ErrCode_0400
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_Get_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_Get_ErrCode_0400');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.get(KEY_TEST_STRING_ELEMENT).then(() => {
          console.info(TAG + ' get success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' get fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Did_Key_ErrCode_0001
     * @tc.desc   Test Js Api DeviceKvStore.getEntries(Deviceid) ErrCode 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0001 000 ');
      try {
        await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entrys: factory.Entry[]) => {
          console.info(TAG + ' getEntries success');
          console.info(TAG + ' entrys.length: ' + entrys.length);
          console.info(TAG + ' entrys[0]: ' + JSON.stringify(entrys[0]));
          expect(entrys.length == 10).assertTrue();
          expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Did_Key_ErrCode_0100
     * @tc.desc   Test Js Api DeviceKvStore.getEntries(Deviceid) ErrCode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0100 ');
      try {
        await CreateCorruptDb();
        await kvStore!.getEntries(localDeviceId, '').then((entrys: factory.Entry[]) => {
          console.info(TAG + ' getEntries success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(401).assertEqual(err.code);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Did_Key_ErrCode_0200
     * @tc.desc   Test Js Api DeviceKvStore.getEntries(Deviceid) ErrCode 15100003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0200 ');
      try {
        await CreateCorruptDb();
        await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entrys: factory.Entry[]) => {
          console.info(TAG + ' getEntries success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100003).assertEqual(err.code);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Did_Key_ErrCode_0300
     * @tc.desc   Test Js Api DeviceKvStore.getEntries(Deviceid) ErrCode 15100005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Key_ErrCode_0300 ');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entrys: factory.Entry[]) => {
          console.info(TAG + ' getEntries success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Key_ErrCode_0200
     * @tc.desc   Test Js Api DeviceKvStore.getEntries() ErrCode 15100003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Key_ErrCode_0200 ');
      try {
        await CreateCorruptDb();
        await kvStore!.getEntries('batch_test_string_key').then((entrys: factory.Entry[]) => {
          console.info(TAG + ' getEntries success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100003).assertEqual(err.code);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Key_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Key_ErrCode_0300
     * @tc.desc   Test Js Api DeviceKvStore.getEntries() ErrCode 15100005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Key_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Key_ErrCode_0300 ');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getEntries('batch_test_string_key').then(() => {
          console.info(TAG + ' getEntries success');
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + ' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Did_Query_ErrCode_0001
     * @tc.desc   getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        //await kvStore!.getEntries(localDeviceId, query).then((entrys) => {
        await kvStore!.getEntries(localDeviceId, query).then((entrys: factory.Entry[]) => {
          console.info(' getEntries success');
          console.info(entrys[0].value.value.toString());
          expect(entrys.length == 10).assertTrue();
        }).catch((err:Error) => {
          console.error(' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Did_Query_ErrCode_0200
     * @tc.desc   getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001');
      try {
        await CreateCorruptDb();
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        await kvStore!.getEntries(localDeviceId, query).then((entrys) => {
          console.info(' getEntries success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100003).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Did_Query_ErrCode_0300
     * @tc.desc   getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Did_Query_ErrCode_0001');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        await kvStore!.getEntries(localDeviceId, query).then((entrys) => {
          console.info(' getEntries success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Query_ErrCode_0200
     * @tc.desc   getEntries(query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Query_ErrCode_0200');
      try {
        await CreateCorruptDb();
        let query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(query).then((entrys: factory.Entry[] | undefined) => {
          console.info(' getEntries success');
          expect(entrys!.length == 10).assertTrue();
        }).catch((err:Error) => {
          console.error(' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100003).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetEntries_Query_ErrCode_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetEntries_Query_ErrCode_0300
     * @tc.desc   getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetEntries_Query_ErrCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetEntries_Query_ErrCode_0300');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        await kvStore!.getEntries(query).then(() => {
          console.info(' getEntries success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(' getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Did_Key_ErrCode_0001
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0001');
      try {
        await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
          console.info(TAG + ' getResultSet success');
          resultSet = result;
          expect(resultSet!.getCount() == 10).assertTrue();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore!.closeResultSet(resultSet!).then((err) => {
          console.info(TAG + ' closeResultSet success');
          expect(err == undefined).assertTrue();
        }).catch((err:Error) => {
          console.error(TAG + ' closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Did_Key_ErrCode_0100
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0100');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getResultSet(localDeviceId, '').then(() => {
          console.info(TAG + ' getResultSet success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(401).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Did_Key_ErrCode_0200
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0200');
      try {
        let resultSets: factory.KVStoreResultSet[] = [];
        for (let i=0; i<9; i++) {
          await kvStore!.getResultSet(localDeviceId, 'key_test_string_2').then((result) => {
            console.info(TAG + ' getResultSet success, i=' + i);
            resultSets!.push(result);
          }).catch((err: Error) => {
            console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100001).assertEqual(err.code);
            await sleep(1000);
            for (let j=0; j<9; j++) {
              try{
                //await kvStore.closeResultSet(resultSets[j], (err) => {
                await kvStore!.closeResultSet(resultSets[j]).then(() => {

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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Did_Key_ErrCode_0400
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Key_ErrCode_0300');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key').then(() => {
          console.info(TAG + ' getResultSet success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Key_ErrCode_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Key_ErrCode_0100
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Key_ErrCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Key_ErrCode_0100');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getResultSet('').then(() => {
          console.info(TAG + ' getResultSet success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(401).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Key_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Key_ErrCode_0200
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Key_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Key_ErrCode_0200');
      try {
        let resultSets: factory.KVStoreResultSet[] = [];
        for (let i=0; i<9; i++) {
          await kvStore!.getResultSet('key_test_string_2').then((result) => {
            console.info(TAG + ' getResultSet success, i=' + i);
            resultSets!.push(result);
          }).catch((err:Error) => {
            console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100001).assertEqual(err.code);
            await sleep(1000);
            for (let j=0; j<9; j++) {
              try{
                // await kvStore.closeResultSet(resultSets[j], (err) => {
                //   if (err == undefined) {
                //     console.info(TAG + ' closeResultSet success, j=' + j);
                //   } else {
                //     console.error(TAG + ' closeResultSet fail' + `,  j is ${j}, error code is ${err.code}, message is ${err.message}`);
                //   }
                // })
                kvStore!.closeResultSet(resultSets[j]).then(() => {
                  console.info(TAG + ' closeResultSet success, j=' + j);
                }).catch((err: Error) => {
                  console.error(TAG + ' closeResultSet fail' + `,  j is ${j}, error code is ${err.code}, message is ${err.message}`);
                });

              }catch(er){
                console.error(TAG + 'catch  closeResultSet fail' + `,  j is ${j}, error code is ${er.code}, message is ${er.message}`);
              }
            }

            await sleep(2000);
            done();

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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Key_ErrCode_0400
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Key_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Key_ErrCode_0300');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getResultSet('batch_test_string_key').then(() => {
          console.info(TAG + ' getResultSet success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Did_Query_ErrCode_0001
     * @tc.desc   getResultSet(deviceId: string, query: Query): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0001');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        await kvStore!.getResultSet(localDeviceId, query).then((result) => {
          console.info(TAG + ' getResultSet success');
          resultSet = result;
          expect(resultSet!.getCount() == 10).assertTrue();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore!.closeResultSet(resultSet!).then((err) => {
          console.info(TAG + ' closeResultSet success');
          expect(err == undefined).assertTrue();
        }).catch((err:Error) => {
          console.error(TAG + ' closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Did_Query_ErrCode_0200
     * @tc.desc   getResultSet(deviceId: string, query: Query): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0200');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        let resultSets: factory.KVStoreResultSet[] = [];
        for (let i=0; i<9; i++) {
          await kvStore!.getResultSet(localDeviceId, query).then((result) => {
            console.info(TAG + ' getResultSet success, i=' + i);
            resultSets!.push(result);
          }).catch((err:Error) => {
            console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100001).assertEqual(err.code);
            await sleep(1000);
            for (let j=0; j<9; j++) {
              try{
                kvStore!.closeResultSet(resultSets[j], (err: BusinessError | null) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Did_Query_ErrCode_0400
     * @tc.desc   getResultSet(deviceId: string, query: Query): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Did_Query_ErrCode_0300');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getResultSet(localDeviceId, query).then(() => {
          console.info(TAG + ' getResultSet success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSet_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Query_ErrCode_0200
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Query_ErrCode_0200');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        let resultSets: factory.KVStoreResultSet[] = [];
        for (let i=0; i<9; i++) {
          //await kvStore!.getResultSet(query).then(async(result) => {
            await kvStore!.getResultSet(query).then((result) => {
            console.info(TAG + ' getResultSet success, i=' + i);
            resultSets!.push(result);
          }).catch((err:Error) => {
            console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(15100001).assertEqual(err.code);
            await sleep(1000);
            for (let j=0; j<9; j++) {
              try{
                kvStore!.closeResultSet(resultSets[j], (err: BusinessError | null) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseEtsApiTest_GetResultSet_Query_ErrCode_0400
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSet_Query_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSet_Query_ErrCode_0300');
      try {
        let query = new factory.Query();
        query.deviceId(localDeviceId);
        query.prefixKey("batch_test");
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvStore!.getResultSet(query).then(() => {
          console.info(TAG + ' getResultSet success');
          expect(null).assertFail();
        }).catch((err:Error) => {
          console.error(TAG + ' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(15100005).assertEqual(err.code);
        });
        done();
      } catch (e) {
        console.error(TAG + ' catch get e' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSize_Did_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSize_Did_Query_ErrCode_0200
     * @tc.desc   getResultSet(deviceId: string, query: Query, callback: AsyncCallback<KVStoreResultSet>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSize_Did_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSize_Did_Query_ErrCode_0200');
      try {
        //await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: factory.Query | null = new factory.Query();
        //await kvStore?.getResultSize(localDeviceId, query);
        await kvStore!.getResultSize(localDeviceId, query);
        console.info(TAG + `Succeeded in getResultSize `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getResultSize.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_GetResultSize_Did_Query_ErrCode_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSize_Did_Query_ErrCode_0400
     * @tc.desc   getResultSize(deviceId: string, query: Query): Promise<number>  ErrCode 15100004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSize_Did_Query_ErrCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSize_Did_Query_ErrCode_0400');
      try {
        let  query: factory.Query | null = new factory.Query();
        query.prefixKey("keyno");
        //await kvStore?.getResultSize(localDeviceId, query).then((resultSize: number) => {
        await kvStore!.getResultSize(localDeviceId, query).then((resultSize: int) => {
          console.info(TAG + 'Succeeded in getting resultSize');
          expect().assertFail();
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get resultSize.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(15100004);
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
     * @tc.name   SUB_DDM_DKV_GetResultSize_Query_ErrCode_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVCallbackEtsApiTest_GetResultSize_Query_ErrCode_0200
     * @tc.desc   getResultSize(query: Query): Promise<number>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_GetResultSize_Query_ErrCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + 'SUB_DDM_DKV_GetResultSize_Query_ErrCode_0200');
      try {
        //await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: factory.Query | null = new factory.Query();
        //await kvStore?.getResultSize(query);
        await kvStore!.getResultSize(query);
        console.info(TAG + `Succeeded in getResultSize `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getResultSize.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    })

  })
}