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
import factory from '@ohos.data.distributedData';

const TAG = "[testtag >>>>>> ]"

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'DeviceKvStoreReturnValueDisDataId';
let kvManager = null;
let kvStore = null;
let localDeviceId = '';
let entries = [];

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

const config  = {
  bundleName : TEST_BUNDLE_NAME,
  userInfo : {
    userId : '0',
    userType : factory.UserType.SAME_USER_ID
  }
}

export default function DeviceKvStoreReturnValueDisData(){
  describe('DeviceKvStoreReturnValueDisData', () => {
    const options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done) => {
      kvManager = await factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);

      await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
        kvStore = store;
        console.info(TAG + 'beforeAll getKVStore for getKVStore success');
      }).catch((err) => {
        console.error(TAG + 'beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      let getDeviceId = new Promise((resolve, reject) => {
        kvStore.on('dataChange', 0, (data) => {
          console.info(TAG + 'beforeAll on data change: ' + JSON.stringify(data));
          console.info(TAG + 'beforeAll on data.deviceId=' + JSON.stringify(data.deviceId));
          resolve(data.deviceId);
        });
        kvStore.put("getDeviceId", "byPut").then((data) => {
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
      }).catch((error) => {
        console.error(TAG + 'beforeAll can NOT getDeviceId, fail: ' +
          `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      await sleep(3000);
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
      await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
      kvStore = null;
      console.info(TAG + 'beforeAll end');
      await sleep(2000);

      for (let i = 0; i < 10; i++) {
        let key = 'batch_test_string_key';
        let entry = {
          key: key + i,
          value: {
            type: factory.ValueType.STRING,
            value: 'batch_test_string_value'
          }
        }
        entries.push(entry);
      }
      console.info(TAG + `entries: ${entries}`);

      done();

    });

    beforeEach(async (done) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
      }).catch((err) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      done();
    });
    afterEach(async (done) =>  {
      console.info(TAG + 'afterEach');

      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(() => {
        console.info(TAG + ' afterEach Succeeded closeKVStore');
        kvStore = null;
      }).catch((err) => {
        console.error(TAG + `afterEach Failed closeKVStore.code is ${err.code},message is ${err.message}`);
      });

      await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded deleteKVStore');
        done();
      }).catch((err) => {
        console.error(TAG + `afterEach Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
        done();
      });

    });

    afterAll(async (done) => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0100
     * @tc.name SUB_DDM_DKV_ReturnValue_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string, callback: AsyncCallback<string[]>): void
     * data.length = 1
     */
    it('SUB_DDM_DKV_ReturnValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0100 begin---------  ');
        kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, (err, data) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) + ',err=' + err);
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(1);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0101
     * @tc.name SUB_DDM_DKV_ReturnValue_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string, callback: AsyncCallback<string[]>): void
     * data.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0101 begin---------  ');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

        kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, (err, data) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) + ',err=' + err);
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(0);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0200
     * @tc.name SUB_DDM_DKV_ReturnValue_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string): Promise<string[]>
     * data.length = 1
     */
    it('SUB_DDM_DKV_ReturnValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0200 begin---------  ');
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) );
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(1);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0200 end--------- ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0201
     * @tc.name SUB_DDM_DKV_ReturnValue_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getAllKVStoreId(appId: string): Promise<string[]>
     * data.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0201 begin---------  ');

        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
          console.info(TAG + 'Succeeded getAllKVStoreId, data.length=' + JSON.stringify(data.length) );
          expect(data != null).assertTrue();
          expect(data.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0201 end--------- ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0500
     * @tc.name SUB_DDM_DKV_ReturnValue_0500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0500 begin---------  ');
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);

        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          kvStore.getEntries(localDeviceId, 'batch_test_string_key', (err, entries) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0501
     * @tc.name SUB_DDM_DKV_ReturnValue_0501
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0501 begin---------  ');
        kvStore.getEntries(localDeviceId, 'batch_test_string_key', (err, entries) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0600
     * @tc.name SUB_DDM_DKV_ReturnValue_0600
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0600 begin---------  ');
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }

        await kvStore.putBatch(entries);

        await kvStore.getEntries(localDeviceId, 'batch_test_string_key').then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0600 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0601
     * @tc.name SUB_DDM_DKV_ReturnValue_0601
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0601 begin---------  ');

        await kvStore.getEntries(localDeviceId, 'batch_test_string_key').then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0601 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0700
     * @tc.name SUB_DDM_DKV_ReturnValue_0700
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0700 begin---------  ');
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);

        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore.getEntries(query, (err, entries) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0701
     * @tc.name SUB_DDM_DKV_ReturnValue_0701
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getEntries(query, (err, entries) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0800
     * @tc.name SUB_DDM_DKV_ReturnValue_0800
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query): Promise<Entry[]>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0800 begin---------  ');
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }

        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getEntries(query).then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0800 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0801
     * @tc.name SUB_DDM_DKV_ReturnValue_0801
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query): Promise<Entry[]>
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0801 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getEntries(query).then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0801 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0900
     * @tc.name SUB_DDM_DKV_ReturnValue_0900
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0900 begin---------  ');
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);

        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore.getEntries(localDeviceId, query, (err, entries) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_0901
     * @tc.name SUB_DDM_DKV_ReturnValue_0901
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0901 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getEntries(localDeviceId, query, (err, entries) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1000
     * @tc.name SUB_DDM_DKV_ReturnValue_1000
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1000 begin---------  ');
        let entries = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }

        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getEntries(localDeviceId, query).then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1000 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1001
     * @tc.name SUB_DDM_DKV_ReturnValue_1001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(deviceId: string, query: Query): Promise<Entry[]>
     * Entry.length = 0
     */
    it('SUB_DDM_DKV_ReturnValue_1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1001 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getEntries(localDeviceId, query).then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1001 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1300
     * @tc.name SUB_DDM_DKV_ReturnValue_1300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId:string, key:string, callback:AsyncCallback<boolean|string| number|Uint8Array>):void--true
     */
    it('SUB_DDM_DKV_ReturnValue_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1300 begin---------  ');
        kvStore.put(KEY_TEST_BOOL_ELEMENT, true, (err) => {
          console.info(TAG + "Succeeded in putting");
          kvStore.get(localDeviceId, KEY_TEST_BOOL_ELEMENT, (err, data) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1301
     * @tc.name SUB_DDM_DKV_ReturnValue_1301
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId:string, key:string, callback:AsyncCallback<boolean|string| number|Uint8Array>)---false
     */
    it('SUB_DDM_DKV_ReturnValue_1301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1301 begin---------  ');
        kvStore.put(KEY_TEST_BOOL_ELEMENT, false, (err) => {
          console.info(TAG + "Succeeded in putting");
          kvStore.get(localDeviceId, KEY_TEST_BOOL_ELEMENT, (err, data) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1400
     * @tc.name SUB_DDM_DKV_ReturnValue_1400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string): Promise<boolean | string | number | Uint8Array>---true
     */
    it('SUB_DDM_DKV_ReturnValue_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1400 begin---------  ');
        await kvStore.put(KEY_TEST_BOOL_ELEMENT, true);
        await kvStore.get(localDeviceId, KEY_TEST_BOOL_ELEMENT).then((data) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(true);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1400 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1401
     * @tc.name SUB_DDM_DKV_ReturnValue_1401
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(deviceId: string, key: string): Promise<boolean | string | number | Uint8Array>---false
     */
    it('SUB_DDM_DKV_ReturnValue_1401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1401 begin---------  ');
        await kvStore.put(KEY_TEST_BOOL_ELEMENT, false);
        await kvStore.get(localDeviceId, KEY_TEST_BOOL_ELEMENT).then((data) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(false);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1401 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1500
     * @tc.name SUB_DDM_DKV_ReturnValue_1500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc FieldNode.appendChild(child: FieldNode): boolean---true
     */
    it('SUB_DDM_DKV_ReturnValue_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1500 begin---------  ');
        let node = new factory.FieldNode("root");
        let child = new factory.FieldNode("child");
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1501
     * @tc.name SUB_DDM_DKV_ReturnValue_1501
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc FieldNode.appendChild(child: FieldNode): boolean---false
     */
    it('SUB_DDM_DKV_ReturnValue_1501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1501 begin---------  ');
        let node = new factory.FieldNode("root");
        let res1 = node.appendChild(null);
        console.info(TAG + ' try appendChild res1=' + res1);
        expect(res1).assertEqual(false);
        node = null;
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1501 end---------  ');
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1600
     * @tc.name   SUB_DDM_DKV_ReturnValue_1600
     * @tc.type   FUNC
     * @tc.size   MediumTest
     * @tc.level  Level 2
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<number>): void---number = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1600 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore.getResultSize(query, (err, resultSize) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1601
     * @tc.name   SUB_DDM_DKV_ReturnValue_1601
     * @tc.type   FUNC
     * @tc.size   MediumTest
     * @tc.level  Level 2
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<number>): void---number = 0
     */
    it('SUB_DDM_DKV_ReturnValue_1601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1601 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getResultSize(query, (err, resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err.code + err.message);
          expect(resultSize).assertEqual(undefined);
          expect(err != undefined).assertTrue();
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1700
     * @tc.name   SUB_DDM_DKV_ReturnValue_1700
     * @tc.type   FUNC
     * @tc.size   MediumTest
     * @tc.level  Level 2
     * @tc.desc   getResultSize(localDeviceId, query: Query, callback: AsyncCallback<number>): void---number = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1700 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore.getResultSize(localDeviceId, query, (err, resultSize) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1701
     * @tc.name   SUB_DDM_DKV_ReturnValue_1701
     * @tc.type   FUNC
     * @tc.size   MediumTest
     * @tc.level  Level 2
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<number>): void---number = 0
     */
    it('SUB_DDM_DKV_ReturnValue_1701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getResultSize(localDeviceId, query, (err, resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err.code + err.message);
          expect(resultSize).assertEqual(undefined);
          expect(err != undefined).assertTrue();
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1800
     * @tc.name SUB_DDM_DKV_ReturnValue_1800
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(query: Query): Promise<Entry[]>---number = 10
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1800 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSize(query).then((resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1800 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1801
     * @tc.name SUB_DDM_DKV_ReturnValue_1801
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(query: Query): Promise<Entry[]>---number = 0
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1801 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSize(query).then((resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(undefined);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1801 end---------  ');
          done();
        }).catch((err) => {
          console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
          expect(err != undefined).assertTrue();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1900
     * @tc.name SUB_DDM_DKV_ReturnValue_1900
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(localDeviceId, query: Query): Promise<Entry[]>---number = 10
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1900 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSize(localDeviceId, query).then((resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1900 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_1901
     * @tc.name SUB_DDM_DKV_ReturnValue_1901
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(localDeviceId, query: Query): Promise<Entry[]>---number = 0
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_1901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1901 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSize(localDeviceId, query).then((resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(undefined);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_1901 end---------  ');
          done();
        }).catch((err) => {
          console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
          expect(err != undefined).assertTrue();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2100
     * @tc.name   SUB_DDM_DKV_ReturnValue_2100
     * @tc.type   FUNC
     * @tc.size   MediumTest
     * @tc.level  Level 2
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result != null
     */
    it('SUB_DDM_DKV_ReturnValue_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2100 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          kvStore.getResultSet(localDeviceId, 'batch_test_string_key', (err, result) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            console.info(TAG + 'Succeeded getResultSet, result.getCount()=' + result.getCount() );
            expect(result != null).assertTrue();
            expect(result.getCount() == 10).assertTrue();

            kvStore.closeResultSet(result, (err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2101
     * @tc.name   SUB_DDM_DKV_ReturnValue_2101
     * @tc.type   FUNC
     * @tc.size   MediumTest
     * @tc.level  Level 2
     * @tc.desc   getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result == null
     */
    it('SUB_DDM_DKV_ReturnValue_2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2101 begin---------  ');
        kvStore.getResultSet(localDeviceId, 'batch_test_string_key', (err, result) => {
          console.info(TAG + 'Succeeded getResultSet, result=' + JSON.stringify(result) + ',err=' + err);
          expect(result != null).assertTrue();
          expect(result.getCount() == 0).assertTrue();

          kvStore.closeResultSet(result, (err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2300
     * @tc.name SUB_DDM_DKV_ReturnValue_2300
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(localDeviceId, keyPrefix: string): Promise<KVStoreResultSet>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2300 begin---------  ');
        await kvStore.putBatch(entries);
        await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then(async (result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2300 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2301
     * @tc.name SUB_DDM_DKV_ReturnValue_2301
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(localDeviceId, keyPrefix: string): Promise<KVStoreResultSet>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2301 begin---------  ');
        await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2301 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2400
     * @tc.name SUB_DDM_DKV_ReturnValue_2400
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2400 begin---------  ');
        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore.getResultSet(query, async (err, result) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            expect(result != null).assertTrue();
            expect(result.getCount()).assertEqual(10);
            kvStore.closeResultSet(result, (err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2401
     * @tc.name SUB_DDM_DKV_ReturnValue_2401
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2401 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getResultSet(query, async (err, result) => {
          console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          kvStore.closeResultSet(result, (err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2500
     * @tc.name SUB_DDM_DKV_ReturnValue_2500
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(localDeviceId, query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2500 begin---------  ');
        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore.getResultSet(localDeviceId, query, async (err, result) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            expect(result != null).assertTrue();
            expect(result.getCount()).assertEqual(10);
            kvStore.closeResultSet(result, (err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2501
     * @tc.name SUB_DDM_DKV_ReturnValue_2501
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(localDeviceId, query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2501 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getResultSet(localDeviceId, query, async (err, result) => {
          console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          kvStore.closeResultSet(result, (err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2600
     * @tc.name SUB_DDM_DKV_ReturnValue_2600
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query): Promise<KVStoreResultSet>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2600 begin---------  ');
        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSet(query).then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2600 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2601
     * @tc.name SUB_DDM_DKV_ReturnValue_2601
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query): Promise<KVStoreResultSet>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2601 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSet(query).then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2601 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2700
     * @tc.name SUB_DDM_DKV_ReturnValue_2700
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(localDeviceId, query: Query): Promise<KVStoreResultSet>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2700 begin---------  ');
        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSet(localDeviceId, query).then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2700 end---------  ');
          done();
        }).catch((err) => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKvReturnValueDisDataTest_2701
     * @tc.name SUB_DDM_DKV_ReturnValue_2701
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(localDeviceId, query: Query): Promise<KVStoreResultSet>
     * Entry.length = 10
     */
    it('SUB_DDM_DKV_ReturnValue_2701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSet(localDeviceId, query).then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_2701 end---------  ');
          done();
        }).catch((err) => {
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