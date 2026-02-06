/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { unifiedDataChannel } from '@kit.ArkData';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[RDB_REKEY_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
let rdbStore:data_relationalStore.RdbStore | undefined = undefined;
export default function rdbstoreRekeyEtsTest() {
  describe('rdbstoreRekeyEtsTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll');
    });
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context,"testRekey.db")
    });
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    });

    console.log(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0100
     * @tc.name testRekey0001
     * @tc.desc invalid parameters test
     */
    it('testRekey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0001 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: -1,
      };
      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code==14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testRekey0001 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0200
     * @tc.name testRekey0002
     * @tc.desc invalid parameters test
     */
    it('testRekey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) =>{
      console.log(TAG + "************* testRekey0002 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        encryptionAlgo: -1,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code==14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testRekey0002 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0300
     * @tc.name testRekey0003
     * @tc.desc invalid parameters test
     */
    it('testRekey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0003 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        hmacAlgo: -1,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code==14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testRekey0003 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0400
     * @tc.name testRekey0004
     * @tc.desc invalid parameters test
     */
    it('testRekey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0004 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        kdfAlgo: -1,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code==14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testRekey0004 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0500
     * @tc.name testRekey0005
     * @tc.desc invalid parameters test
     */
    it('testRekey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0005 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        cryptoPageSize: -1,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code==14800001).assertTrue();
        done();
      }
      console.log(TAG + "************* testRekey0005 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0600
     * @tc.name testRekey0006
     * @tc.desc non-encrypted database rekey test
     */
    it('testRekey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0006 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };
      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0006 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0700
     * @tc.name testRekey0007
     * @tc.desc exception iterationCount test
     */
    it('testRekey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0007 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: 500,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0007 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0800
     * @tc.name testRekey0008
     * @tc.desc exception encryptionAlgo test
     */
    it('testRekey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0008 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        encryptionAlgo: 1,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0008 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_0900
     * @tc.name testRekey0009
     * @tc.desc exception hmacAlgo test
     */
    it('testRekey0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0009 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        hmacAlgo: 2,
      };
      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0009 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1000
     * @tc.name testRekey0010
     * @tc.desc exception kdfAlgo test
     */
    it('testRekey0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0010 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        kdfAlgo: 2,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0010 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1100
     * @tc.name testRekey0011
     * @tc.desc exception cryptoPageSize test
     */
    it('testRekey0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0011 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        cryptoPageSize: 2048,
      };
      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0011 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1200
     * @tc.name testRekey0012
     * @tc.desc custom encrypt rekey test
     */
    it('testRekey0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0012 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1)
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekey0012 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1300
     * @tc.name testRekey0013
     * @tc.desc custom encrypt rekey test
     */
    it('testRekey0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0013 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(TAG + "catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0013 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1400
     * @tc.name testRekey0014
     * @tc.desc rekey test
     */
    it('testRekey0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0014 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekey0014 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1500
     * @tc.name testRekey0015
     * @tc.desc rekey test
     */
    it('testRekey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0015 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0015 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1600
     * @tc.name testRekey0016
     * @tc.desc transaction rekey test
     */
    it('testRekey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0016 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let SQL_CREATE_TABLE =
        'CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER)';
      await rdbStore.executeSql(SQL_CREATE_TABLE);

      let transaction = await rdbStore?.createTransaction({
        transactionType: data_relationalStore.TransactionType.DEFERRED
      });

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "id": 1,
          "name": "lisi",
          "age": 18,
        }
        await transaction.insert("employee", valueBucket)
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(14800015));
        done();
      }
      console.log(TAG + "************* testRekey0016 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1700
     * @tc.name testRekey0017
     * @tc.desc transaction rekey test
     */
    it('testRekey0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0017 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let SQL_CREATE_TABLE =
        'CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER)';
      await rdbStore.executeSql(SQL_CREATE_TABLE);

      let transaction = await rdbStore?.createTransaction({
        transactionType: data_relationalStore.TransactionType.EXCLUSIVE
      });

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "id": 1,
          "name": "lisi",
          "age": 18,
        }
        await transaction.insert("employee", valueBucket)
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(14800015));
        done();
      }
      console.log(TAG + "************* testRekey0017 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1800
     * @tc.name testRekey0018
     * @tc.desc other parameters rekey test
     */
    it('testRekey0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0018 start *************");
      let storeConfig : data_relationalStore.StoreConfig= {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        await rdbStore.rekey(undefined);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekey0018 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_1900
     * @tc.name testRekey0019
     * @tc.desc other parameters rekey test
     */
    it('testRekey0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0019 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        await rdbStore.rekey(null);
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekey0019 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_2000
     * @tc.name testRekey0020
     * @tc.desc other parameters rekey test
     */
    it('testRekey0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0020 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        await rdbStore.rekey();
        let  u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let resultSet = await rdbStore.query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* testRekey0020 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_2100
     * @tc.name testRekey0021
     * @tc.desc other parameters rekey test
     */
    it('testRekey0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0021 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        const resultSet = await rdbStore.query(predicates);
        resultSet.goToNextRow();
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(14800015));
        done();
      }
      console.log(TAG + "************* testRekey0021 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_2200
     * @tc.name testRekey0022
     * @tc.desc exception iterationCount test
     */
    it('testRekey0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0022 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        iterationCount: 500,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0022 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_2300
     * @tc.name testRekey0023
     * @tc.desc exception encryptionAlgo test
     */
    it('testRekey0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0023 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        encryptionAlgo: 1,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0023 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_2400
     * @tc.name testRekey0024
     * @tc.desc exception hmacAlgo test
     */
    it('testRekey0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0024 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        hmacAlgo: 2,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0024 end *************");
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_2500
     * @tc.name testRekey0025
     * @tc.desc exception kdfAlgo test
     */
    it('testRekey0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0025 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        kdfAlgo: 2,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(String(err.code)).assertEqual(String(801));
        done();
      }
      console.log(TAG + "************* testRekey0025 end *************");
    });
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_reKeyJsAPITest_2600
     * @tc.name testRekey0026
     * @tc.desc other parameters rekey test
     */
    it('testRekey0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
      console.log(TAG + "************* testRekey0026 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
	  rdbStore.close();
      try {
        await rdbStore.rekey();
		expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(err.code == 14800014).assertTrue();
        done();
      }
      console.log(TAG + "************* testRekey0026 end *************");
    });
    console.log(TAG + "*************Unit Test End*************");
  })
}