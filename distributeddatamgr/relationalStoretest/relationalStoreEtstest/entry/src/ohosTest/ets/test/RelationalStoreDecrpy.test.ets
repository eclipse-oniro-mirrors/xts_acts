/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import data_relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';

const TAG = "[RELATIONAL_STORE_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
  + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"




let context: common.UIAbilityContext;
let rdbStore: data_relationalStore.RdbStore | undefined = undefined;

let u8 = new Uint8Array([1, 2])
const valueBucket1 : data_relationalStore.ValuesBucket = {
  "name": "zhangsan",
  "age": 18,
  "salary": 100.5,
  "blobType": u8,
}
const valueBucket2 : data_relationalStore.ValuesBucket = {
  "name": "lisi",
  "age": 28,
  "salary": 100.5,
  "blobType": u8,
}
const valueBucket3 : data_relationalStore.ValuesBucket = {
  "name": "zhoubiao",
  "age": 28,
  "salary": 100.5,
  "blobType": u8,
}
export default function rdbDecryptTest() {
  describe('rdbDecryptTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    });

    beforeEach(async ()  => {
      console.info(TAG + 'beforeEach');
    });

    afterEach(async ()  => {
      console.info(TAG + 'afterEach');
    });

    afterAll(async () => {
      console.info(TAG + 'afterAll');
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0100
     * @tc.name default params
     * @tc.desc default params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0100', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0100 start *************");
      let default_config : data_relationalStore.StoreConfig = {
        name: "default.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        }
      }
      console.log(TAG+default_config.cryptoParam?.encryptionAlgo+default_config.cryptoParam?.hmacAlgo+default_config.cryptoParam?.kdfAlgo+default_config.cryptoParam?.iterationCount)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, default_config)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        rdbStore = await data_relationalStore.getRdbStore(context, default_config)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet2.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "default.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0100 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0200
     * @tc.name default params getrdbstore,open rdbstore
     * @tc.desc default params getrdbstore,open rdbstore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0200', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0200 start *************");
      let default_config : data_relationalStore.StoreConfig = {
        name: "default.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, default_config)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
      }
      try {
        let STORE_CONFIG_DEFAULT : data_relationalStore.StoreConfig = {
          name: "default.db",
          securityLevel: data_relationalStore.SecurityLevel.S1,
          encrypt: true,
          cryptoParam: {
            encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6, 7]),
            iterationCount: 10000,
            encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
            hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
            kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
            cryptoPageSize: 1024
          }
        }
        console.log(TAG+default_config.cryptoParam?.encryptionAlgo+default_config.cryptoParam?.hmacAlgo+default_config.cryptoParam?.kdfAlgo+default_config.cryptoParam?.iterationCount)
        let rdbStore2: data_relationalStore.RdbStore | undefined = undefined;
        rdbStore2 = await data_relationalStore.getRdbStore(context, STORE_CONFIG_DEFAULT)
        let resultSet = await rdbStore2.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet2.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "default.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.error(TAG + `Query rdbStore failed, error code: ${err.code}, err message: ${err.message}`);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0200 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0300
     * @tc.name nodefault params1
     * @tc.desc encryptionAlgo is data_relationalStore.EncryptionAlgo.AES_256_GCM
     hmacAlgo is data_relationalStore.HmacAlgo.SHA512
     kdfAlgo is data_relationalStore.KdfAlgo.KDF_SHA512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0300', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0300 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 2048
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(0)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(2)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(2)

      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }

      console.log(TAG + "************* rdbDecryptTest0300 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0400
     * @tc.name nodefault params2
     * @tc.desc encryptionAlgo is data_relationalStore.EncryptionAlgo.AES_256_CBC
     hmacAlgo is data_relationalStore.HmacAlgo.SHA1
     kdfAlgo is data_relationalStore.KdfAlgo.KDF_SHA1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0400', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0400 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
          cryptoPageSize: 2048
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(0)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(0)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0400 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0500
     * @tc.name nodefault params3
     * @tc.desc iterationCount is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0500', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0500 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 0,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
          cryptoPageSize: 2048
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0500 end *************");
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0600
     * @tc.name nodefault params4
     * @tc.desc encryptionAlgo is data_relationalStore.EncryptionAlgo.AES_256_GCM
     hmacAlgo is data_relationalStore.HmacAlgo.SHA256
     kdfAlgo is data_relationalStore.KdfAlgo.KDF_SHA1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0600', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0600 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 10001,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
          cryptoPageSize: 2048
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(0)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(0)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0600 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0700
     * @tc.name nodefault params5
     * @tc.desc encryptionKey is new Uint8Array([])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0700', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0700 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([]),
          iterationCount: 9999,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 2048
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(0)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(2)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0700 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0800
     * @tc.name nodefault params6
     * @tc.desc encryptionAlgo is data_relationalStore.EncryptionAlgo.AES_256_CBC
     hmacAlgo is data_relationalStore.HmacAlgo.SHA256
     kdfAlgo is data_relationalStore.KdfAlgo.KDF_SHA256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0800', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0800 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize: 2048
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(1)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0800 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_0900
     * @tc.name nodefault params6
     * @tc.desc cryptoPageSize is 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest0900', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest0900 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
          cryptoPageSize: 2048
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(0)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest0900 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1000
     * @tc.name nodefault params7
     * @tc.desc params is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest1000', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1000 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount:undefined,
          encryptionAlgo: undefined,
          hmacAlgo: undefined,
          kdfAlgo: undefined,
          cryptoPageSize: undefined
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1000 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1100
     * @tc.name nodefault params8
     * @tc.desc encryptionAlgo hmacAlgo kdfAlgo cryptoPageSize is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest1100', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1100 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount:6.7,
          encryptionAlgo: undefined,
          hmacAlgo: undefined,
          kdfAlgo: undefined,
          cryptoPageSize: undefined
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1100 end *************");
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1200
     * @tc.name nodefault params9
     * @tc.desc cryptoPageSize is 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest1200', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1200 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 1024
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(2)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore1:"+rdbStore)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        console.log(TAG+"rdbstore2:"+rdbStore)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore3:"+rdbStore)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1200 end *************");
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1300
     * @tc.name nodefault params10
     * @tc.desc cryptoPageSize is 4096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest1300', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1300 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: 1,
          hmacAlgo: 1,
          kdfAlgo: 1,
          cryptoPageSize: 4096
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(data_relationalStore.EncryptionAlgo.AES_256_CBC)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(data_relationalStore.HmacAlgo.SHA256)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(data_relationalStore.KdfAlgo.KDF_SHA256)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore1:"+rdbStore)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        console.log(TAG+"rdbstore2:"+rdbStore)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore3:"+rdbStore)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1300 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1400
     * @tc.name nodefault params11
     * @tc.desc cryptoPageSize is 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest1400', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1400 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 65536
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(0)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(2)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore1:"+rdbStore)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        console.log(TAG+"rdbstore2:"+rdbStore)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore3:"+rdbStore)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1400 end *************");
    })



    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1500
     * @tc.name nodefault params12
     * @tc.desc cryptoPageSize is 65536.7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest1500', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1500 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "nodefault.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: 1,
          hmacAlgo: 1,
          kdfAlgo: 1,
          cryptoPageSize: 65536.7
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(data_relationalStore.EncryptionAlgo.AES_256_CBC)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(data_relationalStore.HmacAlgo.SHA256)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(data_relationalStore.KdfAlgo.KDF_SHA256)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore1:"+rdbStore)
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        await rdbStore.insert("test", valueBucket1)
        await rdbStore.insert("test", valueBucket2)
        console.log(TAG + "insert success")
        console.log(TAG+"rdbstore2:"+rdbStore)
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        console.log(TAG+"rdbstore3:"+rdbStore)
        let resultSet = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "nodefault.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1500 end *************");
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1600
     * @tc.name invaild params1
     * @tc.desc  encryptionAlgo is data_relationalStore.EncryptionAlgo.AES_256_CBC+1
     hmacAlgo is data_relationalStore.HmacAlgo.SHA256+1
     kdfAlgo is data_relationalStore.KdfAlgo.KDF_SHA256+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest1600', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1600 start *************");
      const STORE_CONFIG_INVALID_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invalid.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC+1,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256+1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256+1,
          cryptoPageSize: 1024
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_INVALID_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1600 end *************");
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1700
     * @tc.name invaild params2
     * @tc.desc iterationCount is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest1700', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1700 start *************");
      const STORE_CONFIG_INVALID_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount:-1,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize: 2048
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_INVALID_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1700 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1800
     * @tc.name invaild params3
     * @tc.desc cryptoPageSize is 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest1800', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1800 start *************");
      const STORE_CONFIG_INVALID_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount:34.4,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize: 511
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_INVALID_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1800 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_1900
     * @tc.name invaild params4
     * @tc.desc cryptoPageSize is 65537
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest1900', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest1900 start *************");
      const STORE_CONFIG_INVALID_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount:34.4,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize: 65537
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_INVALID_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest1900 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2000
     * @tc.name invaild params5
     * @tc.desc cryptoPageSize is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest2000', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2000 start *************");
      const STORE_CONFIG_INVALID_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount:34.4,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA256,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize: 1
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_INVALID_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2000 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2100
     * @tc.name invaild params6
     * @tc.desc encryptionAlgo is 4,hmacAlgo is 5,kdfAlgo is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest2100', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2100 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: 4,
          hmacAlgo: 5,
          kdfAlgo: 6,
          cryptoPageSize: 65536.7
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2100 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2200
     * @tc.name invaild params7
     * @tc.desc params is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest2200', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2200 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: Infinity,
          encryptionAlgo: Infinity,
          hmacAlgo: Infinity,
          kdfAlgo: Infinity,
          cryptoPageSize: Infinity
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2200 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2300
     * @tc.name invaild params8
     * @tc.desc params is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest2300', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2300 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: NaN,
          encryptionAlgo: NaN,
          hmacAlgo: NaN,
          kdfAlgo: NaN,
          cryptoPageSize: NaN
        }
      }
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2300 end *************");
    })


    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2400
     * @tc.name invaild params9
     * @tc.desc cryptoPageSize is 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest2400', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2400 start *************");
      const STORE_CONFIG_NO_DEFAULT  : data_relationalStore.StoreConfig= {
        name: "invaild.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        encrypt: true,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA256,
          cryptoPageSize: 512
        }
      }
      console.log(TAG+STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo+STORE_CONFIG_NO_DEFAULT.cryptoParam?.iterationCount)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.encryptionAlgo).assertEqual(1)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.hmacAlgo).assertEqual(0)
      expect(STORE_CONFIG_NO_DEFAULT.cryptoParam?.kdfAlgo).assertEqual(1)
      try {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG_NO_DEFAULT)
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual("401")
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2400 end *************");
    })
        /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2500
     * @tc.name no encrpy attach encrpy,cryptoParam is default
     * @tc.desc no encrpy attach encrpy,cryptoParam is default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest2500', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2500 start *************");
      let default_config1 : data_relationalStore.StoreConfig = {
        name: "rdbstore1.db",
        encrypt: true,
        securityLevel: data_relationalStore.SecurityLevel.S1,
        cryptoParam: {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        }
      }
      let attachStore: data_relationalStore.RdbStore | undefined = undefined;
      attachStore = await data_relationalStore.getRdbStore(context, default_config1);
      await attachStore.executeSql(CREATE_TABLE_TEST, null)
      await attachStore.insert("test", valueBucket1)
      await attachStore.insert("test", valueBucket2)
      await attachStore.close()
      let default_config2 : data_relationalStore.StoreConfig = {
        name: "rdbstore2.db",
        securityLevel: data_relationalStore.SecurityLevel.S1
      }
      try {
        let  rdbStore:data_relationalStore.RdbStore | undefined = undefined;
        rdbStore = await data_relationalStore.getRdbStore(context, default_config2);
        await rdbStore.executeSql(CREATE_TABLE_TEST,null);
        await rdbStore.insert("test", valueBucket3)
        let number = await rdbStore.attach(context, default_config1, "attachDB");
        console.log(TAG+"attach success,number:"+number)
        expect(1).assertEqual(number);
        rdbStore = await data_relationalStore.getRdbStore(context, default_config2)
        let resultSet = await rdbStore.querySql("select * from attachDB.test");
        console.log(TAG + "query" + resultSet + "resultSet2.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "rdbstore1.db");
        await data_relationalStore.deleteRdbStore(context, "rdbstore2.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2500 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2600
     * @tc.name no encrpy attach encrpy,cryptoParam is no default
     * @tc.desc no encrpy attach encrpy,cryptoParam is no default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest2600', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2600 start *************");
      let default_config1 : data_relationalStore.StoreConfig = {
        name: "rdbstore1.db",
        encrypt: true,
        securityLevel: data_relationalStore.SecurityLevel.S1,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 2048
        }
      }
      let attachStore: data_relationalStore.RdbStore | undefined = undefined;
      attachStore = await data_relationalStore.getRdbStore(context, default_config1);
      await attachStore.executeSql(CREATE_TABLE_TEST, null)
      await attachStore.insert("test", valueBucket1)
      await attachStore.insert("test", valueBucket2)
      await attachStore.close()
      let default_config2 : data_relationalStore.StoreConfig = {
        name: "rdbstore2.db",
        securityLevel: data_relationalStore.SecurityLevel.S1
      }
      try {
        let  rdbStore:data_relationalStore.RdbStore | undefined = undefined;
        rdbStore = await data_relationalStore.getRdbStore(context, default_config2);
        await rdbStore.executeSql(CREATE_TABLE_TEST,null);
        await rdbStore.insert("test", valueBucket3)
        let number = await rdbStore.attach(context, default_config1, "attachDB");
        console.log(TAG+"attach success,number:"+number)
        expect(1).assertEqual(number);
        rdbStore = await data_relationalStore.getRdbStore(context, default_config2)
        let resultSet = await rdbStore.querySql("select * from attachDB.test");
        console.log(TAG + "query" + resultSet + "resultSet2.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "rdbstore1.db");
        await data_relationalStore.deleteRdbStore(context, "rdbstore2.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2600 end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2700
     * @tc.name no encrpy attach encrpy,cryptoParam is invalid params
     * @tc.desc no encrpy attach encrpy,cryptoParam is invalid params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('rdbDecryptTest2700', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2700 start *************");
      let default_config1 : data_relationalStore.StoreConfig = {
        name: "rdbstore1.db",
        encrypt: true,
        securityLevel: data_relationalStore.SecurityLevel.S1,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: 1,
          hmacAlgo: 1,
          kdfAlgo: 1,
          cryptoPageSize: 65536.7
        }
      }
      let attachStore: data_relationalStore.RdbStore | undefined = undefined;
      attachStore = await data_relationalStore.getRdbStore(context, default_config1);
      await attachStore.executeSql(CREATE_TABLE_TEST, null)
      await attachStore.insert("test", valueBucket1)
      await attachStore.insert("test", valueBucket2)
      await attachStore.close()
      let default_config2 : data_relationalStore.StoreConfig = {
        name: "rdbstore2.db",
        securityLevel: data_relationalStore.SecurityLevel.S1
      }
      let  rdbStore:data_relationalStore.RdbStore | undefined = undefined;
      rdbStore = await data_relationalStore.getRdbStore(context, default_config2);
      await rdbStore.executeSql(CREATE_TABLE_TEST,null);
      await rdbStore.insert("test", valueBucket3)
      console.log(TAG+"insert success")
      let default_config3 : data_relationalStore.StoreConfig = {
        name: "rdbstore1.db",
        encrypt: true,
        securityLevel: data_relationalStore.SecurityLevel.S1,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: 4,
          hmacAlgo: 5,
          kdfAlgo: 6,
          cryptoPageSize: 65536.7
        }
      }

      try {
        await rdbStore.attach(context, default_config3, "attachDB");
        expect(null).assertFail()
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual(14800000)
        await data_relationalStore.deleteRdbStore(context, "rdbstore1.db");
        await data_relationalStore.deleteRdbStore(context, "rdbstore2.db");
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2700 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2800
     * @tc.name encrpy attach encrpy,cryptoParam is no default
     * @tc.desc encrpy attach encrpy,cryptoParam is no default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest2800', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2800 start *************");
      let default_config1 : data_relationalStore.StoreConfig = {
        name: "rdbstore1.db",
        encrypt: true,
        securityLevel: data_relationalStore.SecurityLevel.S1,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 2048
        }
      }
      let attachStore: data_relationalStore.RdbStore | undefined = undefined;
      attachStore = await data_relationalStore.getRdbStore(context, default_config1);
      await attachStore.executeSql(CREATE_TABLE_TEST, null)
      await attachStore.insert("test", valueBucket1)
      await attachStore.insert("test", valueBucket2)
      await attachStore.close()
      let default_config2 : data_relationalStore.StoreConfig = {
        name: "rdbstore2.db",
        encrypt: true,
        securityLevel: data_relationalStore.SecurityLevel.S1,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: 1,
          hmacAlgo: 1,
          kdfAlgo: 1,
          cryptoPageSize: 65536.7
        }
      }
      try {
        let  rdbStore:data_relationalStore.RdbStore | undefined = undefined;
        rdbStore = await data_relationalStore.getRdbStore(context, default_config2);
        await rdbStore.executeSql(CREATE_TABLE_TEST,null);
        await rdbStore.insert("test", valueBucket3)
        let number = await rdbStore.attach(context, default_config1, "attachDB");
        console.log(TAG+"attach success,number:"+number)
        expect(1).assertEqual(number);
        rdbStore = await data_relationalStore.getRdbStore(context, default_config2)
        let resultSet = await rdbStore.querySql("select * from attachDB.test");
        console.log(TAG + "query" + resultSet + "resultSet2.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        await data_relationalStore.deleteRdbStore(context, "rdbstore1.db");
        await data_relationalStore.deleteRdbStore(context, "rdbstore2.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2800 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CryptoParamJsAPITest_2900
     * @tc.name no encrpy attach encrpy,cryptoParam is no default
     * @tc.desc no encrpy attach encrpy,insert data from encrpy to noencrpy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('rdbDecryptTest2900', 0, async (done: Function) => {
      console.log(TAG + "************* rdbDecryptTest2900 start *************");
      let default_config1 : data_relationalStore.StoreConfig = {
        name: "rdbstore1.db",
        encrypt: true,
        securityLevel: data_relationalStore.SecurityLevel.S1,
        cryptoParam: {
          encryptionKey: new Uint8Array([1,2,3,4,5,6,7]),
          iterationCount: 25000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 2048
        }
      }
      let attachStore: data_relationalStore.RdbStore | undefined = undefined;
      attachStore = await data_relationalStore.getRdbStore(context, default_config1);
      await attachStore.executeSql(CREATE_TABLE_TEST, null)
      await attachStore.insert("test", valueBucket1)
      await attachStore.insert("test", valueBucket2)
      await attachStore.close()
      let default_config2 : data_relationalStore.StoreConfig = {
        name: "rdbstore2.db",
        securityLevel: data_relationalStore.SecurityLevel.S1
      }
      try {
        let  rdbStore:data_relationalStore.RdbStore | undefined = undefined;
        rdbStore = await data_relationalStore.getRdbStore(context, default_config2);
        await rdbStore.executeSql(CREATE_TABLE_TEST,null);
        let number = await rdbStore.attach(context, default_config1, "attachDB");
        console.log(TAG+"attach success,number:"+number)
        expect(1).assertEqual(number);
        let resultSet = await rdbStore.querySql("select * from attachDB.test");
        console.log(TAG + "query" + resultSet + "resultSet2.rowCount"+ resultSet.rowCount);
        expect(resultSet.rowCount==2).assertTrue()
        resultSet.close()
        await rdbStore.insert("test", valueBucket3)
        let resultSet1 = await rdbStore.querySql("select * from test");
        console.log(TAG + "query" + resultSet + "resultSet2.rowCount"+ resultSet1.rowCount);
        expect(resultSet1.rowCount==1).assertTrue()
        resultSet1.close()
        let number1 = await rdbStore.detach("attachDB",2)
        expect(0).assertEqual(number1);
        await data_relationalStore.deleteRdbStore(context, "rdbstore1.db");
        await data_relationalStore.deleteRdbStore(context, "rdbstore2.db");
        console.log(TAG + "Delete rdbstore success")
        done()
      } catch (err) {
        console.log(TAG +"failed, error code: "+err.code, "err message:"+ err.message);
        expect().assertFail()
        done()
      }
      console.log(TAG + "************* rdbDecryptTest2900 end *************");
    })
  })
}