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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from "@ohos/hypium";
import factory from '@ohos.data.distributedData';

const TAG = "[testtag >>>>>> ]"
const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'SingleKvStoreReturnValueDisDataId';
let kvManager = null;
let kvStore = null;
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

export default function SingleKvStoreReturnValueDisData(){
  describe('SingleKvStoreReturnValueDisData', () => {
    const options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done) => {
      kvManager = await factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
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
      console.info(TAG + 'beforeAll end');
      done();

    });

    beforeEach(async (done) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
        done();
      }).catch((err) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

    });
    afterEach(async (done) =>  {
      console.info(TAG + 'afterEach');
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info('afterEach deleteKVStore success');
            kvStore = null;
            done();
        }).catch((err) => {
            console.info('afterEach deleteKVStore err ' + err);
            done();
        });
      }).catch((err) => {
          console.info('afterEach closeKVStore err ' + err);
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0300
     * @tc.desc   getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0300 begin---------  ');
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
          kvStore.getEntries('batch_test_string_key', (err, entries) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0300 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_0301
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0301
     * @tc.desc   getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0301 begin---------  ');
        kvStore.getEntries('batch_test_string_key', (err, entries) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0301 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0400
     * @tc.desc   getEntries(keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0400 begin---------  ');
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

        await kvStore.getEntries('batch_test_string_key').then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0400 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_0401
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0401
     * @tc.desc   getEntries(keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0401 begin---------  ');

        await kvStore.getEntries('batch_test_string_key').then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0401 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0700
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0700 begin---------  ');
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
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0700 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_0701
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0701
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0701 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getEntries(query, (err, entries) => {
          console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries.length) + ',err=' + err);
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0701 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0800
     * @tc.desc   getEntries(query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0800 begin---------  ');
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
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0800 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_0801
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_0801
     * @tc.desc   getEntries(query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0801 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getEntries(query).then((entries) => {
          console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
          expect(entries != null).assertTrue();
          expect(entries.length).assertEqual(0);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0801 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_1100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1100
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1100 begin---------  ');
        kvStore.put(KEY_TEST_BOOL_ELEMENT, true, (err) => {
          console.info(TAG + "Succeeded in putting");
          kvStore.get(KEY_TEST_BOOL_ELEMENT, (err, data) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(true);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1100 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_1101
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1101
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1101 begin---------  ');
        kvStore.put(KEY_TEST_BOOL_ELEMENT, false, (err) => {
          console.info(TAG + "Succeeded in putting");
          kvStore.get(KEY_TEST_BOOL_ELEMENT, (err, data) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(false);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1101 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_1200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1200
     * @tc.desc   get(key: string): Promise<boolean | string | number | Uint8Array>---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1200 begin---------  ');
        await kvStore.put(KEY_TEST_BOOL_ELEMENT, true);
        await kvStore.get(KEY_TEST_BOOL_ELEMENT).then((data) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(true);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1200 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_1201
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1201
     * @tc.desc   get(key: string): Promise<boolean | string | number | Uint8Array>---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1201 begin---------  ');
        await kvStore.put(KEY_TEST_BOOL_ELEMENT, false);
        await kvStore.get(KEY_TEST_BOOL_ELEMENT).then((data) => {
          console.info(TAG + `Succeeded in getting data=${data}`);
          expect(data).assertEqual(false);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1201 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_1600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1600
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<number>): void---number = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1600 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore.getResultSize(query, (err, resultSize) => {
            console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err);
            expect(resultSize).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1600 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_1601
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1601
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<number>): void---number = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1601 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore.getResultSize(query, (err, resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err.code + err.message);
          expect(resultSize).assertEqual(undefined);
          expect(err.message != undefined).assertTrue();
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1601 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1800
     * @tc.desc   getResultSize(query: Query): Promise<Entry[]>---number = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1800 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSize(query).then((resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(10);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1800 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_1801
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_1801
     * @tc.desc   getResultSize(query: Query): Promise<Entry[]>---number = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1801 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSize(query).then((resultSize) => {
          console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
          expect(resultSize).assertEqual(undefined);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1801 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_2000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2000
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result != null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2000 begin---------  ');
        console.info(TAG + `entries: ${entries}`);
        kvStore.putBatch(entries, async (err) => {
          console.info(TAG + 'Succeeded putBatch, err=' + err);
          kvStore.getResultSet('batch_test_string_key', (err, result) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            console.info(TAG + 'Succeeded getResultSet, result.getCount()=' + result.getCount() );
            expect(result != null).assertTrue();
            expect(result.getCount() == 10).assertTrue();

            kvStore.closeResultSet(result, (err) => {
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })

            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2000 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_2001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2001
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result == null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2001 begin---------  ');
        kvStore.getResultSet('batch_test_string_key', (err, result) => {
          console.info(TAG + 'Succeeded getResultSet, result=' + JSON.stringify(result) + ',err=' + err);
          expect(result != null).assertTrue();
          expect(result.getCount() == 0).assertTrue();

          kvStore.closeResultSet(result, (err) => {
            console.info(TAG + 'Succeeded closeResultSet, err=' + err);
            expect(err == null).assertTrue();
          })

          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2001 end---------  ');
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2200
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2200 begin---------  ');
        await kvStore.putBatch(entries);
        await kvStore.getResultSet('batch_test_string_key').then(async (result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);

          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2200 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_2201
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2201
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2201 begin---------  ');
        await kvStore.getResultSet('batch_test_string_key').then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2201 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_2400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2400
     * @tc.desc   getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2400 begin---------  ');
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
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2400 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_2401
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2401
     * @tc.desc   getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2401 begin---------  ');
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
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2401 end---------  ');
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2600
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2600 begin---------  ');
        await kvStore.putBatch(entries);
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSet(query).then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(10);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2600 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_2601
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_2601
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2601 begin---------  ');
        const query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore.getResultSet(query).then(async(result) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          expect(result != null).assertTrue();
          expect(result.getCount()).assertEqual(0);
          await kvStore.closeResultSet(result);
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2601 end---------  ');
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0100
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0100 begin---------  ');
        const optionsS1 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S1,
        };
        const TEST_STORE_S1_ID = 'DataChangeStoreS1Id';

        let kvStoreS1 = await kvManager.getKVStore(TEST_STORE_S1_ID, optionsS1);

        await kvStoreS1.getSecurityLevel(async(err, data) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S1);

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID, kvStoreS1).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S1');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(async() => {
              console.info(TAG + '  Succeeded deleteKVStore S1');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0100 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S1 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0101
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0101
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0101 begin---------  ');
        const optionsS2 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        const TEST_STORE_S2_ID = 'DataChangeStoreS2Id';

        let kvStoreS2 = await kvManager.getKVStore(TEST_STORE_S2_ID, optionsS2);

        await kvStoreS2.getSecurityLevel(async(err, data) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S2);

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID, kvStoreS2).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S2');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(async() => {
              console.info(TAG + '  Succeeded deleteKVStore S2');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0101 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S2 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S2 .code is ${err.code},message is ${err.message}`);
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0102
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0102
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0102 begin---------  ');
        const optionsS3 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S3,
        };
        const TEST_STORE_S3_ID = 'DataChangeStoreS3Id';

        let kvStoreS3 = await kvManager.getKVStore(TEST_STORE_S3_ID, optionsS3);

        await kvStoreS3.getSecurityLevel(async(err, data) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S3);
          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID, kvStoreS3).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S3');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
              console.info(TAG + '  Succeeded deleteKVStore S3');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0102 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S3 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S3 .code is ${err.code},message is ${err.message}`);
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0103
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0103
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0103 begin---------  ');
        const optionsS4 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S4,
        };
        const TEST_STORE_S4_ID = 'DataChangeStoreS4Id';

        let kvStoreS4 = await kvManager.getKVStore(TEST_STORE_S4_ID, optionsS4);

        await kvStoreS4.getSecurityLevel(async(err, data) => {
          console.info(TAG + 'Succeeded getSecurityLevel S4, data.=' + JSON.stringify(data) + ',err=' + err);
          expect(data).assertEqual(factory.SecurityLevel.S4);

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID, kvStoreS4).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S4');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
              console.info(TAG + '  Succeeded deleteKVStore S4');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0103 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S4 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S4 .code is ${err.code},message is ${err.message}`);
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
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0200
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0200 begin---------  ');
        const optionsS1 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S1,
        };
        const TEST_STORE_S1_ID = 'DataChangeStoreS1Id';

        let kvStoreS1 = await kvManager.getKVStore(TEST_STORE_S1_ID, optionsS1);

        await kvStoreS1.getSecurityLevel().then(async(data) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S1);

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID, kvStoreS1).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S1');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(() => {
              console.info(TAG + '  Succeeded deleteKVStore S1');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0200 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S1 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
            done();
          });
        }).catch((err) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0201
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0201
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0201 begin---------  ');
        const optionsS2 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        const TEST_STORE_S2_ID = 'DataChangeStoreS2Id';

        let kvStoreS2 = await kvManager.getKVStore(TEST_STORE_S2_ID, optionsS2);

        await kvStoreS2.getSecurityLevel().then(async(data) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S2);

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID, kvStoreS2).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S2');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
              console.info(TAG + '  Succeeded deleteKVStore S2');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0201 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S2 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S2 .code is ${err.code},message is ${err.message}`);
            done();
          });
        }).catch((err) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0202
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0202
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0202 begin---------  ');
        const optionsS3 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S3,
        };
        const TEST_STORE_S3_ID = 'DataChangeStoreS3Id';

        let kvStoreS3 = await kvManager.getKVStore(TEST_STORE_S3_ID, optionsS3);

        await kvStoreS3.getSecurityLevel().then(async(data) => {
          console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S3);

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID, kvStoreS3).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S3');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
              console.info(TAG + '  Succeeded deleteKVStore S3');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0202 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S3 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S3 .code is ${err.code},message is ${err.message}`);
            done();
          });
        }).catch((err) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0203
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueDisDataTest_SL_0203
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0203 begin---------  ');
        const optionsS4 = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S4,
        };
        const TEST_STORE_S4_ID = 'DataChangeStoreS4Id';

        let kvStoreS4 = await kvManager.getKVStore(TEST_STORE_S4_ID, optionsS4);

        await kvStoreS4.getSecurityLevel().then(async(data) => {
          console.info(TAG + 'Succeeded getSecurityLevel S4, data.=' + JSON.stringify(data) );
          expect(data).assertEqual(factory.SecurityLevel.S4);

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID, kvStoreS4).then(async() => {
            console.info(TAG + '  Succeeded closeKVStore S4');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
              console.info(TAG + '  Succeeded deleteKVStore S4');
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0203 end--------- ');
              done();
            }).catch((err) => {
              console.error(TAG + ` Failed deleteKVStore S4 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err) => {
            console.error(TAG + ` Failed closeKVStore S4 .code is ${err.code},message is ${err.message}`);
            done();
          });
        }).catch((err) => {
          console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })




    console.info(TAG + '-------------------describe SingleKvStoreReturnValue  end-------------------');
  })
}