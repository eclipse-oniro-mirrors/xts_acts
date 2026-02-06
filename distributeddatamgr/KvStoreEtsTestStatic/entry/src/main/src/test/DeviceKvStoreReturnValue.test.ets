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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '../../../hypium';
import factory from '@ohos.data.distributedKVStore';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
const domain = 0xFF00;
const tag = "TestTag";

const TAG = "[testtag >>>>>> ]"

const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const VALUE_TEST_STRING_ELEMENT = 'value-test-string';

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';

const TEST_STORE_ID = 'DeviceKvStoreReturnValueId';
let kvManager: factory.KVManager|null = null;
let kvStore : factory.DeviceKVStore|null = null;
let localDeviceId = '';
let entries: factory.Entry[] = [];
let context: common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

export default function DeviceKvStoreReturnValue(){

  describe('DeviceKvStoreReturnValue', () => {
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
      const config : factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context!
      };
      console.info(TAG + 'beforeAll context.databaseDir=' + context!.databaseDir);

      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);

      await kvManager!.getKVStore<factory.DeviceKVStore>(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeAll getKVStore for getKVStore success');
      }).catch((err: Error) => {
        console.error(TAG + 'beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      let getDeviceId = new Promise<string>((resolve, reject) => {

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data) => {
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
      await getDeviceId.then((deviceId: string): Promise<void> => {
        console.info(TAG + 'beforeAll getDeviceId=' + JSON.stringify(deviceId));
        localDeviceId = deviceId;
      }).catch((error: Error) => {
        console.error(TAG + 'beforeAll can NOT getDeviceId, fail: ' +
          `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      for (let i = 0; i < 10; i++) {
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
      console.info(TAG + `entries: ${entries}`);

      await sleep(2000);

      if (!kvManager) {
        console.error('kvManager is null');
        expect(false).assertTrue();
      }

      await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
        console.info('beforeAll closeKVStore success');
        //await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
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

    beforeEach(async (done: () => void) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      //await kvManager!.getKVStore<factory.DeviceKVStore>(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
      try {
        const store = await kvManager!.getKVStore<factory.DeviceKVStore>(TEST_STORE_ID, options);
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
        done();
      } catch(err) {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      }
    });

    afterEach(async (done: () => void) =>  {
      console.info(TAG + 'afterEach');
      if (!kvManager) {
        console.error('kvManager is null');
        expect(false).assertTrue();
        done();
      }
      await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
        console.info('afterEach closeKVStore success');

        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err) => {
          console.info('afterEach deleteKVStore err ' + err);
          done();
        });
      }).catch((err: Error) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

    });

    afterAll(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0100
     * @tc.desc   getAllKVStoreId(appId: string, callback: AsyncCallback<string[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0100 begin---------  ');
        kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME, (err: BusinessError | null, data: string[] | undefined) => {
          if (!data) {
            console.error('data is null or undefined');
            expect(null).assertFail();
            done();
            return;
          }
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data?.length) + ',err=' + err);
          expect(data != null).assertTrue();
          expect(data?.length).assertEqual(1);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0100 end--------- ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0101
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0101
     * @tc.desc   getAllKVStoreId(appId: string, callback: AsyncCallback<string[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0101 begin---------  ');
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

        kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME, (err: BusinessError | null, data: string[] | undefined) => {
          //console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) + ',err=' + err);
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + data?.length + ',err=' + err);
          expect(data != null).assertTrue();

          expect(data!.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0101 end--------- ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0200
     * @tc.desc   getAllKVStoreId(appId: string): Promise<string[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0200 begin---------  ');
        await kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME).then((data: string[]) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) );
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(1);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0200 end--------- ');
          done();
        }).catch((err: Error) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0201
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0201
     * @tc.desc   getAllKVStoreId(appId: string): Promise<string[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0201 begin---------  ');

        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

        await kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME).then((data: string[]) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) );
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0201 end--------- ');
          done();
        }).catch((err: Error) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0300
     * @tc.desc   getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0300 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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
        console.info(TAG + `entries: ${entries}`);

        //kvStore!.putBatch(entries, async (err: BusinessError) => {
        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          kvStore!.getEntries('batch_test_string_key', (err: BusinessError | null, entries: factory.Entry[] | undefined) => {

            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
            expect(entries != null).assertTrue();

            expect(entries?.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0300 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0301
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0301
     * @tc.desc   getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0301 begin---------  ');
        kvStore!.getEntries('batch_test_string_key', (err: BusinessError | null, entries: factory.Entry[]|undefined) => {

          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
          expect(entries != null).assertTrue();

          expect(entries?.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0301 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0400
     * @tc.desc   getEntries(keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0400 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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

        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

        await kvStore!.getEntries('batch_test_string_key').then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0400 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0401
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0401
     * @tc.desc   getEntries(keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0401 begin---------  ');

        await kvStore!.getEntries('batch_test_string_key').then((entries: factory.Entry[]|undefined) => {

          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries?.length));
          expect(entries != null).assertTrue();

          expect(entries?.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0401 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0500
     * @tc.desc   getEntries(deviceId: string, keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0500 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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
        console.info(TAG + `entries: ${entries}`);


        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          kvStore!.getEntries(localDeviceId, 'batch_test_string_key', (err: BusinessError|null, entries: factory.Entry[]|undefined) => {

            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
            expect(entries != null).assertTrue();

            expect(entries?.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0500 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0501
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0501
     * @tc.desc   getEntries(deviceId: string, keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0501 begin---------  ');
        kvStore!.getEntries(localDeviceId, 'batch_test_string_key', (err: BusinessError|null, entries: factory.Entry[]|undefined) => {

          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
          expect(entries != null).assertTrue();

          expect(entries?.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0501 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0600
     * @tc.desc   getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0600 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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

        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

        await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0600 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0601
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0601
     * @tc.desc   getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0601 begin---------  ');

        await kvStore!.getEntries(localDeviceId, 'batch_test_string_key').then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0601 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0700
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0700 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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
        console.info(TAG + `entries: ${entries}`);
        //kvStore!.putBatch(entries, async (err: BusinessError) => {
        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getEntries(query, (err: BusinessError|null, entries: factory.Entry[]|undefined) => {

            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
            expect(entries != null).assertTrue();

            expect(entries?.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0700 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0701
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0701
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore!.getEntries(query, (err: BusinessError|null, entries: factory.Entry[]|undefined) => {

          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
          expect(entries != null).assertTrue();

          expect(entries?.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0701 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0800
     * @tc.desc   getEntries(query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0800 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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

        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0800 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0801
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0801
     * @tc.desc   getEntries(query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0801 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0801 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0900
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0900
     * @tc.desc   getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0900 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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
        console.info(TAG + `entries: ${entries}`);

        //kvStore!.putBatch(entries, async (err: BusinessError) => {
        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getEntries(localDeviceId, query, (err: BusinessError|null, entries: factory.Entry[]|undefined) => {

            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
            expect(entries != null).assertTrue();

            expect(entries?.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0900 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_0901
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_0901
     * @tc.desc   getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0901 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore!.getEntries(localDeviceId, query, (err: BusinessError | null, entries: factory.Entry[] | undefined) => {

          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' + err);
          expect(entries != null).assertTrue();

          expect(entries?.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0901 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1000
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1000
     * @tc.desc   getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1000 begin---------  ');
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
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

        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(localDeviceId, query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1000 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1001
     * @tc.desc   getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1001 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getEntries(localDeviceId, query).then((entries: factory.Entry[]) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1001 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1100
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | long | double | Uint8Array>): void---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1100 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, true, (err: BusinessError|null) => {
          console.info(TAG + "Succeeded in putting");

          kvStore!.get(KEY_TEST_BOOL_ELEMENT, (err: BusinessError | null, data: boolean | string | Long | Double | Uint8Array | undefined) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(true);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1100 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1101
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1101
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | long | double | Uint8Array>): void---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1101 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, false, (err: BusinessError|null) => {
          console.info(TAG + "Succeeded in putting");

          kvStore!.get(KEY_TEST_BOOL_ELEMENT, (err: BusinessError | null, data: boolean | string | Long | Double | Uint8Array | undefined) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(false);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1101 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1200
     * @tc.desc   get(key: string): Promise<boolean | string | long | double | Uint8Array>---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1200 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, true);

        await kvStore!.get(KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | Long | Double | Uint8Array) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(true);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1200 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1201
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1201
     * @tc.desc   get(key: string): Promise<boolean | string | long | double | Uint8Array>---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1201 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, false);

        await kvStore!.get(KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | Long | Double | Uint8Array) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(false);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1201 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1300
     * @tc.desc   get(deviceId:string, key:string, callback:AsyncCallback<boolean|string| long | double |Uint8Array>):void--true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1300 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, true, (err: BusinessError | null) => {
          console.info(TAG + "Succeeded in putting");

          kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT, (err: BusinessError | null, data: boolean | string | Long | Double | Uint8Array | undefined) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(true);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1300 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1301
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1301
     * @tc.desc   get(deviceId:string, key:string, callback:AsyncCallback<boolean|string| long | double |Uint8Array>)---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1301 begin---------  ');
        kvStore!.put(KEY_TEST_BOOL_ELEMENT, false, (err: BusinessError | null) => {
          console.info(TAG + "Succeeded in putting");

          kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT, (err: BusinessError | null, data: boolean | string | Long | Double | Uint8Array | undefined) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(false);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1301 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1400
     * @tc.desc   get(deviceId: string, key: string): Promise<boolean | string | long | double | Uint8Array>---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1400 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, true);

        await kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | Long | Double | Uint8Array | undefined) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(true);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1400 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1401
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1401
     * @tc.desc   get(deviceId: string, key: string): Promise<boolean | string | long | double | Uint8Array>---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1401 begin---------  ');
        await kvStore!.put(KEY_TEST_BOOL_ELEMENT, false);

        await kvStore!.get(localDeviceId, KEY_TEST_BOOL_ELEMENT).then((data: boolean | string | Long | Double | Uint8Array | undefined) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(false);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1401 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1500
     * @tc.desc   FieldNode.appendChild(child: FieldNode): boolean---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1500 begin---------  ');
        let node:factory.FieldNode|null = new factory.FieldNode("root");
        let child:factory.FieldNode|null = new factory.FieldNode("child");
        let res1 = node.appendChild(child);
        console.info(TAG + ' appendChild res1=' + res1);
        expect(res1).assertEqual(true);
        child = null;
        node = null;
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1500 end---------  ');
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1600
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1600
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<int>): void---int = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1600 begin---------  ');
        console.info(TAG + `entries: ${entries}`);

        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSize(query, (err: BusinessError | null, resultSize: int | undefined) => {
            console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err);
            expect(resultSize).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1600 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1601
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1601
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<int>): void---int = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1601 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("no_batch_test");

        kvStore!.getResultSize(query, (err: BusinessError | null, resultSize: int | undefined) => {
          if (!err) {
            console.error('err is null, but expected an error');
            expect(false).assertTrue();
            done();
            return;
          }

          console.error(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err?.code + err?.message);
          expect(resultSize).assertEqual(undefined);
          expect(err.code).assertEqual(15100004);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1601 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1700
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1700
     * @tc.desc   getResultSize(localDeviceId, query: Query, callback: AsyncCallback<int>): void---int = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1700 begin---------  ');
        console.info(TAG + `entries: ${entries}`);

        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSize(localDeviceId, query, (err: BusinessError | null, resultSize: int | undefined) => {
            console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err);
            expect(resultSize).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1700 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1701
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1701
     * @tc.desc   getResultSize(localDeviceId, query: Query, callback: AsyncCallback<int>): void---int = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("no_batch_test");

        kvStore!.getResultSize(localDeviceId, query, (err: BusinessError | null, resultSize: int | undefined) => {

          if (!err) {
            console.error('err is null, but expected an error');
            expect(false).assertTrue();
            done();
            return;
          }

          console.error(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err?.code + err?.message);
          expect(resultSize).assertEqual(undefined);
          expect(err.code).assertEqual(15100004);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1701 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1800
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1800
     * @tc.desc   getResultSize(query: Query): Promise<Entry[]>---int = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1800 begin---------  ');
        console.info(TAG + `entries: ${entries}`);

        await kvStore!.putBatch(entries).catch((err: Error): Promise<void> => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        const query = new factory.Query();
        query.prefixKey("batch_test");

        await (kvStore!.getResultSize(query) as Promise<int>).then((resultSize: int) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1800 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1801
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1801
     * @tc.desc   getResultSize(query: Query): Promise<Entry[]>---int = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1801 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        const query = new factory.Query();
        query.prefixKey("no_batch_test");

        await (kvStore!.getResultSize(query) as Promise<int>).then((resultSize: int) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(undefined);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1801 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(15100004);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1900
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1900
     * @tc.desc   getResultSize(localDeviceId, query: Query): Promise<Entry[]>---int = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1900 begin---------  ');
        console.info(TAG + `entries: ${entries}`);

        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        const query = new factory.Query();
        query.prefixKey("batch_test");

        await (kvStore!.getResultSize(localDeviceId, query) as Promise<int>).then((resultSize: int) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1900 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_1901
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_1901
     * @tc.desc   getResultSize(localDeviceId, query: Query): Promise<Entry[]>---int = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_1901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1901 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        const query = new factory.Query();
        query.prefixKey("no_batch_test");

        await (kvStore!.getResultSize(localDeviceId, query) as Promise<int>).then((resultSize: int) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(undefined);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1901 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(15100004);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2000
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2000
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result != null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2000 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        //kvStore!.putBatch(entries, async (err: BusinessError) => {
        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          kvStore!.getResultSet('batch_test_string_key', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            if (err) {
              console.error(TAG + 'getResultSet failed, err=' + err);
              expect(null).assertFail();
              done();
            }
            // 断言result不为null，否则测试失败
            if (!result) {
              console.error(TAG + 'getResultSet returned undefined result');
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);

            console.info(TAG + 'Succeeded getResultSet, result.getCount()=' + result!.getCount() );
            expect(result != null).assertTrue();

            expect(result!.getCount() == 10).assertTrue();

            kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + 'closeResultSet failed, err=' + err);
                expect(null).assertFail();
                done();
              }
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })

            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2000 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })



    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2001
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2001
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result == null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2001 begin---------  ');

        kvStore!.getResultSet('batch_test_string_key', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          console.info(TAG + 'Succeeded getResultSet, result=' + JSON.stringify(result) + ',err=' + err);
          expect(result != null).assertTrue();

          expect(result!.getCount() == 0).assertTrue();

          kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG + 'closeResultSet failed, err=' + err);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded closeResultSet, err=' + err);
            expect(err == null).assertTrue();
          })

          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2001 end---------  ');
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2100
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2100
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result != null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2100 begin---------  ');
        console.info(TAG + `entries: ${entries}`);

        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);

          kvStore!.getResultSet(localDeviceId, 'batch_test_string_key', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);

            console.info(TAG + 'Succeeded getResultSet, result.getCount()=' + result!.getCount() );
            expect(result != null).assertTrue();

            expect(result!.getCount() == 10).assertTrue();

            kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + 'closeResultSet failed, err=' + err);
                expect(null).assertFail();
                done();
              }
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2100 end---------  ');
            done();
          });
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })



    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2101
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2101
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result == null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2101 begin---------  ');

        kvStore!.getResultSet(localDeviceId, 'batch_test_string_key', (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
          if (err) {
            console.error(TAG + 'getResultSet failed, err=' + err);
            expect(null).assertFail();
            done();
          }
          console.info(TAG + 'Succeeded getResultSet, result=' + JSON.stringify(result) + ',err=' + err);
          expect(result != null).assertTrue();
          if (result != null){
            expect(result!.getCount() == 0).assertTrue();
          }else{
            expect(false).assertTrue();
          }

          kvStore!.closeResultSet(result!, (err: BusinessError | null) => { //tmp
            if (err) {
              console.error(TAG + 'closeResultSet failed, err=' + err);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded closeResultSet, err=' + err);
            expect(err == null).assertTrue();
          })
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2101 end---------  ');
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2200
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2200
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2200 begin---------  ');

        await (kvStore!.putBatch(entries) as Promise<void>);
        await kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);

          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2200 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });



      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2201
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2201
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2201 begin---------  ');

        await (kvStore!.getResultSet('batch_test_string_key') as Promise<factory.KVStoreResultSet>).then(async(result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2201 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2300
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2300
     * @tc.desc   getResultSet(localDeviceId, keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2300 begin---------  ');

        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        //await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
        await (kvStore!.getResultSet(localDeviceId, 'batch_test_string_key') as Promise<factory.KVStoreResultSet>).then(async (result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);
          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2300 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2301
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2301
     * @tc.desc   getResultSet(localDeviceId, keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2301 begin---------  ');
        //await kvStore!.getResultSet(localDeviceId, 'batch_test_string_key').then(async(result: factory.KVStoreResultSet) => {
        await (kvStore!.getResultSet(localDeviceId, 'batch_test_string_key') as Promise<factory.KVStoreResultSet>).then(async(result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2301 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2400
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2400
     * @tc.desc   getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2400 begin---------  ');

        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSet(query, (err: BusinessError<void>|null, result: factory.KVStoreResultSet|undefined) => {
            if (err) {
              console.error(TAG + 'getResultSet failed, err=' + err);
              expect(null).assertFail();
              done();
            }
            // 断言result不为null，否则测试失败
            if (!result) {
              console.error(TAG + 'getResultSet returned undefined result');
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            expect(result != null).assertTrue();

            expect(result!.getCount()).assertEqual(10);

            kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + 'closeResultSet failed, err=' + err);
                expect(null).assertFail();
                done();
              }
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2400 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2401
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2401
     * @tc.desc   getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2401 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        //kvStore!.getResultSet(query, async (err: BusinessError, result: factory.KVStoreResultSet) => {
        kvStore!.getResultSet(query, (err: BusinessError<void>|null, result: factory.KVStoreResultSet|undefined) => {
          if (err) {
            console.error(TAG + 'getResultSet failed, err=' + err);
            expect(null).assertFail();
            done();
          }
          // 断言result不为null，否则测试失败
          if (!result) {
            console.error(TAG + 'getResultSet returned undefined result');
            expect(null).assertFail();
            done();
          }
          console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
          expect(result != null).assertTrue();

          expect(result!.getCount()).assertEqual(0);

          kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG + 'closeResultSet failed, err=' + err);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded closeResultSet, err=' + err);
            expect(err == null).assertTrue();
          })
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2401 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2500
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2500
     * @tc.desc   getResultSet(localDeviceId, query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2500 begin---------  ');
        //kvStore!.putBatch(entries, async (err: BusinessError | null) => {
        kvStore!.putBatch(entries, (err: BusinessError | null) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          //kvStore!.getResultSet(localDeviceId, query, async (err: BusinessError, result: factory.KVStoreResultSet) => {
          kvStore!.getResultSet(localDeviceId, query, (err: BusinessError<void>|null, result: factory.KVStoreResultSet|undefined) => {
            if (err) {
              console.error(TAG + 'getResultSet failed, err=' + err);
              expect(null).assertFail();
              done();
            }
            // 断言result不为null，否则测试失败
            if (!result) {
              console.error(TAG + 'getResultSet returned undefined result');
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            expect(result != null).assertTrue();
            expect(result!.getCount()).assertEqual(10);

            kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + 'closeResultSet failed, err=' + err);
                expect(null).assertFail();
                done();
              }
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })
            console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2500 end---------  ');
            done();
          });

        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2501
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2501
     * @tc.desc   getResultSet(localDeviceId, query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2501 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        //kvStore!.getResultSet(localDeviceId, query, async (err: BusinessError, result: factory.KVStoreResultSet) => {
        kvStore!.getResultSet(localDeviceId, query, (err: BusinessError<void>|null, result: factory.KVStoreResultSet|undefined) => {
          if (err) {
            console.error(TAG + `getResultSet failed, code: ${err.code}, message: ${err.message}`);
            expect(null).assertFail();
            done();
            return;
          }

          if (!result) {
            console.error(TAG + 'getResultSet returned undefined result');
            expect(null).assertFail();
            done();
            return;
          }
          console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);

          kvStore!.closeResultSet(result, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG + 'closeResultSet failed, err=' + err);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded closeResultSet, err=' + err);
            expect(err == null).assertTrue();
          })
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2501 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2600
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2600
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2600 begin---------  ');
        //await kvStore!.putBatch(entries)
        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getResultSet(query).then(async(result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);
          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2600 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2601
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2601
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2601 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getResultSet(query).then(async(result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2601 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e ) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2700
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2700
     * @tc.desc   getResultSet(localDeviceId, query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2700 begin---------  ');
        //await kvStore!.putBatch(entries)
        await kvStore!.putBatch(entries).catch((err: Error) => {
          console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getResultSet(localDeviceId, query).then(async(result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);
          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2700 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_DKV_ReturnValue_2701
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueTest_2701
     * @tc.desc   getResultSet(localDeviceId, query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_ReturnValue_2701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore!.getResultSet(localDeviceId, query).then(async(result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore!.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2701 end---------  ');
          done();
        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })
    console.info(TAG + '-------------------describe KvStoreReturnValue  end-------------------');
  })
}