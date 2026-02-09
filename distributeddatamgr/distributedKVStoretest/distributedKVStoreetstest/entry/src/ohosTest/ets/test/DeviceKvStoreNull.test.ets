/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import factory from '@ohos.data.distributedKVStore';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[testtag >>>>>> ]"

const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const VALUE_TEST_STRING_ELEMENT = 'value-test-string';

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'DeviceKvStoreNull';
let kvManager: factory.KVManager|null = null;
let kvStore : factory.DeviceKVStore|null = null;
let localDeviceId = '';
let entries: factory.Entry[] = [];

function sleep(ms:number) {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};

export default function DeviceKvStoreNull(){
  describe('DeviceKvStoreNull', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done:Function) => {
      console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);

      await kvManager!.getKVStore<factory.DeviceKVStore>(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeAll getKVStore for getKVStore success');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      let getDeviceId = new Promise<string>((resolve, reject) => {
        kvStore!.on('dataChange', 0, (data) => {
          console.info(TAG + 'beforeAll on data change: ' + JSON.stringify(data));
          console.info(TAG + 'beforeAll on data.deviceId=' + JSON.stringify(data.deviceId));
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
      await getDeviceId.then((deviceId) => {
        console.info(TAG + 'beforeAll getDeviceId=' + JSON.stringify(deviceId));
        localDeviceId = deviceId;
      }).catch((error: BusinessError) => {
        console.error(TAG + 'beforeAll can NOT getDeviceId, fail: ' +
          `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      await sleep(3000);
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      kvStore = null;
      console.info(TAG + 'beforeAll end');
      await sleep(2000);

      for (let i = 0; i < 1; i++) {
        let key = 'batch_test_string_key';
        let entry: factory.Entry = {
          key: key + i,
          value: {
            type: factory.ValueType.STRING,
            value: 'batch_test_string_value'
          }
        }
        entries.push(entry);
      }
      console.info(TAG + `entries: ${JSON.stringify(entries)}`);

      done();

    });

    beforeEach(async (done:Function) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager!.getKVStore<factory.DeviceKVStore>(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      done();
    });
    afterEach(async (done:Function) =>  {
      console.info(TAG + 'afterEach');
      kvStore = null;
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded closeKVStore');
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed closeKVStore.code is ${err.code},message is ${err.message}`);
      });

      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded deleteKVStore');
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
        done();
      });

    });

    afterAll(async (done:Function) => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_get_0100
     * @tc.name SUB_DDM_DKV_Null_get_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---true
     * key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_get_0100 begin---------  ');
        kvStore!.get('', (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_get_0102
     * @tc.name SUB_DDM_DKV_Null_get_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---true
     * key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_get_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_get_0102 begin---------  ');
        kvStore!.get(null, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_get_0103
     * @tc.name SUB_DDM_DKV_Null_get_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---true
     * key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_get_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_get_0103 begin---------  ');
        kvStore!.get(undefined, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_get_Promise_0100
     * @tc.name SUB_DDM_DKV_Null_get_Promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>;
     * key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_get_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_get_Promise_0100 begin---------  ');
        await kvStore!.get("");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_get_Promise_0102
     * @tc.name SUB_DDM_DKV_Null_get_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>;
     * key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_get_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_get_Promise_0102 begin---------  ');
        await kvStore!.get(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_get_Promise_0103
     * @tc.name SUB_DDM_DKV_Null_get_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>;
     * key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_get_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_get_Promise_0103 begin---------  ');
        await kvStore!.get(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_getDeviceId_0100
     * @tc.name SUB_DDM_DKV_Null_getDeviceId_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * deviceId = ""//null/undefined, key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_getDeviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let key = 'key';
      let value = 'value';
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_getDeviceId_0100 begin---------  ');
        await kvStore!.put(key, value);
        console.info(TAG + 'put success ');
        kvStore!.get('', key, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(data).assertEqual(value);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_getDeviceId_0102
     * @tc.name SUB_DDM_DKV_Null_getDeviceId_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * deviceId = ""//null/undefined, key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_getDeviceId_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let key = 'batch_test_string_key0'
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_getDeviceId_0102 begin---------  ');
        kvStore!.get(null,  key, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_getDeviceId_0103
     * @tc.name SUB_DDM_DKV_Null_getDeviceId_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * deviceId = ""//null/undefined, key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_getDeviceId_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let key = 'key'
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_getDeviceId_0103 begin---------  ');
        kvStore!.get(undefined,  key, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_getDeviceId_0200
     * @tc.name SUB_DDM_DKV_Null_getDeviceId_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * deviceId = ""//null/undefined, key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_getDeviceId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let key = 'key';
      let value = 'value';
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_getDeviceId_0200 begin---------  ');
        await kvStore!.put(key, value);
        console.info(TAG + 'put success ');
        kvStore!.get(localDeviceId, "", (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_getDeviceId_0202
     * @tc.name SUB_DDM_DKV_Null_getDeviceId_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * deviceId = ""//null/undefined, key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_getDeviceId_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let key = 'key';
      let value = 'value';
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_getDeviceId_0202 begin---------  ');
        await kvStore!.put(key, value);
        console.info(TAG + 'put success ');
        kvStore!.get(localDeviceId, null, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvNull_getDeviceId_0203
     * @tc.name SUB_DDM_DKV_Null_getDeviceId_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * deviceId = ""//null/undefined, key = ""//null/undefined
     */
    it('SUB_DDM_DKV_Null_getDeviceId_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let key = 'key';
      let value = 'value';
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_Null_getDeviceId_0203 begin---------  ');
        await kvStore!.put(key, value);
        console.info(TAG + 'put success ');
        kvStore!.get(localDeviceId, undefined, (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          console.info(TAG + `Succeeded in getting err=${err},  data=${data}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    console.info(TAG + '-------------------describe KvStoreReturnValue  end-------------------');
  })
}